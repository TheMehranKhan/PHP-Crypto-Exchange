<?php

namespace App\Http\Controllers\Deposit;

use App\Http\Controllers\Controller;
use App\Http\Requests\Deposit\BankReceiptUploadRequest;
use App\Http\Requests\Deposit\UserDepositRequest;
use App\Models\Balance;
use App\Models\Coin\Coin;
use App\Models\BankAccount\BankAccount;
use App\Models\Deposit\WalletDeposit;
use App\Models\Deposit\GatewayTransaction;
use App\Services\Wallet\SystemWalletService;
use App\Models\Wallet\Wallet;
use App\Services\Core\DataTableService;
use App\Services\Core\FileUploadService;
use App\Services\Wallet\GenerateWalletAddressImage;
use Codemenco\Gateway\Mellat\Mellat;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Str;
use Illuminate\View\View;
use Codemenco\Advcash\Advcash;
use Codemenco\Gateway\Idpay\Idpay;
use Codemenco\Gateway\Payir\Payir;
use Codemenco\Gateway\Vendar\Vendar;
use Codemenco\Gateway\Zarinpal\Zarinpal;

class UserDepositController extends Controller
{
    public function index(Wallet $wallet): View
    {
        $searchFields = [
            ['id', __('Reference ID')],
            ['amount', __('Amount')],
            ['address', __('Address')],
            ['bank_name', __('Bank'), 'bankAccount'],
            ['txn_id', __('Transaction ID')],
            ['symbol', __('Wallet')],
        ];

        $orderFields = [
            ['amount', __('Amount')],
            ['address', __('Address')],
            ['symbol', __('Wallet')],
            ['created_at', __('Date')],
        ];

        $filterFields = [
            ['status', __('Status'), transaction_status()],
        ];

        $queryBuilder = $wallet->deposits()
            ->with("bankAccount")
            ->orderBy('created_at', 'desc');

        $data['dataTable'] = app(DataTableService::class)
            ->setSearchFields($searchFields)
            ->setOrderFields($orderFields)
            ->setFilterFields($filterFields)
            ->create($queryBuilder);

        $data['title'] = __("Deposit History");
        return view('deposit.user.index', $data);
    }

    public function create(Wallet $wallet)
    {
        $data['wallet'] = $wallet;
        $data['title'] = __('Deposit :coin', ['coin' => $wallet->symbol]);
        if (in_array($wallet->coin->type, [COIN_TYPE_CRYPTO, COIN_TYPE_ERC20, COIN_TYPE_BEP20, COIN_TYPE_TRC10, COIN_TYPE_TRC20])) {
            $data['walletAddress'] = __('Deposit is currently disabled.');
            if ($wallet->coin->deposit_status == ACTIVE) {
                $api = $wallet->coin->getAssociatedApi();

                if ($wallet->address) {
                    $data['walletAddress'] = $wallet->address;
                    $data['private_key'] = $wallet->private_key;
                    $data['public_key'] = $wallet->public_key;
                } else {
                    if (is_null($api)) {
                        $data['walletAddress'] = __('Unable to generate address.');
                    } else {
                        switch ($wallet->coin->api['selected_apis']) {
                            case API_TRC20:
                            case API_TRC10:
                            case API_TRON:
                                $response = $this->getParentWalletAddress($wallet->user_id, [COIN_TYPE_TRC20, COIN_TYPE_TRC10], "TRX");
                                if (empty($response)) {
                                    $response = $api->generateAddress();
                                }
                                if (empty(Redis::get('tronAddresses'))) {
                                    Redis::set('tronAddresses', $data['walletAddress']);
                                } else {
                                    $redisList = Redis::get('tronAddresses');
                                    if (!Str::contains($redisList, $data['walletAddress'])) {
                                        Redis::append('tronAddresses', ',' . $data['walletAddress']);
                                    }

                                }
                                break;
                            case API_ERC20:
                            case API_ETHEREUM:
                                $response = $this->getParentWalletAddress($wallet->user_id, [COIN_TYPE_ERC20], "ETH");
                                if (empty($response)) {
                                    $response = $api->generateAddress();
                                }
                                break;
                            case API_BEP20:
                            case API_BINANCE:
                                $response = $this->getParentWalletAddress($wallet->user_id, [COIN_TYPE_BEP20], "BNB");
                                if (empty($response)) {
                                    $response = $api->generateAddress();
                                }
                                break;
                            default:
                                $response = $api->generateAddress();
                                break;
                        }
                        if ($response['error'] === 'ok') {
                            $params = ['address' => $response['result']['address']];
                            if (isset($response['result']['passphrase'])) {
                                $params['passphrase'] = $response['result']['passphrase'];
                            }
                            if (isset($response['result']['privateKey'])) {
                                $params['private_key'] = $response['result']['privateKey'];
                            }
                            if (isset($response['result']['publicKey'])) {
                                $params['public_key'] = $response['result']['publicKey'];
                            }
                            $wallet->update($params);
                            $data['walletAddress'] = $response['result']['address'];
                        } else {
                            $data['walletAddress'] = $response['error'];
                        }
                    }
                }
                $data['addressSvg'] = app(GenerateWalletAddressImage::class)->generateSvg($data['walletAddress']);
            }
            return view('deposit.user.wallet_address', $data);
        } else if ($wallet->coin->type == COIN_TYPE_FIAT) {
            if (settings('enable_kyc_verification_in_exchange') && Auth::user()->is_id_verified != VERIFIED) {
                return redirect()
                    ->back()
                    ->with(RESPONSE_TYPE_ERROR, __("Your account must be KYC verified to place an order."))
                    ->withInput();
            }

            $data['apis'] = Arr::only(fiat_apis(), $wallet->coin->api['selected_apis'] ?? []);
            $data['bankAccounts'] = BankAccount::where('user_id', Auth::id())
                ->where('is_active', ACTIVE)
                ->where('is_verified', ACTIVE)
                ->pluck('bank_name', 'id');

            if ($wallet->coin->symbol == "IRT" && count($data['bankAccounts']) == 0) {
                return redirect()
                    ->back()
                    ->with(RESPONSE_TYPE_ERROR, __("You have to add your bank account to deposit."))
                    ->withInput();
            }
            return view('deposit.user.deposit_form', $data);
        }

        return view('errors.404', $data);
    }

    public function store(UserDepositRequest $request, Wallet $wallet)
    {
        if ($request->get('api') === API_BANK) {

            if (bccomp($wallet->coin->minimum_deposit_amount, $request->amount) > 0) {
                return redirect()
                    ->back()
                    ->with(RESPONSE_TYPE_ERROR, __("The deposit amount must be greater than :amount.", [
                        'amount' => $wallet->coin->minimum_deposit_amount
                    ]))
                    ->withInput();
            }

            $systemFee = calculate_deposit_system_fee(
                $request->get('amount'),
                $wallet->coin->deposit_fee,
                $wallet->coin->deposit_fee_type
            );

            $params = [
                'user_id' => Auth::id(),
                'wallet_id' => $wallet->id,
                'symbol' => $wallet->symbol,
                'bank_account_id' => $request->get('bank_account_id'),
                'amount' => $request->get('amount'),
                'system_fee' => $systemFee,
                'api' => $request->get('api'),
                'status' => STATUS_PENDING,
            ];

            if ($deposit = WalletDeposit::create($params)) {
                return redirect()
                    ->route('user.wallets.deposits.show', ['wallet' => $wallet->symbol, 'deposit' => $deposit->id])
                    ->with(RESPONSE_TYPE_SUCCESS, __("Deposit has been created successfully."))
                    ->withInput();
            }
        } elseif ($request->get('api') == API_ADVCASH) {
            if (bccomp($wallet->coin->minimum_deposit_amount, $request->amount) > 0) {
                return redirect()
                    ->back()
                    ->with(RESPONSE_TYPE_ERROR, __("The deposit amount must be greater than :amount.", [
                        'amount' => $wallet->coin->minimum_deposit_amount
                    ]))
                    ->withInput();
            }

            $systemFee = calculate_deposit_system_fee(
                $request->get('amount'),
                $wallet->coin->deposit_fee,
                $wallet->coin->deposit_fee_type
            );

            $params = [
                'user_id' => Auth::id(),
                'wallet_id' => $wallet->id,
                'symbol' => $wallet->symbol,
                'bank_account_id' => $request->get('bank_account_id'),
                'amount' => $request->get('amount'),
                'system_fee' => $systemFee,
                'api' => $request->get('api'),
                'status' => STATUS_PENDING,
            ];

            if ($deposit = WalletDeposit::create($params)) {

                $final_amount = $request->get('amount') + $systemFee;
                $pm = new Advcash;
                $formHtml = $pm->createBitcoinRequest($final_amount, $deposit->id);
                return $formHtml;

            }

        } elseif ($request->get('api') == API_MELLAT) {
            if (bccomp($wallet->coin->minimum_deposit_amount, $request->amount) > 0) {
                return redirect()
                    ->back()
                    ->with(RESPONSE_TYPE_ERROR, __("The deposit amount must be greater than :amount.", [
                        'amount' => $wallet->coin->minimum_deposit_amount
                    ]))
                    ->withInput();
            }

            $systemFee = calculate_deposit_system_fee(
                $request->get('amount'),
                $wallet->coin->deposit_fee,
                $wallet->coin->deposit_fee_type
            );
            $params = [
                'user_id' => Auth::id(),
                'wallet_id' => $wallet->id,
                'symbol' => $wallet->symbol,
                'bank_account_id' => $request->get('bank_account_id'),
                'amount' => $request->get('amount'),
                'system_fee' => $systemFee,
                'api' => $request->get('api'),
                'status' => STATUS_PENDING,
            ];

            if ($deposit = WalletDeposit::create($params)) {

                try {
                    $gateway = \Gateway::make(new Mellat());

                    $gateway->setCallback(route('payment.callback', ['wallet' => $wallet]));
                    $gateway->setCustom(Auth::id(), $deposit->id);
                    $gateway->price((int)$request->get('amount'))->ready();
                    $refId = $gateway->refId();
                    $transID = $gateway->transactionId();

                    return $gateway->redirect();
                } catch (Exception $e) {
                    return redirect()
                        ->back()
                        ->with(RESPONSE_TYPE_ERROR, $e->getMessage())
                        ->withInput();
                }

            }

        } elseif ($request->get('api') == API_VANDAR) {
            if (bccomp($wallet->coin->minimum_deposit_amount, $request->amount) > 0) {
                return redirect()
                    ->back()
                    ->with(RESPONSE_TYPE_ERROR, __("The deposit amount must be greater than :amount.", [
                        'amount' => $wallet->coin->minimum_deposit_amount
                    ]))
                    ->withInput();
            }

            $systemFee = calculate_deposit_system_fee(
                $request->get('amount'),
                $wallet->coin->deposit_fee,
                $wallet->coin->deposit_fee_type
            );
            $params = [
                'user_id' => Auth::id(),
                'wallet_id' => $wallet->id,
                'symbol' => $wallet->symbol,
                'bank_account_id' => $request->get('bank_account_id'),
                'amount' => $request->get('amount'),
                'system_fee' => $systemFee,
                'api' => $request->get('api'),
                'status' => STATUS_PENDING,
            ];

            if ($deposit = WalletDeposit::create($params)) {

                try {
                    $gateway = \Gateway::make(new Vendar());

                    $gateway->setCallback(route('payment.callback', ['wallet' => $wallet]));
                    $gateway->setCustom(Auth::id(), $deposit->id);
                    $gateway->price((int)$request->get('amount'))->ready();
                    $refId = $gateway->refId();
                    $transID = $gateway->transactionId();

                    return $gateway->redirect();
                } catch (Exception $e) {
                    return redirect()
                        ->back()
                        ->with(RESPONSE_TYPE_ERROR, $e->getMessage())
                        ->withInput();
                }

            }

        } elseif ($request->get('api') == API_ZARINPAL) {
            if (bccomp($wallet->coin->minimum_deposit_amount, $request->amount) > 0) {
                return redirect()
                    ->back()
                    ->with(RESPONSE_TYPE_ERROR, __("The deposit amount must be greater than :amount.", [
                        'amount' => $wallet->coin->minimum_deposit_amount
                    ]))
                    ->withInput();
            }

            $systemFee = calculate_deposit_system_fee(
                $request->get('amount'),
                $wallet->coin->deposit_fee,
                $wallet->coin->deposit_fee_type
            );
            $params = [
                'user_id' => Auth::id(),
                'wallet_id' => $wallet->id,
                'symbol' => $wallet->symbol,
                'bank_account_id' => $request->get('bank_account_id'),
                'amount' => $request->get('amount'),
                'system_fee' => $systemFee,
                'api' => $request->get('api'),
                'status' => STATUS_PENDING,
            ];

            if ($deposit = WalletDeposit::create($params)) {

                try {
                    $gateway = \Gateway::make(new Zarinpal());

                    $gateway->setCallback(route('payment.callback', ['wallet' => $wallet]));
                    $gateway->setCustom(Auth::id(), $deposit->id);
                    $gateway->price((int)$request->get('amount'))->ready();
                    $refId = $gateway->refId();
                    $transID = $gateway->transactionId();

                    return $gateway->redirect();
                } catch (Exception $e) {
                    return redirect()
                        ->back()
                        ->with(RESPONSE_TYPE_ERROR, $e->getMessage())
                        ->withInput();
                }

            }

        } elseif ($request->get('api') == API_IDPAY) {
            if (bccomp($wallet->coin->minimum_deposit_amount, $request->amount) > 0) {
                return redirect()
                    ->back()
                    ->with(RESPONSE_TYPE_ERROR, __("The deposit amount must be greater than :amount.", [
                        'amount' => $wallet->coin->minimum_deposit_amount
                    ]))
                    ->withInput();
            }

            $systemFee = calculate_deposit_system_fee(
                $request->get('amount'),
                $wallet->coin->deposit_fee,
                $wallet->coin->deposit_fee_type
            );
            $params = [
                'user_id' => Auth::id(),
                'wallet_id' => $wallet->id,
                'symbol' => $wallet->symbol,
                'bank_account_id' => $request->get('bank_account_id'),
                'amount' => $request->get('amount'),
                'system_fee' => $systemFee,
                'api' => $request->get('api'),
                'status' => STATUS_PENDING,
            ];

            if ($deposit = WalletDeposit::create($params)) {

                try {
                    $gateway = \Gateway::make(new Idpay());

                    $gateway->setCallback(route('payment.callback', ['wallet' => $wallet]));
                    $gateway->setCustom(Auth::id(), $deposit->id);
                    $gateway->price((int)$request->get('amount'))->ready();
                    $refId = $gateway->refId();
                    $transID = $gateway->transactionId();

                    return $gateway->redirect();
                } catch (Exception $e) {
                    return redirect()
                        ->back()
                        ->with(RESPONSE_TYPE_ERROR, $e->getMessage())
                        ->withInput();
                }

            }

        } elseif ($request->get('api') == API_PAYIR) {
            if (bccomp($wallet->coin->minimum_deposit_amount, $request->amount) > 0) {
                return redirect()
                    ->back()
                    ->with(RESPONSE_TYPE_ERROR, __("The deposit amount must be greater than :amount.", [
                        'amount' => $wallet->coin->minimum_deposit_amount
                    ]))
                    ->withInput();
            }

            $systemFee = calculate_deposit_system_fee(
                $request->get('amount'),
                $wallet->coin->deposit_fee,
                $wallet->coin->deposit_fee_type
            );
            $params = [
                'user_id' => Auth::id(),
                'wallet_id' => $wallet->id,
                'symbol' => $wallet->symbol,
                'bank_account_id' => $request->get('bank_account_id'),
                'amount' => $request->get('amount'),
                'system_fee' => $systemFee,
                'api' => $request->get('api'),
                'status' => STATUS_PENDING,
            ];

            if ($deposit = WalletDeposit::create($params)) {

                try {
                    $gateway = \Gateway::make(new Payir());

                    $gateway->setCallback(route('payment.callback', ['wallet' => $wallet]));
                    $gateway->setCustom(Auth::id(), $deposit->id);
                    $gateway->price((int)$request->get('amount'))->ready();
                    $refId = $gateway->refId();
                    $transID = $gateway->transactionId();

                    return $gateway->redirect();
                } catch (Exception $e) {
                    return redirect()
                        ->back()
                        ->with(RESPONSE_TYPE_ERROR, $e->getMessage())
                        ->withInput();
                }

            }

        }

        return redirect()
            ->back()
            ->with(RESPONSE_TYPE_ERROR, __("Invalid request."));
    }

    public function show(Wallet $wallet, WalletDeposit $deposit)
    {
        $wallet->load('coin');
        $deposit->load('user.profile', 'bankAccount.country');
        if ($deposit->status === STATUS_PENDING && $deposit->api === API_BANK) {
            $systemBankIds = $wallet->coin->api['selected_banks'] ?? [];
            $data['systemBanks'] = BankAccount::whereIn('id', $systemBankIds)->where('is_active', ACTIVE)->with('country')->get();
        }
        $data['wallet'] = $wallet;
        $data['deposit'] = $deposit;
        $data['title'] = __("Deposit Details");
        return view('deposit.user.show', $data);
    }

    public function update(BankReceiptUploadRequest $request, Wallet $wallet, WalletDeposit $deposit)
    {
        $wallet->load('coin');
        $systemBank = $request->get('system_bank_id');
        $systemSupportedBanks = $wallet->coin->api['selected_banks'] ?? [];
        if (!in_array($systemBank, $systemSupportedBanks)) {
            return redirect()->back()->with(RESPONSE_TYPE_ERROR, __("Invalid system bank."));
        }

        if ($request->hasFile('receipt')) {
            $filePath = config('commonconfig.path_deposit_receipt');
            $receipt = app(FileUploadService::class)->upload($request->file('receipt'), $filePath, $deposit->id);
        }

        $params = ['system_bank_account_id' => $systemBank, 'receipt' => $receipt, 'status' => STATUS_REVIEWING];

        if ($deposit->update($params)) {
            return redirect()->route('user.wallets.deposits.show', ['wallet' => $wallet->symbol, 'deposit' => $deposit->id])->with(RESPONSE_TYPE_SUCCESS, __('Receipt has been uploaded successfully.'));
        }
        return redirect()->back()->withInput()->with(RESPONSE_TYPE_ERROR, __("Failed to upload receipt."));
    }

    public function getParentWalletAddress($user_id, $type, $symbol)
    {
        $response = [];
        $checkSymbol = Coin::where('symbol', $symbol)->orWhereIn('type', $type)->pluck('symbol');
        $checkWallet = Wallet::where('user_id', $user_id)
            ->whereNotNull('address')
            ->where('is_system_wallet', INACTIVE)
            ->whereIn('symbol',$checkSymbol)
            ->first();
        if (!empty($checkWallet->address) && $checkWallet->coin->api) {
            $response = [
                'error' => 'ok',
                'result' => [
                    'address' => $checkWallet->address,
                    'passphrase' => !empty($checkWallet->passphrase) ? $checkWallet->passphrase : NULL,
                    'privateKey' => !empty($checkWallet->private_key) ? $checkWallet->private_key : NULL,
                    'publicKey' => !empty($checkWallet->public_key) ? $checkWallet->public_key : NULL,
                ]
            ];
        }
        return $response;

    }

    public function callback(Wallet $wallet)
    {
        if ($wallet->user_id != Auth::id()) {
            return redirect()->back()->withInput()->with(RESPONSE_TYPE_ERROR, __("User do not matched!"));
        }

        try {
            $gateway = \Gateway::verify();
            $trackingCode = $gateway->trackingCode();
            $refId = $gateway->refId();
            $cardNumber = $gateway->cardNumber();
            $wallet->update([
                'status' => 'done',
                'description' => "شماره کارت : $cardNumber شماره پیگیری : $trackingCode"
            ]);

            //Get details of Transactions
            $getTransaction = GatewayTransaction::where('ref_id',$refId)->first();

            //Update wallet primary balance
            if (!$this->updateWalletBalance(sprintf("%.2f", $getTransaction->price/10), 0.00, $wallet)) {
                throw new Exception("Cannot update wallet balance");
            }

            $deposit = WalletDeposit::find($getTransaction->order_id);
            //Update deposit status
            if (!$deposit->update(['address' => $cardNumber, 'txn_id' => $refId, 'status' => STATUS_COMPLETED, 'system_fee' => 0.0])) {
                throw new Exception("Cannot update deposit status");
            }

            return redirect()
                ->route('user.wallets.index')
                ->with(RESPONSE_TYPE_SUCCESS, __("Deposit has been created successfully."));
            // User Notification
            Notification::create([
                'user_id' => Auth::id(),
                'message' => __("You've just received :amount :coin", [
                    'amount' => $wallet->price,
                    'coin' => $wallet->symbol,
                ]),
            ]);
            return redirect(url('user.wallets.index'));
        } catch (\Exception $e) {
            return redirect()
                ->route('user.wallets.index')
                ->with(RESPONSE_TYPE_ERROR, $e->getMessage());
        } catch (RetryException $e) {
            return redirect()
                ->route('user.wallets.index')
                ->with(RESPONSE_TYPE_ERROR, $e->getMessage());
        }
    }

    private function updateWalletBalance(float $amount, float $systemFee, Wallet $wallet): bool
    {
        //Increment user wallet
        if (!$wallet->increment('primary_balance', $amount)) {
            return false;
        }

        if (bccomp($systemFee, '0') > 0) {
            //Increment system wallet
            if (!app(SystemWalletService::class)->addFee($wallet->user, $wallet->symbol, $systemFee)) {
                return false;
            }
        }
        return true;
    }

}