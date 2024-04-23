<?php

namespace App\Jobs\Binance;

use App\Jobs\Withdrawal\WithdrawalConfirmationJob;
use App\Models\Wallet\Wallet;
use App\Models\Withdrawal\WalletWithdrawal;
use App\Override\Api\BinanceClient;
use App\Override\Logger;
use Exception;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Collection;

class ProcessBinanceWithdrawal implements ShouldQueue
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

    public function handle()
    {
        foreach ($this->transactions as $transaction) {
            try {
                $response = $this->call('eth_getTransactionReceipt', [$transaction['hash']]);
                $response->throw();
                if ($response->successful()) {
                    $status = hexdec($response['result']['status']) ? STATUS_COMPLETED : STATUS_FAILED;
                    $withdrawal = WalletWithdrawal::where('txn_id', $transaction['hash'])
                        ->where('status', STATUS_PENDING)
                        ->first();

                    if (!empty($withdrawal)) {
                        WithdrawalConfirmationJob::dispatch($withdrawal, ['status' => $status, 'txn_id' => $transaction['hash']]);
                    }
                }
            } catch (Exception $exception) {
                Logger::error($exception, "[FAILED][ProcessBinanceWithdrawal]");
            }
        }
    }
}
