<?php

namespace App\Console\Commands;

use Amp\Loop;
use Amp\Websocket;
use App\Jobs\Binance\BinanceBlockJob;
use Illuminate\Console\Command;

class BinanceWebSocket extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'binance:websocket';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Binance websocket';

    public function handle()
    {
        $this->info('Binance websocket started.');
        Loop::run(function () {
            $connection = yield Websocket\Client\connect(settings('binance_websocket_url'));
            yield $connection->send('{"jsonrpc":"2.0", "id": 1, "method": "eth_subscribe", "params": ["newHeads"]}');

            while ($message = yield $connection->receive()) {
                $payload = yield $message->buffer();
                $response = json_decode($payload, true);

                if (isset($response['params']['result']['hash'])) {
                    BinanceBlockJob::dispatch($response['params']['result']['hash']);
                }
            }
        });
        $this->info('Binance websocket stopped.');
    }
}
