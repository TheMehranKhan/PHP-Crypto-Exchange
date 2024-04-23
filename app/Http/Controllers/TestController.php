<?php

namespace App\Http\Controllers;

use Amp\Loop;
use App\Broadcasts\Exchange\OrderBroadcast;
use App\Http\Controllers\Exchange\PairDetailsController;
use App\Jobs\Deposit\DepositProcessJob;
use App\Jobs\ERC20\ProcessERC20Transaction;
use App\Jobs\Ethereum\EthereumBlockJob;
use Amp\Websocket;
use App\Jobs\Ethereum\ProcessEthereumDeposit;
use App\Jobs\Ethereum\ProcessEthereumWithdrawal;
use App\Jobs\Order\ProcessOrderJob;
use App\Jobs\Withdrawal\WithdrawalProcessJob;
use App\Mail\Core\ResetPassword;
use App\Models\Coin\Coin;
use App\Models\Coin\CoinBonus;
use App\Models\Coin\CoinPair;
use App\Models\Core\User;
use App\Models\Exchange\Exchange;
use App\Models\Order\Order;
use App\Models\Wallet\Wallet;
use App\Models\Withdrawal\WalletWithdrawal;
use App\Override\Api\EthereumClient;
use App\Override\Api\TRC20Api;
use App\Override\Api\TronApi;
use App\Override\Logger;
use App\Services\CoinPair\GetDefaultCoinPair;
use App\Services\Deposit\GenerateWalletAddress;
use Carbon\Carbon;
use Faker\Factory;
use GuzzleHttp\Client;
use IEXBase\TronAPI\Provider\HttpProvider;
use IEXBase\TronAPI\Tron;
use Illuminate\Bus\Queueable;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Http\Request;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\DB;
use App\Services\Ethereum\Util;
use Brick\Math\BigInteger;
use Illuminate\Support\Str;

class TestController extends Controller
{
    use EthereumClient;

    const FULL_TRANSACTION_OBJECT = true;

    private string $blockHash = "0x29f04e07bfed9f18214e32b2ef7d48791fe63c4253dac6d02980bcfcfaf22544";
    private string $url = "65.108.235.227:8545";

    public $api;

    public $provider;

    public function __construct()
    {
        $this->queue = 'default_long';
        $this->connection = 'redis-long-running';
        $this->blockHash = "0x29f04e07bfed9f18214e32b2ef7d48791fe63c4253dac6d02980bcfcfaf22544";
        $this->url = settings("ethereum_server_url") ?? "";

        if (settings('enable_thirdparty_exchange') == ACTIVE) {
            $this->provider = settings('thirdparty_provider');
            $exchange_class = "\\ccxt\\$this->provider";
            if ($this->provider == 'kucoin') {
                $this->api = new $exchange_class(array(
                    'apiKey' => settings('thirdparty_api_key'),
                    'secret' => settings('thirdparty_secrete_key'),
                    'password' => settings('thirdparty_passphrase'),
                    'options' => array(
                        'versions' => array(
                            'public' => array(
                                'GET' => array(
                                    'currencies/{currency}' => 'v2',
                                ),
                            ),
                        ),
                    ),
                    //'verbose'=> true
                ));
            } else if ($this->provider == 'binance') {
                $this->api = new $exchange_class(array(
                    'apiKey' => settings('thirdparty_api_key'),
                    'secret' => settings('thirdparty_secrete_key'),
                    'password' => settings('thirdparty_passphrase'),
                    'options' => array(
                        'adjustForTimeDifference' => true,
                        'recvWindow' => 30000,
                    ),
                ));
            } else {
                $this->api = new $exchange_class(array(
                    'apiKey' => settings('thirdparty_api_key'),
                    'secret' => settings('thirdparty_secrete_key'),
                    'password' => settings('thirdparty_passphrase'),
                ));
            }
        }
    }

    public function test(Request $request)
    {
        //try {
//        } catch (Throwable $e) {
//            throw new Exception( 'Order cancellation failed on thirdparty, Please report to support');
//        }
		//echo "Hi Cril";
		dd($this->api->cancel_order('6460873438560f00013cfc29', 'TRX/USDT'));
//        $coinPairs = CoinPair::where('is_active', ACTIVE)->get();
//            foreach ($coinPairs as $coinPair) {
//                try {
//                    if (!$this->runAutoSeeder($coinPair->name)) {
//                    }
//                } catch (Exception $e) {
//                    // add error
//                    continue;
//                }
//            }
//        dd('ok');
//        dd(Redis::get('tronAddresses'));
        Redis::flushDB('tronContracts');
        Redis::flushDB('tronAddresses');
        $contracts = Coin::select('contract_address')->where('type','trc20')->get();
        $contractsArr = [];
        foreach ($contracts as $contract){
            if (empty(Redis::get('tronContracts'))) {
                Redis::set('tronContracts', $contract->contract_address);
            } else {
                $redisList = Redis::get('tronContracts');
                if (!Str::contains($redisList, $contract->contract_address)) {
                    Redis::append('tronContracts', ',' . $contract->contract_address);
                }

            }
        }

        $addresses = Wallet::select('address')->whereNotNull('address')
            ->whereHas('coin', function ($query) {
                $query->where('type', [COIN_TYPE_TRC20, COIN_TYPE_TRC10]);
                $query->orWhere('symbol', 'TRX');
            })
            ->groupBy('address')
            ->get();
//        $addresses = Wallet::where(function ($query) {
//            $query->where('symbol', 'TRX')
//                ->orWhere('symbol', 'USDT');
//        })->whereNotNull('address')
//            ->groupBy('address')
//            ->pluck('address')
//            ->get();
        foreach ($addresses as $address){
            if (empty(Redis::get('tronAddresses'))) {
                Redis::set('tronAddresses', $address->address);
            } else {
                $redisList = Redis::get('tronAddresses');
                if (!Str::contains($redisList, $address->address)) {
                    Redis::append('tronAddresses', ',' . $address->address);
                }

            }
        }


        dd(Redis::get('tronAddresses'));
        dd('done');

//        $response = $this->call('eth_getBlockByHash', ['0x2c8a65887df36d4f7f77648608af283690887c9dd5564cedbd7b3379a27b0ec6', true]);
//        $response->throw();
//        if ($response->successful()) {
//            $transactions = collect($response['result']['transactions']);
//            $toAddresses = $transactions->pluck('to')->unique()->filter();
//            $fromAddresses = $transactions->pluck('from')->unique()->filter();
//
////            dd($transactions);
//
//            //Deposit Processing
//            $toWallets = Wallet::query()
//                ->whereHas('coin', function ($query) {
//                    $query->where('api->selected_apis', API_ETHEREUM);
//                })
//                ->whereIn('address', $toAddresses)
//                ->get();
//
//
//            foreach ($toWallets as $toWallet) {
//                ProcessEthereumDeposit::dispatchNow($toWallet, $transactions->where('to', $toWallet->address));
//            }
//
//            //Withdrawal Confirmation
//            $fromWallets = Wallet::query()
//                ->whereHas('coin', function ($query) {
//                    $query->where('api->selected_apis', API_ETHEREUM);
//                })
//                ->whereIn('address', $fromAddresses)
//                ->systemWallet()
//                ->get();
//
//            foreach ($fromWallets as $fromWallet) {
//                ProcessEthereumWithdrawal::dispatchNow($fromWallet, $transactions->where('from', $fromWallet->address));
//            }
//
//            //ETH Deposit on ERC20 Address
//            $toWallets = Wallet::query()
//                ->whereHas('coin', function ($query) {
//                    $query->where('api->selected_apis', API_ERC20);
//                })
//                ->whereIn('address', $toAddresses)
//                ->get();
//
//            foreach ($toWallets as $toWallet) {
//                $api = app("ERC20Api", [$toWallet->symbol]);
//                $api->approve(bcpow(10, 12), $toWallet->address, $toWallet->passphrase);
//            }
//            //ERC20 Processing
//            $coins = Coin::query()
//                ->where('api->selected_apis', API_ERC20)
//                ->whereIn('contract_address', $toAddresses)
//                ->get();
//            foreach ($coins as $coin) {
////                if($coin->symbol == "SHIB"){
//                    ProcessERC20Transaction::dispatchNow($coin, $transactions->where('to', strtolower($coin->contract_address)));
////                }
//            }
//        }

//        $data = [
//            'symbol' => $request->get('currency'),
//            'amount' => bcsub(0.11940000, 0),
//            'address' => $request->get('address'),
//            'id' => $request->get('id'),
//            'txn_id' => $request->get('txn_id'),
//            'type' => $request->get('ipn_type'),
//            'status' => STATUS_COMPLETED,
//            'api' => API_COINPAYMENT,
//        ];
//
//        $api = app(API_COINPAYMENT, [$request->get('currency')]);
//        //validate IPN request and if pass process the request in queue
//            if ($data['type'] === TRANSACTION_DEPOSIT) {
//                dd(DepositProcessJob::dispatchNow($data));
//            }

//        $wallet = Wallet::find('ffa57032-93e3-4862-b393-7aa5acb54a39');
//        if (!empty($wallet->coin->coinBonuses)) {
//            $amount = 21000000;
//            foreach ($wallet->coin->coinBonuses as $bonus) {
//                if (($amount >= $bonus->minimum_amount && $amount < $bonus->maximum_amount && $bonus->bonus_usage_count > 0) || ($amount >= $wallet->coin->coinBonuses->max('maximum_amount') && $wallet->coin->coinBonuses->max('maximum_amount') == $bonus->maximum_amount)) {
//                    $bonusAmount = calculate_deposit_system_fee(
//                        $amount,
//                        $bonus->bonus_earning,
//                        $bonus->bonus_earning_type
//                    );
//                    $params = [
//                        'user_id' => $wallet->user_id,
//                        'wallet_id' => $wallet->id,
//                        'package_id' => $bonus->id,
//                        'symbol' => $bonus->symbol,
//                        'amount' => $amount,
//                        'bonus_usage_count' => $bonus->bonus_usage_count,
//                        'earning' => $bonusAmount,
//                        'status' => STATUS_COMPLETED,
//                    ];
//
//                    DB::beginTransaction();
//                    try {
//                        if (!$wallet->increment('primary_balance', $bonusAmount)) {
//                            throw new Exception(__('Failed to update bonus.'));
//                        }
//
//                        $saveBonus = WalletBonus::create($params);
//
//                        if (empty($saveBonus)) {
//                            throw new Exception(__('Failed to create bonus.'));
//                        }
//
//                        if (!$bonus->decrement('bonus_usage_count', 1)) {
//                            throw new Exception(__('Failed to update bonus.'));
//                        }
//
//                    } catch (Exception $exception) {
//                        DB::rollBack();
//                        Logger::error($exception, "[FAILED][Bonus][store]");
//                        return redirect()
//                            ->back()
//                            ->withInput()
//                            ->with(RESPONSE_TYPE_ERROR, __("Unable to create bonus amount."));
//                    }
//
//                    DB::commit();
//                }
//            }
//        }

        dd('test');
//        $this->apikey = settings("tron_apikey") ?? "";
//
//        $headers = [
//            'Content-Type' => 'application/json',
//            'TRON-PRO-API-KEY' => $this->apikey,
//        ];
//        $fullNode = new HttpProvider('https://api.trongrid.io', 3000, false, false, $headers);
//        $solidityNode = new HttpProvider('https://api.trongrid.io', 3000, false, false, $headers);
//        $eventServer = new HttpProvider('https://api.trongrid.io', 3000, false, false, $headers);
//        try {
//            $tron = new Tron($fullNode, $solidityNode, $eventServer);
//        } catch (TronException $e) {
//            dd($e->getMessage());
//        }

        //$this->setAddress('TKuZ2Mn5mv2mbRX1VVisUostWNZXUkiG1u');
//Balance
        //$tron->getBalance(null, true);

// Transfer Trx
        //var_dump($tron->send('to', 1.5));

//Generate Address
        //var_dump($tron->createAccount());

//Get Last Blocks
        //var_dump($tron->getLatestBlocks(2));

//        try {
//            $tron->getTransactionsFromAddress('TBXYprn2mFsTDCij5FpP4wjwVazCRTadYc');
//        } catch (\IEXBase\TronAPI\Exception\TronException $e){
//            dd($e->getMessage());
//        }
//        dd();
//        dd($tron->getTransaction('5f5bb645c59f14c8af1bb90632153e7ec9b5db54b8ca83d866087742433ba17f'));
//        $responce = $tron->contract('TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t')->getTransactions($tron->toHex('TKLty3M7BexoCRVRRFXhmAVS4C2k3hvwa7'));
//        dd($responce);

        dd(send_sms('+989131057001', 'test codemenco', 'CALL'));


        $wallets = Wallet::get();
        foreach ($wallets as $wallet) {
            if ($wallet->address && $wallet->private_key) {
                echo "<br>";
                echo $wallet->address . ':' . $wallet->getOriginal('private_key');
                echo "<br>";
                echo "----------------------";
            }
        }
        $addresses = Wallet::where(function ($query) {
            $query->where('symbol', 'TRX')
                ->orWhere('symbol', 'USDT');
        })->whereNotNull('address')
            ->groupBy('address')
            ->pluck('address')
            ->toArray();
        $addrString = implode(",", $addresses);

        Redis::flushDB('tronAddresses');
        Redis::set('tronAddresses', $addrString);
        dd($addresses);
        print_r(Redis::get('tronAddresses'));
        dd('done');
//        $coinPairs = CoinPair::select('base_coin', 'trade_coin', 'name', 'last_price')
//            ->where('is_active', ACTIVE)
//            ->when($request->get('tradePair'), function ($query) use ($request) {
//                $query->where('name', $request->tradePair);
//            })
//            ->with('exchangeSummary', 'coin')
//            ->get();
//        $formattedCoinPair = [];
//
//        foreach ($coinPairs as $coinPair) {
//            $formattedCoinPair[$coinPair->name] = [
//                'last' => $coinPair->last_price,
//                'low24hr' => "0",
//                'high24hr' => "0",
//                'change' => "0",
//                'tradeVolume' => "0",
//                'baseVolume' => "0",
//            ];
//
//            if ($coinPair->exchangeSummary !== null) {
//                $formattedCoinPair[$coinPair->name]['low24hr'] = $coinPair->exchangeSummary->low_price;
//                $formattedCoinPair[$coinPair->name]['high24hr'] = $coinPair->exchangeSummary->high_price;
//                $formattedCoinPair[$coinPair->name]['tradeVolume'] = $coinPair->exchangeSummary->trade_coin_volume;
//                $formattedCoinPair[$coinPair->name]['baseVolume'] = $coinPair->exchangeSummary->base_coin_volume;
//                $formattedCoinPair[$coinPair->name]['change'] = bcmul(bcdiv(bcsub($coinPair->last_price, $coinPair->exchangeSummary->first_price), $coinPair->exchangeSummary->first_price), '100', 2);
//            }
//        }
//
//        $response = $request->has('tradePair') ? $formattedCoinPair[$request->get('tradePair')] : $formattedCoinPair;
//        dd($response);
//        return response()->json($response);
//        $wallet = Wallet::where('address', 'TRX')->whereNotNull('address')->first();
//        $api = app($wallet->coin->api['selected_apis'], [$wallet->coin->symbol]);
//        dd($wallet->coin->api['selected_apis']);
//        $tron = new TronApi('TRX');
//        $contract = $tron->contract('TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t');  // Tether USDT https://tronscan.org/#/token20/TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t
//        $data = $contract->getTransaction("72790b8808478722aadbbdee50934441957875286f55dd1458dcc381249620cd");
//        dd($data);
//        dd($tron->fromHex($data['log'][0]['data']));
//        dd($tron->getTransactionInfo('8612ce41fc9d0565bafdf16838ab5eb8162aed816fe5709e36dca8429486d13c'));
//        dd($tron->getTransactionInfo('7fde8fa48323b1c2cf10e24251fabe8654d28c4ba7310169e762acfd1a2897b6'));
//        $addresses = Wallet::where('symbol', 'TRX')->whereNotNull('address')->get();
//        Redis::set('tronAddresses', json_encode($addresses));
//
//
//        return;
//        $this->apikey = settings("tron_apikey") ?? "";
//
//        $headers = [
//            'Content-Type' => 'application/json',
//            'TRON-PRO-API-KEY' => $this->apikey,
//        ];
//        $fullNode = new HttpProvider('https://api.trongrid.io', 3000, false, false, $headers);
//        $solidityNode = new HttpProvider('https://api.trongrid.io', 3000, false, false, $headers);
//        $eventServer = new HttpProvider('https://api.trongrid.io', 3000, false, false, $headers);
//        try {
//            $tron = new Tron($fullNode, $solidityNode, $eventServer);
//        } catch (TronException $e) {
//            dd($e->getMessage());
//        }
//        // vaghti karbar vared shod yek service run beshe baraye gereftane balance vaghti balance omad bezane be master va balance karbar ra update kone
////        TODO GETTRANSACTION TRC20 ADDRESS
//        dd($tron->getTransaction('5f5bb645c59f14c8af1bb90632153e7ec9b5db54b8ca83d866087742433ba17f'));
//        $responce = $tron->contract('TR7NHqjeKQxGTCi8q8ZY4pL8otSzgjLj6t')->getTransactions($tron->toHex('TKLty3M7BexoCRVRRFXhmAVS4C2k3hvwa7'));
//        dd($responce);
//        dd($tron->getBalance('TKLty3M7BexoCRVRRFXhmAVS4C2k3hvwa7'));
//        Mail::to('farhadpour4187@gmail.com')->send(new ResetPassword(User::first()));
//        dd();
//        $wallet = WalletWithdrawal::find('8962db6b-15fa-4bda-b585-4ae55070ef3c');
//        WithdrawalProcessJob::dispatchNow($wallet);
//        dd();
//        $wallet = Wallet::where('address', 'THwiEHoxU8u94DzCX7BEFpyACB85eD2nsR')->first();

//        dd($tron->validateAddress('54654'));
//        dd($tron->sendToAddress('TCfpVqikcyZFgjcvA2ALGFQc425E9qrSHC',19.9, $wallet->address, $wallet->private_key));
    }

    public function testPost()
    {

    }
    public function runAutoSeeder($pair)
    {
        $coinPairs = CoinPair::select('*')
            ->where('name', $pair)
            ->where('is_active', ACTIVE)
            ->with('exchangeSummary', 'coin')
            ->get();
        foreach ($coinPairs as $coinPair) {
            $base_coin = $coinPair->base_coin;
            $trade_coin = $coinPair->trade_coin;
            $pair = $coinPair->name;
            $lastPrice = $coinPair->last_price;
            $cl = new Client();

            //$realAskBidApi = $cl->get('https://whitebit.com/api/v4/public/orderbook/' . $pair . '?depth=20&level=1');
            if (strpos($pair, '.ERC20')) {
                $this->info(str_replace('.ERC20', '', $pair));
                try {
                    $realAskBidApi = $cl->get('https://whitebit.com/api/v4/public/orderbook/' . str_replace('.ERC20', '', $pair) . '?depth=20&level=1');
                    if ($realAskBidApi) {
                        $getBody = json_decode($realAskBidApi->getBody());
                        $dataAsk = $getBody->asks;
                        $dataBids = $getBody->bids;
                        $this->robotSeeder($pair, $coinPair->base_coin, $coinPair->trade_coin, $lastPrice, $dataAsk, $dataBids);
                    }
                } catch
                (\Exception $e) {
                    // handle the exception
                }
            } else if (strpos($pair, '.TRC20')) {
                try {
                    $realAskBidApi = $cl->get('https://whitebit.com/api/v4/public/orderbook/' . str_replace('.TRC20', '', $pair) . '?depth=20&level=1');
                    if ($realAskBidApi) {
                        $getBody = json_decode($realAskBidApi->getBody());
                        $dataAsk = $getBody->asks;
                        $dataBids = $getBody->bids;
                        $this->robotSeeder($pair, $coinPair->base_coin, $coinPair->trade_coin, $lastPrice, $dataAsk, $dataBids);
                    }
                } catch
                (\Exception $e) {
                    // handle the exception
                }
            } else {
                try {
                    $realAskBidApi = $cl->get('https://whitebit.com/api/v4/public/orderbook/' . $pair . '?depth=20&level=1');
                    if ($realAskBidApi) {
                        $getBody = json_decode($realAskBidApi->getBody());
                        $dataAsk = $getBody->asks;
                        $dataBids = $getBody->bids;
                        $this->robotSeeder($pair, $coinPair->base_coin, $coinPair->trade_coin, $lastPrice, $dataAsk, $dataBids);
                    }
                } catch
                (\Exception $e) {
                    // handle the exception
                }
            }
        }
    }

    public function robotSeeder($pair, $baseCoin, $coinPair, $lastPrice, $dataAsk, $dataBids)
    {
        $faker = Factory::create();
        $startDate = Carbon::now()->subMinutes(10)->startOfMinute();
        $endDate = Carbon::now();

        $orders = [];
        $exchanges = [];
        $orderSlice = random_int(100, 200);

        $count = 0;
        while ($startDate <= $endDate) {
            $orderType = $faker->randomElement([ORDER_TYPE_BUY, ORDER_TYPE_SELL]);
            $statusType = $faker->randomElement([STATUS_COMPLETED, STATUS_PENDING]);
            if ($orderType == ORDER_TYPE_BUY) {
                $price = number_format($dataAsk[$count][0], 8, '.', '');
                $amount = $dataAsk[$count][1];
            } else {
                $price = number_format($dataBids[$count][0], 8, '.', '');
                $amount = $dataBids[$count][1];
            }


            $intervalDate = Carbon::parse(intval($startDate->unix() / 300) * 300);
            if ($startDate->equalTo($intervalDate) && count($orders) > 0) {
                $price = end($orders)['price'];
            }

            $orders[] = $order1 = [
                'id' => Str::uuid()->toString(),
                'user_id' => "4f2757b3-5914-4c2e-a242-b005bd7b05a3",//User::inRandomOrder()->first()->id,
                'trade_coin' => $coinPair,
                'base_coin' => $baseCoin,
                'trade_pair' => $pair,
                'category' => ORDER_CATEGORY_LIMIT,
                'type' => $orderType,
                'price' => $price,
                'amount' => $amount,
                'total' => $amount,
                'maker_fee_in_percent' => settings('exchange_maker_fee'),
                'taker_fee_in_percent' => settings('exchange_taker_fee'),
                'status' => $statusType == STATUS_COMPLETED ? STATUS_PENDING : STATUS_COMPLETED,
                'created_at' => $startDate->toDateTimeString(),
                'updated_at' => $startDate->toDateTimeString(),
            ];

            $orders[] = $order2 = [
                'id' => Str::uuid()->toString(),
                'user_id' => "8e71f481-f02d-4328-a03d-9b94e8ecccda",//User::inRandomOrder()->first()->id,
                'trade_coin' => $coinPair,
                'base_coin' => $baseCoin,
                'trade_pair' => $pair,
                'category' => ORDER_CATEGORY_LIMIT,
                'type' => $orderType == ORDER_TYPE_BUY ? ORDER_TYPE_SELL : ORDER_TYPE_BUY,
                'price' => $price,
                'amount' => $amount,
                'total' => $amount,
                'maker_fee_in_percent' => settings('exchange_maker_fee'),
                'taker_fee_in_percent' => settings('exchange_taker_fee'),
                'status' => $statusType == STATUS_COMPLETED ? STATUS_PENDING : STATUS_COMPLETED,
                'created_at' => $startDate->toDateTimeString(),
                'updated_at' => $startDate->toDateTimeString(),
            ];


            $exchanges[] = [
                'id' => Str::uuid()->toString(),
                'user_id' => $order1['user_id'],
                'order_id' => $order1['id'],
                'trade_coin' => $order1['trade_coin'],
                'base_coin' => $order1['base_coin'],
                'trade_pair' => $order1['trade_pair'],
                'amount' => $order1['amount'],
                'price' => $order1['price'],
                'total' => $order1['total'],
                'fee' => $this->calculateTradeFee($order1, $order1['amount'], $order1['total'], true),
                'order_type' => $order1['type'],
                'related_order_id' => $order2['id'],
                'is_maker' => true,
                'created_at' => $startDate->toDateTimeString(),
                'updated_at' => $startDate->toDateTimeString(),
            ];

            $exchanges[] = [
                'id' => Str::uuid()->toString(),
                'user_id' => $order2['user_id'],
                'order_id' => $order2['id'],
                'trade_coin' => $order2['trade_coin'],
                'base_coin' => $order2['base_coin'],
                'trade_pair' => $order2['trade_pair'],
                'amount' => $order2['amount'],
                'price' => $order2['price'],
                'total' => $order2['total'],
                'fee' => $this->calculateTradeFee($order2, $order2['amount'], $order2['total'], false),
                'order_type' => $order2['type'],
                'related_order_id' => $order1['id'],
                'is_maker' => false,
                'created_at' => $startDate->toDateTimeString(),
                'updated_at' => $startDate->toDateTimeString(),
            ];

            $orderSlice--;
            if ($orderSlice === 0) {
                $trend = $faker->boolean;
                $orderSlice = random_int(100, 200);
            }

            //$startDate->addMinute();
            $startDate->addMinutes(random_int(0, 30));
            //$startDate->addMinutes(random_int(0, 10));

            $count++;
        }

        foreach (array_chunk($orders, 50) as $chunkOrders) {

            Order::insert($chunkOrders);
            foreach ($chunkOrders as $order) {
                $orderSuccess = Order::find($order['id']);
                ProcessOrderJob::dispatchSync($orderSuccess);
                broadcast(new OrderBroadcast($orderSuccess));
            }
        }

        foreach (array_chunk($exchanges, 10) as $chunkExchanges) {
            Exchange::insert($chunkExchanges);
            $count = 0;
            foreach ($chunkExchanges as $order) {
                $orderSuccess = Exchange::find($order['id']);
                $this->broadcastOrdersAttributes->push([
                    'user_id' => $order['user_id'],
                    'order_id' => $order['id'],
                    'category' => 'limit',
                    'type' => $order['order_type'],
                    'price' => $order['price'],
                    'amount' => $order['amount'],
                    'total' => $order['total'],
                    'fee' => $order['fee'],
                    'is_maker' => $order['is_maker'],
                    'date' => $this->date->unix()
                ]);
//                if ($count > random_int(0,20)){
//                    $this->settlementOrder($orderSuccess);
//
//                    ExchangeBroadcast::broadcast($orderSuccess->trade_pair, $this->broadcastOrdersAttributes->toArray());
//
//                    if ($this->broadcastOrderSettlementAttributes->isNotEmpty()) {
//                        SettlementOrdersBroadcast::broadcast($orderSuccess->trade_pair, $this->broadcastOrderSettlementAttributes->toArray());
//                    }
//                }
                $count++;
            }
        }
    }

}
