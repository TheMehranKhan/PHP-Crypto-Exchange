<?php

namespace App\Console\Commands;

use App\Models\Coin\CoinPair;
use Illuminate\Console\Command;
use App\Models\Core\User;
use App\Models\Exchange\Exchange;
use App\Models\Order\Order;
use Carbon\Carbon;
use Faker\Factory;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;
use App\Broadcasts\Exchange\OrderBroadcast;
use App\Jobs\Order\ProcessOrderJob;
use GuzzleHttp\Client;
use App\Broadcasts\Exchange\ExchangeBroadcast;
use App\Broadcasts\Exchange\SettlementOrdersBroadcast;
use App\Models\Coin\Coin;
use DB;

class OrderSeeder extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'OrderSeeder:insert';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Trader Robot';

    private $exchangesAttributes;
    private $ordersAttributes;
    private $referralEarningsAttributes;
    private $walletsAttributes;
    private $broadcastOrdersAttributes;
    private $broadcastOrderSettlementAttributes;
    private $date;

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->exchangesAttributes = collect([]);
        $this->ordersAttributes = collect([]);
        $this->referralEarningsAttributes = collect([]);
        $this->walletsAttributes = collect([]);
        $this->broadcastOrdersAttributes = collect([]);
        $this->broadcastOrderSettlementAttributes = collect([]);
        $this->date = Carbon::now();

        parent::__construct();

    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        ini_set('max_execution_time', -1);


        if (settings('robot_active_status') == ACTIVE) {
            //If you want to get best result from ROBOT please disable each robot that is disabled

//            $coinPairs = CoinPair::where('is_active', ACTIVE)->get();
//            foreach ($coinPairs as $coinPair) {
////                try {
//                    if (!$this->runAutoSeeder($coinPair->name)) {
//                    }
////                } catch (Exception $e) {
////                    // add error
////                    continue;
////                }
//            }

//            sleep(30);

//            $coinPairs = CoinPair::where('is_active', ACTIVE)->get();
//            foreach ($coinPairs as $coinPair) {
//                try {
//                    if (!$this->runAutoSeeder($coinPair->name)) {
//                    }
//                } catch (Exception $e) {
//                    // add error
//                    continue;
//                }
//            }

//            $this->runAutoSeeder('ETH_USDT');
//            $this->runAutoSeeder('LTC_USDT');
//            $this->runAutoSeeder('BNB_USDT');
//            $this->runAutoSeeder('DOGE_USDT');
//            $this->runAutoSeeder('ADA_USDT');
//            $this->runAutoSeeder('ATOM_USDT');
//
//            $this->clearDB(60);

            //1.CoinPair 2.Trade Coin 3.Base Coin 4.Min Amount 5.Max Amount
            //$this->runContractAddressSeeder('CODS_USDT', 'CODS', 'USDT', '1', '20');
            //1.CoinPair 2.Real Price 3.Min Price 5.Max Price 3.Min Amount 5.Max Amount
            $this->runIRTAutoSeeder('USDT_IRT');
//            $this->runCustomSeeder('USDT_IRT','49400','49000','51000','0.1','0.5');
        }

        $this->info('The data insert successfully!');
    }


    public function runAutoSeeder($pair)
    {
        $coinPairs = CoinPair::select('*')
            ->where('name', $pair)
            ->whereNot('base_coin','IRT')
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

    public function runIRTAutoSeeder($pair)
    {
        $coinPairs = CoinPair::select('*')
            ->where('name', $pair)
            ->where('is_active', ACTIVE)
            ->where('base_coin','IRT')
            ->with('exchangeSummary', 'coin')
            ->get();
        foreach ($coinPairs as $coinPair) {
            $base_coin = $coinPair->base_coin;
            $trade_coin = $coinPair->trade_coin;
            $pair = $coinPair->name;
            $pairLink = str_replace('_', '', $coinPair->name);
            $lastPrice = $coinPair->last_price;
            $cl = new Client();

            //$realAskBidApi = $cl->get('https://whitebit.com/api/v4/public/orderbook/' . $pair . '?depth=20&level=1');
            if (strpos($pair, '.ERC20')) {
                try {
                    $realAskBidApi = $cl->get('https://api.nobitex.ir/v2/orderbook/' . str_replace('.ERC20', '', $pairLink));
                    if ($realAskBidApi) {
                        $dataAsk = [];
                        $dataBids = [];
                        $getBody = json_decode($realAskBidApi->getBody());
                        foreach ($getBody->asks as $key => $value) {
                            $dataAsk[$key] = array($value[0]/10,$value[1]);
                            $dataBids[$key] = array($value[0]/10,$value[1]);
                        }
                    }
                } catch
                (\Exception $e) {
                    // handle the exception
                }
            } else if (strpos($pair, '.TRC20')) {
                try {
                    $realAskBidApi = $cl->get('https://api.nobitex.ir/v2/orderbook/' . str_replace('.TRC20', '', $pairLink));
                    if ($realAskBidApi) {
                        $dataAsk = [];
                        $dataBids = [];
                        $getBody = json_decode($realAskBidApi->getBody());
                        foreach ($getBody->asks as $key => $value) {
                            $dataAsk[$key] = array($value[0]/10,$value[1]);
                            $dataBids[$key] = array($value[0]/10,$value[1]);
                        }
                    }
                } catch
                (\Exception $e) {
                    // handle the exception
                }
            } else {
                try {
                    $realAskBidApi = $cl->get('https://api.nobitex.ir/v2/orderbook/' . $pairLink);
                    if ($realAskBidApi) {
                        $dataAsk = [];
                        $dataBids = [];
                        $getBody = json_decode($realAskBidApi->getBody());
                        foreach ($getBody->asks as $key => $value) {
                            $dataAsk[$key] = array($value[0]/10,$value[1]);
                            $dataBids[$key] = array($value[0]/10,$value[1]);
                        }
                        $this->robotSeeder($pair, $coinPair->base_coin, $coinPair->trade_coin, $lastPrice, $dataAsk, $dataBids);
                    }
                } catch
                (\Exception $e) {
                    // handle the exception
                }
            }
        }
    }

    public function runCustomSeeder($customPair, $realPrice, $minPrice, $maxPrice, $minNumber, $maxNumber)
    {
        $coinPairs = CoinPair::select('*')
            ->where('name', $customPair)
            ->where('is_active', ACTIVE)
            ->with('exchangeSummary', 'coin')
            ->first();
        $base_coin = $coinPairs->base_coin;
        $trade_coin = $coinPairs->trade_coin;
        $pair = $coinPairs->name;
        $lastPrice = $coinPairs->last_price;
        $this->robotCustomSeeder($pair, $base_coin, $trade_coin, $lastPrice, $realPrice, $minPrice, $maxPrice, $minNumber, $maxNumber);
    }

    public function runContractAddressSeeder($customPair, $trade_coin, $baseCoin, $minNumber, $maxNumber)
    {
        $coinInfo = Coin::select('*')
            ->where('symbol', $trade_coin)
            ->where('is_active', ACTIVE)
            ->first();

        if (!empty($coinInfo) && !empty($coinInfo->contract_address)) {
            $cl = new Client();
            $contractAddrsInfo = $cl->get('https://api.coingecko.com/api/v3/coins/ethereum/contract/' . $coinInfo->contract_address . '');
            $getBody = json_decode($contractAddrsInfo->getBody());
            if (!empty($getBody) && $getBody->market_data->current_price->usd > 0) {
                $realPrice = $getBody->market_data->current_price->usd;
                $lastPrice = '';
                $maxPrice = $getBody->market_data->high_24h->usd;
                $minPrice = $getBody->market_data->low_24h->usd;

                $this->robotContractAddressSeeder($customPair, $baseCoin, $trade_coin, $lastPrice, $realPrice, $minPrice, $maxPrice, $minNumber, $maxNumber);
            } else {

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
                'user_id' => "07178aa8-bbd6-4f8b-9fbf-48711485ab8d",//User::inRandomOrder()->first()->id,
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
                'user_id' => "07178aa8-bbd6-4f8b-9fbf-48711485ab8d",//User::inRandomOrder()->first()->id,
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

        foreach (array_chunk($orders, 5) as $chunkOrders) {

            Order::insert($chunkOrders);
            foreach ($chunkOrders as $order) {
                $orderSuccess = Order::find($order['id']);
                if ($statusType == STATUS_COMPLETED){
                    $orderSuccess->coinPair()->update(['last_price' => $order['price']]);
                }
                ProcessOrderJob::dispatchSync($orderSuccess);
                broadcast(new OrderBroadcast($orderSuccess));
            }
        }

        foreach (array_chunk($exchanges, 5) as $chunkExchanges) {
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

    public function robotCustomSeeder($pair, $baseCoin, $coinPair, $lastPrice, $realPrice, $minPrice, $maxPrice, $minNumber, $maxNumber)
    {
        $faker = Factory::create();
        $startDate = Carbon::now()->subHours(1)->startOfHour();
        $endDate = Carbon::now();

        $orders = [];
        $exchanges = [];
        $orderSlice = random_int(100, 200);
        $trend = $faker->boolean;
//        $currentPrice = 9640;

        $currentPrice = $lastPrice;

        while ($startDate <= $endDate) {
            $orderType = $faker->randomElement([ORDER_TYPE_BUY, ORDER_TYPE_SELL]);
            $statusType = $faker->randomElement([STATUS_COMPLETED, STATUS_PENDING]);

            $price = $faker->randomFloat(1, $minPrice, $maxPrice);
            $amount = round(($price / $faker->randomFloat(1, 1, 500) * $price), 8);

            $intervalDate = Carbon::parse(intval($startDate->unix() / 300) * 300);
            if ($startDate->equalTo($intervalDate) && count($orders) > 0) {
                $price = end($orders)['price'];
            }

            $orders[] = $order1 = [
                'id' => Str::uuid()->toString(),
                'user_id' => "07178aa8-bbd6-4f8b-9fbf-48711485ab8d",//User::inRandomOrder()->first()->id,
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
                'user_id' => "07178aa8-bbd6-4f8b-9fbf-48711485ab8d",//User::inRandomOrder()->first()->id,
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

//            $startDate->addMinute();
            $startDate->addMinutes(random_int(0, 59));
        }

        foreach (array_chunk($orders, 5) as $chunkOrders) {
//            Request::merge($chunkOrders);
//            app(CreateOrderService::class)->create();

            Order::insert($chunkOrders);
            foreach ($chunkOrders as $order) {
                $orderSuccess = Order::find($order['id']);
                ProcessOrderJob::dispatchSync($orderSuccess);
                broadcast(new OrderBroadcast($orderSuccess));
            }
        }

        foreach (array_chunk($exchanges, 5) as $chunkExchanges) {
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
//                if ($count > random_int(0, 20)) {
//                    $this->settlementOrder($orderSuccess);
//
//                    ExchangeBroadcast::broadcast($orderSuccess->trade_pair, $this->broadcastOrdersAttributes->toArray());
//
//                    if ($this->broadcastOrderSettlementAttributes->isNotEmpty()) {
//                        SettlementOrdersBroadcast::broadcast($this->order->trade_pair, $this->broadcastOrderSettlementAttributes->toArray());
//                    }
//                }

                $count++;
            }
        }
    }

    public function robotContractAddressSeeder($pair, $baseCoin, $coinPair, $lastPrice, $realPrice, $minPrice, $maxPrice, $minNumber, $maxNumber)
    {
        $faker = Factory::create();
        $startDate = Carbon::now()->subHours(1)->startOfHour();
        $endDate = Carbon::now();

        $orders = [];
        $exchanges = [];
        $orderSlice = random_int(100, 200);
        $trend = $faker->boolean;
//        $currentPrice = 9640;

        $currentPrice = $realPrice;

        while ($startDate <= $endDate) {
            $orderType = $faker->randomElement([ORDER_TYPE_BUY, ORDER_TYPE_SELL]);
            $statusType = $faker->randomElement([STATUS_COMPLETED, STATUS_PENDING]);
            $price = $faker->randomFloat(8, $minPrice, $maxPrice);
            $amount = round(($price / $faker->randomFloat(8, $minNumber, $maxNumber) * $price), 8);

            $intervalDate = Carbon::parse(intval($startDate->unix() / 300) * 300);
            if ($startDate->equalTo($intervalDate) && count($orders) > 0) {
                $price = end($orders)['price'];
            }

            $orders[] = $order1 = [
                'id' => Str::uuid()->toString(),
                'user_id' => "07178aa8-bbd6-4f8b-9fbf-48711485ab8d",//User::inRandomOrder()->first()->id,
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
                'user_id' => "07178aa8-bbd6-4f8b-9fbf-48711485ab8d",//User::inRandomOrder()->first()->id,
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

//            $startDate->addMinute();
            $startDate->addMinutes(random_int(0, 59));
        }

        foreach (array_chunk($orders, 5) as $chunkOrders) {
//            Request::merge($chunkOrders);
//            app(CreateOrderService::class)->create();

            Order::insert($chunkOrders);
            foreach ($chunkOrders as $order) {
                $orderSuccess = Order::find($order['id']);
                ProcessOrderJob::dispatchSync($orderSuccess);
                broadcast(new OrderBroadcast($orderSuccess));
            }
        }

        foreach (array_chunk($exchanges, 5) as $chunkExchanges) {
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
//                if ($count > random_int(0, 20)) {
//                    $this->settlementOrder($orderSuccess);
//
//                    ExchangeBroadcast::broadcast($orderSuccess->trade_pair, $this->broadcastOrdersAttributes->toArray());
//
//                    if ($this->broadcastOrderSettlementAttributes->isNotEmpty()) {
//                        SettlementOrdersBroadcast::broadcast($this->order->trade_pair, $this->broadcastOrderSettlementAttributes->toArray());
//                    }
//                }

                $count++;
            }
        }
    }

    private function settlementOrder($order)
    {
        $remainingAmount = bcsub($order->amount, $order->exchanged);
        $remainingTotal = 0;
        //Update order attributes with canceled amount and status completed
        if ($this->ordersAttributes->where('conditions.id', $order->id)->count()) {
            $this->ordersAttributes->transform(function ($orderAttribute) use ($order, &$remainingAmount, &$remainingTotal) {
                if ($orderAttribute['conditions']['id'] == $order->id) {
                    $remainingAmount = bcsub($remainingAmount, $orderAttribute['fields']['exchanged'][1]);
                    $remainingTotal = bcmul($remainingAmount, $order->price);
                    if (bccomp($remainingTotal, '0') <= 0) {
                        $orderAttribute['fields']['canceled'] = ['increment', $remainingAmount];
                        $orderAttribute['fields']['status'] = STATUS_COMPLETED;
                    }
                }
                return $orderAttribute;
            });

        } else {
            $remainingTotal = bcmul($remainingAmount, $order->price);
            if (bccomp($remainingTotal, '0') <= 0) {
                $this->ordersAttributes->push([
                    'conditions' => ['id' => $order->id, 'status' => STATUS_PENDING],
                    'fields' => [
                        'status' => STATUS_COMPLETED,
                        'canceled' => ['increment', $remainingAmount]
                    ]
                ]);
            }
        }

        if (bccomp($remainingTotal, '0') <= 0) {
            //Update the given order's user's wallet
            $this->makeWalletsAttributes(
                $order->user_id,
                $this->getOutgoingCoinSymbol($order),
                $order->type === ORDER_TYPE_BUY ? $remainingTotal : $remainingAmount
            );

            if (bccomp($remainingAmount, '0') > 0) {
                $this->broadcastOrderSettlementAttributes->push([
                    'user_id' => $order->user_id,
                    'order_id' => $order->id,
                    'category' => $order->category,
                    'type' => $order->type,
                    'price' => $order->price,
                    'amount' => $remainingAmount,
                    'total' => $remainingTotal,
                    'date' => $this->date->unix()
                ]);
            }
        }
    }

    private function clearDB($min)
    {
        ini_set('max_execution_time', -1);
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        $order = Order::whereRaw('created_at <= now() - interval ' . $min . ' minute')
            ->where(function ($query) {
                $query->where('user_id', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d')
                    ->orWhere('user_id', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d');
            })
            ->where('status', 'pending')
            ->delete();
        if ($order) {
            $exchange = DB::table('exchanges')->leftJoin('orders', 'exchanges.order_id', '=', 'orders.id')
                ->whereNull('orders.id')
                ->delete();
        }
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }

    private function calculateTradeFee($order, $amount, $total, $isMaker)
    {
        $feePercent = $isMaker ? $order['maker_fee_in_percent'] : $order['taker_fee_in_percent'];
        return bcdiv(bcmul($order['type'] === ORDER_TYPE_BUY ? $amount : $total, $feePercent), '100');
    }
}
