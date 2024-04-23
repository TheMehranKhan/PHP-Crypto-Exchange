<?php

namespace App\Jobs\Binance;

use App\Jobs\BEP20\ProcessBEP20Transaction;
use App\Models\Coin\Coin;
use App\Models\Wallet\Wallet;
use App\Override\Api\BinanceClient;
use App\Override\Logger;
use Exception;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class BinanceBlockJob implements ShouldQueue
{

    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels, BinanceClient;

    const FULL_TRANSACTION_OBJECT = true;

    private string $blockHash;
    private string $url;

    public function __construct(string $blockHash)
    {
        $this->queue = 'default_long';
        $this->connection = 'redis-long-running';
        $this->blockHash = $blockHash;
        $this->url = settings("Binance_server_url") ?? "";
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        try {
            $response = $this->call('eth_getBlockByHash', [$this->blockHash, BinanceBlockJob::FULL_TRANSACTION_OBJECT]);
            $response->throw();
            if ($response->successful()) {
                $transactions = collect($response['result']['transactions']);
                $toAddresses = $transactions->pluck('to')->unique()->filter();
                $fromAddresses = $transactions->pluck('from')->unique()->filter();

                //Deposit Processing
                $toWallets = Wallet::query()
                    ->whereHas('coin', function ($query) {
                        $query->where('api->selected_apis', API_BINANCE);
                    })
                    ->whereIn('address', $toAddresses)
                    ->get();

                foreach ($toWallets as $toWallet) {
                    ProcessBinanceDeposit::dispatch($toWallet, $transactions->where('to', $toWallet->address));
                }

                //Withdrawal Confirmation
                $fromWallets = Wallet::query()
                    ->whereHas('coin', function ($query) {
                        $query->where('api->selected_apis', API_BINANCE);
                    })
                    ->whereIn('address', $fromAddresses)
                    ->systemWallet()
                    ->get();

                foreach ($fromWallets as $fromWallet) {
                    ProcessBinanceWithdrawal::dispatch($fromWallet, $transactions->where('from', $fromWallet->address));
                }

                //ETH Deposit on BEP20 Address
                $toWallets = Wallet::query()
                    ->whereHas('coin', function ($query) {
                        $query->where('api->selected_apis', API_BEP20);
                    })
                    ->whereIn('address', $toAddresses)
                    ->get();

                foreach ($toWallets as $toWallet) {
                    $api = app("BEP20Api", [$toWallet->symbol]);
                    $api->approve(bcpow(10, 12), $toWallet->address, $toWallet->passphrase);
                }
                //BEP20 Processing
                $coins = Coin::query()
                    ->where('api->selected_apis', API_BEP20)
                    ->whereIn('contract_address', $toAddresses)
                    ->get();
                foreach ($coins as $coin) {
                    ProcessBEP20Transaction::dispatch($coin, $transactions->where('to', strtolower($coin->contract_address)));
                }
            }
        } catch (Exception $exception) {
            Logger::error($exception, "[FAILED][BinanceBlockJob]");
        }
    }
}
