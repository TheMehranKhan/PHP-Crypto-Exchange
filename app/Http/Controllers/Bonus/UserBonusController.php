<?php

namespace App\Http\Controllers\Bonus;

use App\Http\Controllers\Controller;
use App\Http\Requests\Coin\CoinStakeRequest;
use App\Http\Requests\Stake\StakeRequest;
use App\Models\Coin\CoinStake;
use App\Models\Wallet\Wallet;
use App\Models\Stake\WalletStake;
use App\Override\Logger;
use App\Services\Core\DataTableService;
use App\Services\Wallet\SystemWalletService;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;
use ReflectionClass;

class UserBonusController extends Controller
{
    public function index(Wallet $wallet): View
    {
        $searchFields = [
            ['id', __('Reference ID')],
            ['amount', __('Amount')],
            ['staking_months', __('Staking Months')],
            ['earning', __('Earning')],
            ['symbol', __('Symbol')],
        ];

        $orderFields = [
            ['id', __('Reference ID')],
            ['created_at', __('Date')],
        ];

        $filterFields = [
            ['status', __('Status'), transaction_status()],
        ];

        $queryBuilder = $wallet->stakes()
            ->orderBy('created_at', 'desc');

        $data['dataTable'] = app(DataTableService::class)
            ->setSearchFields($searchFields)
            ->setOrderFields($orderFields)
            ->setFilterFields($filterFields)
            ->create($queryBuilder);

        $data['wallet'] = $wallet;
        $data['title'] = __(':coin Stake History', ['coin' => $wallet->symbol]);

        return view('stake.user.index', $data);
    }

    public function create(Wallet $wallet)
    {
        $data['title'] = __('Stake :coin', ['coin' => $wallet->symbol]);
        $data['wallet'] = $wallet;

        if (count($wallet->coin->coinStakes) !== 0) {
            return view('stake.user.create', $data);
        }

        return redirect()->back()
            ->with(RESPONSE_TYPE_ERROR, __("The stake service is currently disabled for this coin. Please try another coin or sometime later."));
    }

    public function store(StakeRequest $request, Wallet $wallet)
    {
        if (count($wallet->coin->coinStakes) == 0) {
            return redirect()
                ->back()
                ->withInput()
                ->with(RESPONSE_TYPE_ERROR, __("The stake service is currently disabled. Please try sometime later."));
        }

        if (bccomp($request->get('amount'), $wallet->primary_balance) > 0) {
            return redirect()
                ->back()
                ->withInput()
                ->with(RESPONSE_TYPE_ERROR, __("You don't have enough balance to stake!. Your current balance is :amount", [
                        'amount' => $wallet->primary_balance,
                    ])
                );
        }
        $stake_package = CoinStake::find($request->get('stake_package'));
        $system_fee = calculate_withdrawal_system_fee(
            $request->get('amount'),
            $stake_package->stake_fee,
            $stake_package->stake_fee_type
        );

        $earning_fee = calculate_deposit_system_fee(
            $request->get('amount'),
            $stake_package->stake_earning,
            $stake_package->stake_earning_type
        );

        $final_amount = bcsub($request->get('amount'),$system_fee);
        $final_earning = bcadd($final_amount,$earning_fee);

        $params = [
            'user_id' => Auth::id(),
            'wallet_id' => $wallet->id,
            'package_id' => $request->get('stake_package'),
            'symbol' => $wallet->symbol,
            'amount' => $final_amount,
            'system_fee' => $system_fee,
            'staking_months' => $stake_package->stake_month,
            'earning' => $final_earning,
            'completed_at' => Carbon::now()->addMonth($stake_package->stake_month),
            'status' => STATUS_PROCESSING,
        ];

        DB::beginTransaction();
        try {
            if (!$wallet->decrement('primary_balance', $request->get('amount'))) {
                throw new Exception(__('Failed to update wallet.'));
            }

            $stake = WalletStake::create($params);

            if (empty($stake)) {
                throw new Exception(__('Failed to create stake.'));
            }

            if (bccomp($system_fee, '0') > 0) {
                if (!app(SystemWalletService::class)->addFee($wallet->user, $wallet->symbol, $system_fee)) {
                    throw new Exception(__("Failed to update system fee in stake to system wallet."));
                }
            }

        } catch (Exception $exception) {
            DB::rollBack();
            Logger::error($exception, "[FAILED][Stake][store]");
            return redirect()
                ->back()
                ->withInput()
                ->with(RESPONSE_TYPE_ERROR, __("Unable to stake amount."));
        }

        DB::commit();

        return redirect()
            ->route('user.wallets.stakes.index', ['wallet' => $wallet->symbol])
            ->with(RESPONSE_TYPE_SUCCESS, __("Your stake has been placed successfully."));
    }

    public function show(Wallet $wallet, WalletStake $stake)
    {
        $wallet->load('coin');

        $data['wallet'] = $wallet;
        $data['stake'] = $stake;
        $data['package'] = CoinStake::find($stake->package_id);
        $data['title'] = __("Stake Details");
        return view('stake.user.show', $data);
    }

    public function confirmation(Wallet $wallet, WalletWithdrawal $withdrawal, Request $request)
    {
        if (!$request->hasValidSignature()) {
            abort(401, __("Link is expired!!."));
        } else if (!Auth::check()) {
            abort(401, __("You are not authorized for this action."));
        } else if (Auth::check() && Auth::id() != $withdrawal->user_id) {
            abort(401, __("You are not authorized for this action."));
        } else if ($wallet->id != $withdrawal->wallet_id) {
            abort(401, __("You are not authorized for this action."));

        }

        $message = __("Withdrawal has been confirmed successfully. It will be processed shortly.");
        if (settings('is_admin_approval_required') || $withdrawal->api === API_BANK) {
            $withdrawal->update(['status' => STATUS_REVIEWING]);
            $message = __("Withdrawal has been confirmed successfully. It will require admin approval for further process.");
        } else {
            if ($withdrawal->update(['status' => STATUS_PENDING])) {
                WithdrawalProcessJob::dispatch($withdrawal);
            } else {
                abort(404, __("Failed to confirm withdrawal."));
            }
        }

        return redirect()
            ->route('user.wallets.withdrawals.show', ['wallet' => $withdrawal->symbol, 'withdrawal' => $withdrawal->id])
            ->with(RESPONSE_TYPE_SUCCESS, $message);
    }

    public function destroy(Wallet $wallet, WalletStake $stake)
    {
        if (!in_array($stake->status, [STATUS_PROCESSING])) {
            return redirect()
                ->route('user.wallets.stakes.show', [$stake->symbol, $stake->id])
                ->with(RESPONSE_TYPE_ERROR, __("The stake cannot be canceled."));
        }

        if ($stake->update(['status' => STATUS_CANCELING])) {
            return redirect()
                ->route('user.wallets.stakes.index', $stake->symbol)
                ->with(RESPONSE_TYPE_SUCCESS, __("The stake cancellation will be processed shortly."));
        }
        return redirect()
            ->back()
            ->with(RESPONSE_TYPE_ERROR, __("Failed to cancel stake."));
    }
}
