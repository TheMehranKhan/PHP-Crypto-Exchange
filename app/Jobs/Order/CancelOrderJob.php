<?php

namespace App\Jobs\Order;

use App\Broadcasts\Exchange\CancelOrderBroadcast;
use App\Models\Order\Order;
use App\Models\Wallet\Wallet;
use App\Services\Logger\Logger;
use Exception;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;
use ccxt;

class CancelOrderJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $order;
    public $deleteWhenMissingModels = true;
    public $beforeChangeStatus = null;

    public $api;

    public $provider;

    public function __construct(Order $order)
    {
        $this->queue = 'order-cancel';
        $this->order = $order->withoutRelations();
        $this->beforeChangeStatus = $this->order->status;

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


    public function handle()
    {
        DB::beginTransaction();

        try {
            $canceledAmount = bcsub($this->order->amount, $this->order->exchanged);

            if ($this->order->type === ORDER_TYPE_BUY) {
                $coin = $this->order->base_coin;
                $returnBalance = bcmul($canceledAmount, $this->order->price);
            } else {
                $coin = $this->order->trade_coin;
                $returnBalance = $canceledAmount;
            }

            $orderAttributes = [
                'canceled' => $canceledAmount,
                'status' => STATUS_CANCELED
            ];

            if (!$this->order->update($orderAttributes)) {
                throw new Exception("Failed to change state to cancel.");
            }

            $wallet = Wallet::where('user_id', $this->order->user_id)
                ->where('symbol', $coin)
                ->withoutSystemWallet()
                ->first();

            if (!$wallet->increment('primary_balance', $returnBalance)) {
                throw new Exception("Failed to update wallet for cancel order.");
            }

        } catch (Exception $e) {
            DB::rollBack();
            Logger::error($e, "[FAILED][CancelOrderJob][handle]");
            return;
        }

        DB::commit();

        if (!empty($this->order->thirdparty) && settings('enable_thirdparty_exchange') == ACTIVE) {
            try {
                $fetch_order = $this->api->fetch_order($this->order->thirdparty_order_id, $this->order->trade_coin . '/' . $this->order->base_coin);

                if ($fetch_order['status'] != STATUS_CANCELED && $fetch_order['status'] != 'closed') {
                    $this->api->cancel_order($this->order->thirdparty_order_id, $this->order->trade_coin . '/' . $this->order->base_coin);
                }

            } catch (Throwable $e) {
                throw new Exception('Order cancellation failed on thirdparty, Please report to support.'.$e);
            }

        }

        CancelOrderBroadcast::broadcast($this->order, $this->beforeChangeStatus);
    }
}
