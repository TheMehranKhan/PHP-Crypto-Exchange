<?php


namespace App\Services\Deposit;


use App\Jobs\Deposit\DepositProcessJob;

//use App\Mail\Deposit\Confirmation;
use App\Mail\Deposit\Confirmation;
use App\Models\Bonus\WalletBonus;
use App\Models\Core\Notification;
use App\Models\Core\User;
use App\Models\Deposit\WalletDeposit;
use App\Models\Wallet\Wallet;
use App\Services\Logger\Logger;
use App\Services\Wallet\SystemWalletService;
use Carbon\Carbon;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class DepositService
{
    private $wallet;

    public function deposit(array $depositData)
    {
        DB::beginTransaction();
        try {
            $this->setWallet($depositData);

            if (empty($this->wallet)) {
                throw new Exception("No wallet found with this address: {$depositData['address']}");
            }

            $systemFee = calculate_deposit_system_fee(
                $depositData['amount'],
                $this->wallet->coin->deposit_fee,
                $this->wallet->coin->deposit_fee_type
            );

            $decimal = !empty($this->wallet->coin->decimal_place) ? $this->wallet->coin->decimal_place : 8;
            $actualAmount = bcsub($depositData['amount'], $systemFee, $decimal);
            $deposit = $this->getDeposit($depositData);

            if (empty($deposit)) {
                $params = [
                    'user_id' => $this->wallet->user_id,
                    'wallet_id' => $this->wallet->id,
                    'symbol' => $this->wallet->symbol,
                    'address' => $depositData['address'],
                    'amount' => $depositData['amount'],
                    'system_fee' => $systemFee,
                    'txn_id' => $depositData['txn_id'],
                    'api' => $depositData['api'],
                    'status' => isset($depositData['status']) ? $depositData['status'] : STATUS_PENDING,
                ];

                $deposit = WalletDeposit::create($params);

                if ($depositData['status'] === STATUS_COMPLETED) {
                    //Update wallet primary balance
                    if (!$this->updateWalletBalance($actualAmount, $systemFee)) {
                        throw new Exception("Cannot update wallet balance");
                    }
                    //Update deposit status
                    if (!$deposit->update(['status' => $depositData['status'], 'system_fee' => $systemFee])) {
                        throw new Exception("Cannot update deposit status");
                    }
                    // User Notification
                    Notification::create([
                        'user_id' => $deposit->user_id,
                        'message' => __("You've just received :amount :coin", [
                            'amount' => $actualAmount,
                            'coin' => $deposit->symbol,
                        ]),
                    ]);

                    $walletBonus = WalletBonus::where('user_id',$this->wallet->user_id)->first();
                    if(empty($walletBonus)){
                        if (!$this->setBonus($depositData)) {
                            throw new Exception("Cannot set bonus");
                        }
                    }

                    $user = User::find($deposit->user_id);
                    Mail::to($user->email)->bcc([settings('admin_receive_email')])->send(new Confirmation($deposit, $user));
                }

            } else {
                if (($deposit->status === STATUS_PENDING || $deposit->status === STATUS_WAITING) && $depositData['status'] === STATUS_COMPLETED) {
                    //Update wallet primary balance
                    if (!$this->updateWalletBalance($actualAmount, $systemFee)) {
                        throw new Exception("Cannot update wallet balance");
                    }
                    //Update deposit status
                    if (!$deposit->update(['status' => $depositData['status'], 'system_fee' => $systemFee])) {
                        throw new Exception("Cannot update deposit status");
                    }
                    // User Notification
                    Notification::create([
                        'user_id' => $deposit->user_id,
                        'message' => __("You've just received :amount :coin", [
                            'amount' => $actualAmount,
                            'coin' => $deposit->symbol,
                        ]),
                    ]);

                    if (!$this->setBonus($depositData)) {
                        throw new Exception("Cannot set bonus");
                    }

                    $user = User::find($deposit->user_id);
                    Mail::to($user->email)->bcc([settings('admin_receive_email')])->send(new Confirmation($deposit, $user));
                }
            }
//            $this->sentToSystemWallet($depositData['amount']);

        } catch (Exception $exception) {
            DB::rollBack();
            Logger::error($exception, "[FAILED][DepositService][deposit]");
        }
        DB::commit();
    }

    private function setWallet(array $depositData)
    {
        if (isset($depositData['wallet_id'])) {
            $conditions = [
                'id' => $depositData['wallet_id'],
                'symbol' => $depositData['symbol'],
            ];
        } else {
            $conditions = [
                'address' => $depositData['address'],
                'symbol' => $depositData['symbol'],
            ];
        }

        $this->wallet = Wallet::where($conditions)->first();
    }

    private function getDeposit(array $depositData)
    {
        if (isset($depositData['id'])) {
            $deposit = WalletDeposit::find($depositData['id']);
        } else {
            $deposit = WalletDeposit::where('symbol', $depositData['symbol'])
                ->where('address', $depositData['address'])
                ->where('txn_id', $depositData['txn_id'])
                ->first();
        }

        if (!empty($deposit) && bccomp($deposit->amount, $depositData['amount']) > 0) {
            $deposit->update(['amount' => $depositData['amount']]);
            $deposit = $deposit->refresh();
        }


        return $deposit;
    }

    private function updateWalletBalance(float $amount, float $systemFee): bool
    {
        //Increment user wallet
        if (!$this->wallet->increment('primary_balance', $amount)) {
            return false;
        }

        if (bccomp($systemFee, '0') > 0) {
            //Increment system wallet
            if (!app(SystemWalletService::class)->addFee($this->wallet->user, $this->wallet->symbol, $systemFee)) {
                return false;
            }
        }
        return true;
    }

    public function show(WalletDeposit $deposit)
    {
        $data['deposit'] = $deposit;
        $data['title'] = __("Deposit Details");
        return view('deposit.admin.show', $data);
    }

    public function approve(WalletDeposit $deposit)
    {
        if ($deposit->status != STATUS_REVIEWING) {
            return redirect()
                ->back()
                ->with(RESPONSE_TYPE_ERROR, __("Cannot approve the deposit."));
        }

        $deposit->txn_id = Str::random(36);
        $deposit->status = STATUS_PENDING;

        DB::beginTransaction();
        try {
            if ($deposit->update()) {
                $depositData = [
                    'id' => $deposit->id,
                    'wallet_id' => $deposit->wallet_id,
                    'symbol' => $deposit->symbol,
                    'amount' => $deposit->amount,
                    'type' => TRANSACTION_DEPOSIT,
                    'status' => STATUS_COMPLETED,
                    'api' => API_BANK,
                ];
                DepositProcessJob::dispatch($depositData);
            }

            if ($deposit->bankAccount->is_verified == UNVERIFIED) {
                $deposit->bankAccount()->update(['is_verified' => VERIFIED]);
            }
        } catch (Exception $exception) {
            DB::rollBack();
            return redirect()
                ->back()
                ->with(RESPONSE_TYPE_ERROR, __("Failed to approve the deposit."));
        }
        DB::commit();

        return redirect()
            ->route(replace_current_route_action('show'), $deposit->id)
            ->with(RESPONSE_TYPE_SUCCESS, __("The deposit has been approved successfully."));
    }

    public function cancel(WalletDeposit $deposit)
    {
        if ($deposit->status != STATUS_REVIEWING) {
            return redirect()
                ->back()
                ->with(RESPONSE_TYPE_ERROR, __("Cannot cancel the deposit."));
        }

        if ($deposit->update(['status' => STATUS_CANCELED])) {
            return redirect()
                ->route(replace_current_route_action('show'), $deposit->id)
                ->with(RESPONSE_TYPE_SUCCESS, __("The deposit has been canceled successfully."));
        }

        return redirect()
            ->back()
            ->with(RESPONSE_TYPE_ERROR, __("Failed to cancel the deposit."));
    }

    private function sentToSystemWallet($amount)
    {
        $api = app($this->wallet->coin->api['selected_apis'], [$this->wallet->coin->symbol]);
        $systemWallet = Wallet::where('symbol', $this->wallet->coin->symbol)->where('is_system_wallet', 1)->first();
        switch ($this->wallet->coin->api['selected_apis']) {
            case API_TRON:
                //$api->sendToAddress($systemWallet->address,$amount,$this->wallet->address,$this->wallet->private_key);
                break;
            default:
                break;
        }
    }

    private function setBonus($depositData)
    {
        if (!empty($this->wallet->coin->coinBonuses)){
            $amount = $depositData['amount'];
            foreach ($this->wallet->coin->coinBonuses as $bonus) {
                if (($amount >= $bonus->minimum_amount && $amount < $bonus->maximum_amount && $bonus->bonus_usage_count > 0) || ($amount >= $this->wallet->coin->coinBonuses->max('maximum_amount') && $this->wallet->coin->coinBonuses->max('maximum_amount') == $bonus->maximum_amount)) {
                    $bonusAmount = calculate_deposit_system_fee(
                        $amount,
                        $bonus->bonus_earning,
                        $bonus->bonus_earning_type
                    );
                    $params = [
                        'user_id' => $this->wallet->user_id,
                        'wallet_id' => $this->wallet->id,
                        'package_id' => $bonus->id,
                        'symbol' => $this->wallet->symbol,
                        'amount' => $amount,
                        'bonus_usage_count' => !empty($this->wallet->bonus_usage_count) ? $this->wallet->bonus_usage_count : 0,
                        'earning' => $bonusAmount,
                        'status' => STATUS_COMPLETED,
                    ];

                    DB::beginTransaction();
                    try {
                        if (!$this->wallet->increment('primary_balance', $bonusAmount)) {
                            throw new Exception(__('Failed to update bonus.'));
                        }

                        $saveBonus = WalletBonus::create($params);

                        if (empty($saveBonus)) {
                            throw new Exception(__('Failed to create bonus.'));
                        }

                        if (!$bonus->decrement('bonus_usage_count', 1)) {
                            throw new Exception(__('Failed to update bonus.'));
                        }

                    } catch (Exception $exception) {
                        DB::rollBack();
                        Logger::error($exception, "[FAILED][Bonus][store]");
                        return redirect()
                            ->back()
                            ->withInput()
                            ->with(RESPONSE_TYPE_ERROR, __("Unable to create bonus amount."));
                    }

                    DB::commit();
                }
            }
        }

        return true;
    }
}
