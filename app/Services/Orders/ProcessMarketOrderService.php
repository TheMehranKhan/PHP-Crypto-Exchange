<?php

namespace App\Services\Orders;

use App\Broadcasts\Exchange\SettlementOrdersBroadcast;
use App\Models\Core\User;
use App\Models\Order\Order;
use App\Models\Wallet\Wallet;
use App\Services\Logger\Logger;
use Carbon\Carbon;
use Exception;
use Illuminate\Support\Facades\DB;
use ccxt;

class ProcessMarketOrderService
{
    use ProcessOrder;

    private $order;
    private $settings;
    private $exchangesAttributes;
    private $ordersAttributes;
    private $referralEarningsAttributes;
    private $walletsAttributes;
    private $broadcastOrdersAttributes;
    private $broadcastOrderSettlementAttributes;
    private $exchangedOrderAmount;
    private $exchangedOrderTotal;
    private $exchangedOrderFee;
    private $exchangeLastPrice;
    private $date;
    private $isBuyOrder;
    private $systemUser;
    private $lastOppositeOrder;
    private $previousLastPrice;

    public $api;

    public $provider;

    public function __construct(Order $order)
    {
        $this->order = $order;
        $this->previousLastPrice = $order->coinPair->last_price;
        $this->lastOppositeOrder = null;
        $this->exchangedOrderAmount = 0;
        $this->exchangedOrderTotal = 0;
        $this->exchangedOrderFee = 0;
        $this->exchangeLastPrice = 0;
        $this->systemUser = User::superAdmin()->first();
        $this->isBuyOrder = $this->order->type === ORDER_TYPE_BUY;
        $this->settings = settings([
            'referral',
            'referral_percentage',
        ]);
        $this->exchangesAttributes = collect([]);
        $this->ordersAttributes = collect([]);
        $this->referralEarningsAttributes = collect([]);
        $this->walletsAttributes = collect([]);
        $this->broadcastOrdersAttributes = collect([]);
        $this->broadcastOrderSettlementAttributes = collect([]);
        $this->date = Carbon::now();

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

    public function process()
    {
        try {
            $this->startProcessing();
            if (bccomp($this->exchangedOrderAmount, '0') <= 0) {
                if (settings('enable_thirdparty_exchange') == ACTIVE) {
                    $this->submitThirdparty();
                }
                $this->cancelOrder();
                return;
            }

            if (!empty($this->lastOppositeOrder)) {
                //Opposite order settlement
                $this->settlementOrder($this->lastOppositeOrder);
            }

            $remainingBalance = $this->isBuyOrder ?
                bcsub($this->order->total, $this->exchangedOrderTotal) :
                bcsub($this->order->amount, $this->exchangedOrderAmount);

            //Push the order attributes for update
            $this->ordersAttributes->push([
                'conditions' => ['id' => $this->order->id, 'status' => STATUS_PENDING],
                'fields' => [
                    'status' => STATUS_COMPLETED,
                    'exchanged' => [
                        'increment',
                        $this->isBuyOrder ? $this->exchangedOrderTotal : $this->exchangedOrderAmount
                    ],
                    'canceled' => [
                        'increment',
                        $remainingBalance
                    ]
                ]
            ]);

            $walletAmount = bcsub($this->exchangedOrderTotal, $this->exchangedOrderFee);
            if ($this->isBuyOrder) {
                $walletAmount = bcsub($this->exchangedOrderAmount, $this->exchangedOrderFee);
            }

            //Update the order's user's incoming coin wallet
            $this->makeWalletsAttributes(
                $this->order->user_id,
                $this->getIncomingCoinSymbol($this->order),
                $walletAmount
            );


            //Return the remaining balance to the order's user's outgoing coin wallet
            if (bccomp($remainingBalance, '0') > 0) {
                $this->makeWalletsAttributes(
                    $this->order->user_id,
                    $this->getOutgoingCoinSymbol($this->order),
                    $remainingBalance
                );
                $this->broadcastOrderSettlementAttributes->push([
                    'user_id' => $this->order->user_id,
                    'order_id' => $this->order->id,
                    'category' => $this->order->category,
                    'type' => $this->order->type,
                    'price' => $this->order->price,
                    'amount' => bcsub($this->order->amount, $this->exchangedOrderAmount),
                    'total' => bcsub($this->order->total, $this->exchangedOrderTotal),
                    'date' => $this->date->unix()
                ]);
            }

            //Closing the process
            $this->close();
        } catch (Exception $exception) {
            Logger::error($exception, "[FAILED][ProcessMarketOrderService][process]");
        }
        return;
    }

    private function cancelOrder()
    {
        //Push the opposite order attributes for update
        if ($this->order->category = ORDER_CATEGORY_MARKET && settings('enable_complete_market_anyway') == ACTIVE){
            //Calculate trade fee
            $orderFee = $this->calculateTradeFee($this->order, $this->order->amount, $this->order->total, $this->isBuyOrder);
            $oppositeOrderFee = $this->calculateTradeFee($this->order, $this->order->amount, $this->order->total, !$this->isBuyOrder);

            //Increase the order exchange fee by the exchange fee
//            $amount = bcsub($this->isBuyOrder ? $this->order->total : bcmul($this->order->amount, $this->order->price), $orderFee);

            //Push the opposite order attributes for update
            $this->ordersAttributes->push([
                'conditions' => ['id' => $this->order->id, 'status' => STATUS_PENDING],
                'fields' => [
                    'status' => STATUS_COMPLETED,
                    'exchanged' => ['increment', $this->order->amount]
                ]
            ]);


            $walletAmount = $this->order->total; //bcsub($this->order->total, $orderFee);
            if ($this->isBuyOrder) {
                $walletAmount = $this->order->amount; //bcsub($this->order->amount, $oppositeOrderFee);
            }

            $this->makeWalletsAttributes(
                $this->order->user_id,
                $this->getIncomingCoinSymbol($this->order),
                $walletAmount
            );

            DB::beginTransaction();
            try {
                $orderUpdateCount = Order::bulkUpdate($this->ordersAttributes->toArray());
                if ($orderUpdateCount !== $this->ordersAttributes->count()) {
                    throw new Exception('Failed to update order');
                }

                $walletUpdateCount = Wallet::bulkUpdate($this->walletsAttributes->toArray());
                if ($walletUpdateCount !== $this->walletsAttributes->count()) {
                    throw new Exception('Failed to update wallet');
                }

            } catch (Exception $exception) {
                DB::rollBack();
                Logger::error($exception, "[FAILED][ProcessMarketOrderService][cancelOrder]");
            }
            DB::commit();
        } else {
            $this->ordersAttributes->push([
                'conditions' => ['id' => $this->order->id, 'status' => STATUS_PENDING],
                'fields' => [
                    'status' => STATUS_COMPLETED,
                    'canceled' => ['increment', $this->isBuyOrder ? $this->order->total : $this->order->amount]
                ]
            ]);

            $this->makeWalletsAttributes(
                $this->order->user_id,
                $this->getOutgoingCoinSymbol($this->order),
                $this->isBuyOrder ? $this->order->total : $this->order->amount
            );

            DB::beginTransaction();
            try {
                $orderUpdateCount = Order::bulkUpdate($this->ordersAttributes->toArray());
                if ($orderUpdateCount !== $this->ordersAttributes->count()) {
                    throw new Exception('Failed to update order');
                }

                $walletUpdateCount = Wallet::bulkUpdate($this->walletsAttributes->toArray());
                if ($walletUpdateCount !== $this->walletsAttributes->count()) {
                    throw new Exception('Failed to update wallet');
                }

            } catch (Exception $exception) {
                DB::rollBack();
                Logger::error($exception, "[FAILED][ProcessMarketOrderService][cancelOrder]");
            }
            DB::commit();
        }



        $this->broadcastOrderSettlementAttributes->push([
            'user_id' => $this->order->user_id,
            'order_id' => $this->order->id,
            'category' => $this->order->category,
            'type' => $this->order->type,
            'price' => $this->order->price,
            'amount' => $this->order->amount,
            'total' => $this->order->total,
            'date' => $this->date->unix()
        ]);

        SettlementOrdersBroadcast::broadcast($this->order->trade_pair, $this->broadcastOrderSettlementAttributes->toArray());
    }

    private function getPrimaryWalletBalance(Order $order)
    {
        return Wallet::where('user_id', $order->user_id)
            ->where('symbol', $this->isBuyOrder ? $order->base_coin : $order->trade_coin)
            ->where('is_system_wallet', INACTIVE)
            ->value('primary_balance');
    }

    private function oppositeOrderProcessing(Order $oppositeOrder)
    {
        //For market order the order is always taker
        $isMaker = 0;

        if ($this->isBuyOrder) {
            //Calculate the order remaining total
            $remainingOrderTotal = bcsub($this->order->total, $this->exchangedOrderTotal);
            //Calculate the order remaining amount
            $remainingOrderAmount = bcdiv($remainingOrderTotal, $oppositeOrder->price);
        } else {
            //Calculate the order remaining amount
            $remainingOrderAmount = bcsub($this->order->amount, $this->exchangedOrderAmount);
            //Calculate the order remaining total
            $remainingOrderTotal = bcmul($remainingOrderAmount, $oppositeOrder->price);
        }

        //Calculate the opposite order remaining amount
        $remainingOppositeOrderAmount = bcsub($oppositeOrder->amount, $oppositeOrder->exchanged);
        //Calculate the opposite order remaining total
        $remainingOppositeOrderTotal = bcmul($remainingOppositeOrderAmount, $oppositeOrder->price);

        //If the order remaining total less than or equal zero then the process will stop
        if (bccomp($remainingOrderTotal, '0') <= 0) {
            return false;
        }

        /**
         * If the opposite order remaining total less than or equal zero
         * then the opposite order will be completed and return back the
         * remaining amount to the opposite orders's user's wallet and
         * the process will continue with remaining opposite orders
         */
        if (bccomp($remainingOppositeOrderTotal, '0') <= 0) {
            $this->settlementOrder($oppositeOrder);
            return true;
        }

        //Assume the order remaining amount is the tradable amount
        $tradableAmount = $remainingOrderAmount;
        //Assume the order status is pending
        $orderStatus = STATUS_PENDING;
        //Assume the opposite order status is pending
        $oppositeOrderStatus = STATUS_PENDING;

        /*
         * If the order remaining amount is greater than the opposite order amount
         * then the opposite order amount is the tradable amount
         * and the opposite order will be completed. If the order amount is less than
         * the opposite order then the order amount is the tradable amount and
         * the order will be completed. If both are equal then both order will be completed.
         */
        if (bccomp($remainingOrderAmount, $remainingOppositeOrderAmount) > 0) {
            $tradableAmount = $remainingOppositeOrderAmount;
            $oppositeOrderStatus = STATUS_COMPLETED;
        } else if (bccomp($remainingOrderAmount, $remainingOppositeOrderAmount) < 0) {
            $orderStatus = STATUS_COMPLETED;
            $this->lastOppositeOrder = $oppositeOrder;
        } else if (bccomp($remainingOrderAmount, $remainingOppositeOrderAmount) === 0) {
            $oppositeOrderStatus = STATUS_COMPLETED;
            $orderStatus = STATUS_COMPLETED;
        }

        //Calculate the tradable total
        $tradableTotal = bcmul($tradableAmount, $oppositeOrder->price);
        //Increase the exchange order amount by the tradable amount
        $this->exchangedOrderAmount = bcadd($this->exchangedOrderAmount, $tradableAmount);
        //Increase the exchange order total by the tradable total
        $this->exchangedOrderTotal = bcadd($this->exchangedOrderTotal, $tradableTotal);
        //Update latest price based on maker
        $this->exchangeLastPrice = $oppositeOrder->price;


        //Calculate trade fee
        $orderFee = $this->calculateTradeFee($this->order, $tradableAmount, $tradableTotal, $isMaker);
        $oppositeOrderFee = $this->calculateTradeFee($oppositeOrder, $tradableAmount, $tradableTotal, !$isMaker);

        //Increase the order exchange fee by the exchange fee
        $this->exchangedOrderFee = bcadd($this->exchangedOrderFee, $orderFee);

        //Push the opposite order attributes for update
        $this->ordersAttributes->push([
            'conditions' => ['id' => $oppositeOrder->id, 'status' => STATUS_PENDING],
            'fields' => [
                'status' => $oppositeOrderStatus,
                'exchanged' => ['increment', $tradableAmount]
            ]
        ]);

        //Push the order attributes for broadcasting
        $this->broadcastOrdersAttributes->push([
            'user_id' => $this->order->user_id,
            'order_id' => $this->order->id,
            'category' => $this->order->category,
            'type' => $this->order->type,
            'price' => $oppositeOrder->price,
            'amount' => $tradableAmount,
            'total' => $tradableTotal,
            'fee' => $orderFee,
            'is_maker' => $isMaker,
            'date' => $this->date->unix()
        ]);

        //Push the opposite order attributes for broadcasting
        $this->broadcastOrdersAttributes->push([
            'user_id' => $oppositeOrder->user_id,
            'order_id' => $oppositeOrder->id,
            'type' => $oppositeOrder->type,
            'price' => $oppositeOrder->price,
            'amount' => $tradableAmount,
            'total' => $tradableTotal,
            'fee' => $oppositeOrderFee,
            'is_maker' => !$isMaker,
            'date' => $this->date->unix()
        ]);

        //Assume the order referral earning is 0
        $orderReferralEarning = 0;
        //Assume the opposite order referral earning is 0
        $oppositeOrderReferralEarning = 0;

        //If the referral is active and the referral percentage is greater than 0 then
        if ($this->settings['referral'] && bccomp($this->settings['referral_percentage'], "0") > 0) {
            $orderReferralEarning = $this->giveReferralEarningToReferrer($this->order, $orderFee);
            $oppositeOrderReferralEarning = $this->giveReferralEarningToReferrer($oppositeOrder, $oppositeOrderFee);
        }

        //Push the order exchange attributes for insert
        $this->makeExchangesAttributes(
            $this->order,
            $tradableAmount,
            $orderFee,
            $orderReferralEarning,
            $isMaker,
            $oppositeOrder
        );

        //Push the opposite order exchange attributes for insert
        $this->makeExchangesAttributes(
            $oppositeOrder,
            $tradableAmount,
            $oppositeOrderFee,
            $oppositeOrderReferralEarning,
            !$isMaker,
            $this->order
        );

        //Push the incoming coin to the opposite order's user's wallet
        $this->makeWalletsAttributes(
            $oppositeOrder->user_id,
            $this->getIncomingCoinSymbol($oppositeOrder),
            $this->isBuyOrder ? bcsub($tradableTotal, $oppositeOrderFee) : bcsub($tradableAmount, $oppositeOrderFee)
        );

        //Push the order trade fee to the system's wallet
        $this->makeWalletsAttributes(
            $this->systemUser->id,
            $this->getIncomingCoinSymbol($this->order),
            bcsub($orderFee, $orderReferralEarning),
            ACTIVE
        );

        //Push the opposite order trade fee to the system's wallet
        $this->makeWalletsAttributes(
            $this->systemUser->id,
            $this->getIncomingCoinSymbol($oppositeOrder),
            bcsub($oppositeOrderFee, $oppositeOrderReferralEarning),
            ACTIVE
        );

        //Returning false will stop the further processing
        return $orderStatus === STATUS_PENDING;
    }

    private function submitThirdparty()
    {
        $getBalance = $this->order->type == ORDER_TYPE_BUY ? $this->api->fetchBalance(array('currency' => $this->order->base_coin)) : $this->api->fetchBalance(array('currency' => $this->order->trade_coin));
        $balance = $getBalance['info']['data'][0]['available'];

        if (!$balance && $balance < $this->order->amount) {
            throw new Exception('Insufficient Balance in Kucoin!');
            Logger::error($exception, "[FAILED][ProcessMarketOrderService][thirdpartyOrder]");
        } else {
//                    $orderParams = [
//                        'user_id' => 'ed9ed601-b4f0-4e77-bd5e-c0d6d4a1660d',
//                        'trade_coin' => $this->order->trade_coin,
//                        'base_coin' => $this->order->base_coin,
//                        'trade_pair' => $this->order->trade_pair,
//                        'category' => ORDER_CATEGORY_LIMIT,
//                        'type' => $this->order->type == ORDER_TYPE_BUY ? ORDER_TYPE_SELL : ORDER_TYPE_BUY,
//                        'price' => $this->order->price ?: null,
//                        'amount' => $this->order->amount ?: null,
//                        'total' => $this->order->total ?: null,
//                        'stop_limit' => $this->order->stop_limit ?: null,
//                        'maker_fee_in_percent' => 0,
//                        'taker_fee_in_percent' => 0,
//                        'status' => STATUS_PENDING,
//                    ];
//
//                    $KucoinOrder = Order::create($orderParams);
//                    if ($KucoinOrder) {
            try {
                $order = $this->order->category == 'limit' ? $this->api->create_order($this->order->trade_coin . '/' . $this->order->base_coin, $this->order->category, $this->order->type, $this->order->amount, $this->order->price, array('clientOrderId' => $this->order->user_id)) : $this->api->create_order($this->order->trade_coin . '/' . $this->order->base_coin, $this->order->category, $this->order->type, $this->order->amount, array('clientOrderId' => $this->order->user_id));
            } catch (Throwable $e) {
                Logger::error($e, "[FAILED][ProcessMarketOrderService][thirdpartyOrder]");
            }

            $fetch_order = $this->api->fetch_order($order['id'], $this->order->trade_coin . '/' . $this->order->base_coin);

            if ($fetch_order['status'] == 'closed' && $fetch_order['filled'] == 0.0) {
                //Push the order attributes for update
                $this->order->update([
                    'status' => STATUS_FAILED,
                    'thirdparty' => $this->provider,
                    'thirdparty_order_id' => $order['id']
                ]);
                throw new Exception('The order was closed without being executed. Please try again later or contact support.');
                Logger::error($exception, "[FAILED][ProcessMarketOrderService][thirdpartyOrder]");
            } else {
                $update_order = $this->order->update([
                    'price' => $fetch_order['price'],
                    'status' => STATUS_COMPLETED,
                    'exchanged' => $this->order->amount,
                    'thirdparty' => $this->provider,
                    'thirdparty_order_id' => $order['id'],
                ]);
                if ($update_order) {
                    $wallet = Wallet::where('user_id', $this->order->user_id)->where('symbol', $this->order->type == ORDER_TYPE_BUY ? $this->order->trade_coin : $this->order->base_coin)->first();
                    if (!$wallet->increment('primary_balance', $this->order->amount)) {
                        throw new Exception(__("Failed to update wallet balance in Thirdparty mode"));
                    }

                } else {
                    throw new Exception(__("Failed to update system fee to system wallet"));
                }

                return;
            }
        }
    }
}
