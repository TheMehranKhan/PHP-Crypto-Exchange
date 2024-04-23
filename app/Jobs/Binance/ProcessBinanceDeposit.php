<?php

namespace App\Jobs\Binance;

use App\Models\Wallet\Wallet;
use App\Override\Api\BinanceClient;
use App\Override\Logger;
use App\Services\Binance\BinanceDepositService;
use Exception;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Collection;

class ProcessBinanceDeposit implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels, BinanceClient;

    private Wallet $wallet;
    private Collection $transactions;
    private string $url;

    public function __construct(Wallet $wallet, Collection $transactions)
    {
        $this->wallet = $wallet;
        $this->transactions = $transactions;
        $this->url = settings("binance_server_url") ?? "";
    }

    public function handle(BinanceDepositService $depositService)
    {
        foreach ($this->transactions as $transaction) {
            try {
                $response = $this->call('eth_getTransactionReceipt', [$transaction['hash']]);
                $response->throw();
                if ($response->successful() && hexdec($response['result']['status'])) {
                    if ($this->wallet->is_system_wallet && Wallet::where('address', $transaction['from'])->exists()) {
                        $depositService->confirmed($this->wallet, $transaction);
                    } else {
                        $depositService->sendToSystemWallet($this->wallet, $transaction);
                    }
                }
            } catch (Exception $exception) {
                Logger::error($exception, "[FAILED][ProcessBinanceDeposit]");
            }
        }
    }
}
