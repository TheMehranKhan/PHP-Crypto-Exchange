<?php

namespace App\Services\Orders;

use App\Models\Core\User;
use App\Models\Order\Order;
use App\Models\Wallet\Wallet;
use App\Services\Logger\Logger;
use Carbon\Carbon;
use Exception;
use ccxt;

class ProcessLimitOrderService
{
    use  ProcessOrder;

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
    private $orderStatus;
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
            //Order processing start from here
            $this->startProcessing();

            if (bccomp($this->exchangedOrderAmount, '0') <= 0) {
                if (settings('enable_thirdparty_exchange') == ACTIVE) {
                    $this->submitThirdparty();
                }
                return;
            }

            if (!empty($this->lastOppositeOrder)) {
                //Opposite order settlement
                $this->settlementOrder($this->lastOppositeOrder);
            }

            //Push the order attributes for update
            $this->ordersAttributes->push([
                'conditions' => ['id' => $this->order->id, 'status' => STATUS_PENDING],
                'fields' => [
                    'status' => $this->orderStatus,
                    'exchanged' => ['increment', $this->exchangedOrderAmount]
                ]
            ]);

            $walletAmount = bcsub($this->exchangedOrderTotal, $this->exchangedOrderFee);
            if ($this->isBuyOrder) {
                $walletAmount = bcsub($this->exchangedOrderAmount, $this->exchangedOrderFee);
            }

            //Update the order's user's wallet
            $this->makeWalletsAttributes(
                $this->order->user_id,
                $this->getIncomingCoinSymbol($this->order),
                $walletAmount
            );

            //Order settlement
            $this->settlementOrder($this->order);

            //Closing the process
            $this->close();
        } catch (Exception $exception) {
            Logger::error($exception, "[FAILED][ProcessLimitOrderService][process]");
        }
        return;
    }

    private function oppositeOrderProcessing(Order $oppositeOrder)
    {
        //Assume the order is maker
        $isMaker = 1;

        //The order is taker if the order is place after the opposite order
        if ($this->order->created_at > $oppositeOrder->created_at) {
            $isMaker = 0;
        }

        //Calculate the order remaining amount
        $remainingOrderAmount = bcsub(bcsub($this->order->amount, $this->order->exchanged), $this->exchangedOrderAmount);
        //Calculate the order remaining total
        $remainingOrderTotal = bcmul($remainingOrderAmount, $this->order->price);
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
        $this->orderStatus = STATUS_PENDING;
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
            $this->orderStatus = STATUS_COMPLETED;
            $this->lastOppositeOrder = $oppositeOrder;
        } else if (bccomp($remainingOrderAmount, $remainingOppositeOrderAmount) === 0) {
            $oppositeOrderStatus = STATUS_COMPLETED;
            $this->orderStatus = STATUS_COMPLETED;
        }

        //Calculate the opposite order total
        $oppositeOrderTotal = bcmul($tradableAmount, $oppositeOrder->price);
        //Calculate the order total
        $orderTotal = bcmul($tradableAmount, $this->order->price);
        //Increase the exchange order amount by the tradable amount
        $this->exchangedOrderAmount = bcadd($this->exchangedOrderAmount, $tradableAmount);
        //Increase the exchange order total by the order total
        $this->exchangedOrderTotal = bcadd($this->exchangedOrderTotal, $orderTotal);
        //Update latest price based on maker
        $this->exchangeLastPrice = $isMaker ? $this->order->price : $oppositeOrder->price;

        //Calculate the order trade fee
        $orderFee = $this->calculateTradeFee($this->order, $tradableAmount, $orderTotal, $isMaker);
        //Calculate the opposite order trade fee
        $oppositeOrderFee = $this->calculateTradeFee($oppositeOrder, $tradableAmount, $oppositeOrderTotal, !$isMaker);

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
            'price' => $this->order->price,
            'amount' => $tradableAmount,
            'total' => $orderTotal,
            'fee' => $orderFee,
            'is_maker' => $isMaker,
            'date' => $this->date->unix()
        ]);

        //Push the opposite order attributes for broadcasting
        $this->broadcastOrdersAttributes->push([
            'user_id' => $oppositeOrder->user_id,
            'order_id' => $oppositeOrder->id,
            'category' => $oppositeOrder->category,
            'type' => $oppositeOrder->type,
            'price' => $oppositeOrder->price,
            'amount' => $tradableAmount,
            'total' => $oppositeOrderTotal,
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
            $this->isBuyOrder ? bcsub($oppositeOrderTotal, $oppositeOrderFee) : bcsub($tradableAmount, $oppositeOrderFee)
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
        return $this->orderStatus === STATUS_PENDING;
    }

    private function submitThirdparty()
    {
        $getBalance = $this->order->type == ORDER_TYPE_BUY ? $this->api->fetchBalance(array('currency' => $this->order->base_coin)) : $this->api->fetchBalance(array('currency' => $this->order->trade_coin));
        $balance = $getBalance['info']['data'][0]['available'];

        if (!$balance && $balance < $this->order->amount) {
            throw new Exception('Insufficient Balance in Kucoin!');
            Logger::error($exception, "[FAILED][ProcessMarketOrderService][thirdpartyOrder]");
        } else {
            try {
                $order = $this->order->category == 'limit' ? $this->api->create_order($this->order->trade_coin . '/' . $this->order->base_coin, $this->order->category, $this->order->type, $this->order->amount, $this->order->price, array('clientOrderId' => $this->order->user_id)) : $this->api->create_order($this->order->trade_coin . '/' . $this->order->base_coin, $this->order->category, $this->order->type, $this->order->amount, array('clientOrderId' => $this->order->user_id));
            } catch (Throwable $e) {
                Logger::error($e, "[FAILED][ProcessMarketOrderService][thirdpartyOrder]");
            }

            $fetch_order = $this->api->fetch_order($order['id'], $this->order->trade_coin . '/' . $this->order->base_coin);

            if ($fetch_order['status'] == 'closed' && $fetch_order['filled'] == 0.0) {
                return;
            } else {
                $update_order = $this->order->update([
                    'price' => $fetch_order['price'],
                    'status' => STATUS_PENDING,
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
