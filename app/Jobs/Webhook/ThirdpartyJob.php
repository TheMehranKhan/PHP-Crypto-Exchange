<?php

namespace App\Jobs\Webhook;

use App\Jobs\Order\CancelOrderJob;
use App\Models\Wallet\Wallet;
use App\Override\Logger;
use Exception;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use ccxt;


class ThirdpartyJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $order;

    public $api;

    public $provider;

    public function __construct($order)
    {
        $this->order = $order;
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

        try {
            $fetch_order = $this->api->fetch_order($this->order->thirdparty_order_id, $this->order->trade_coin . '/' . $this->order->base_coin);

            if($fetch_order['status'] == 'closed' && $fetch_order['filled'] == 0.0) {
                CancelOrderJob::dispatch($this->order);
            } elseif ($fetch_order['status'] == STATUS_CANCELED){
                CancelOrderJob::dispatch($this->order);
            } else {
                $update_order = $this->order->update([
                    'exchanged' => $fetch_order['filled'],
                    'total' => $fetch_order['cost'],
                    'stop_limit' => !empty($fetch_order['stopPrice']) ? $fetch_order['stopPrice'] : NULL,
                    'thirdparty_fee' => !empty($fetch_order['fee']['cost']) ? $fetch_order['fee']['cost'] : NULL,
                    'thirdparty_fee_symbol' => !empty($fetch_order['fee']['currency']) ? $fetch_order['fee']['currency'] : NULL,
                    'price' => $fetch_order['price'],
                    'status' => $fetch_order['status'] == 'closed' ? STATUS_COMPLETED : STATUS_PENDING,
                ]);
                if ($update_order && $fetch_order['status'] == 'closed') {
                    $wallet = Wallet::where('user_id', $this->order->user_id)->where('symbol', $this->order->type == ORDER_TYPE_BUY ? $this->order->trade_coin : $this->order->base_coin)->first();
                    if (!$wallet->increment('primary_balance', $this->order->amount)) {
                        throw new Exception(__("Failed to update wallet balance in Thirdparty mode"));
                    }

                }
            }
            return;
        } catch (Throwable $e) {
            \App\Services\Logger\Logger::error($e, "[FAILED][ProcessMatchThirdpartyOrder][thirdpartyOrder]");
        }
    }

    public function failed(Exception $exception)
    {
        Logger::error($exception, "[FAILED][ThirdpartyJob]");
    }
}

