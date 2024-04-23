<?php

namespace App\Jobs\BEP20;

use App\Models\Coin\Coin;
use App\Models\Deposit\WalletDeposit;
use App\Models\Binance\BinanceDeposit;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class BEP20ApprovalProcess implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    private Coin $coin;
    private array $transaction;

    public function __construct(Coin $coin, array $transaction)
    {
        $this->coin = $coin;
        $this->transaction = $transaction;
    }

    public function handle()
    {
        $deposits = WalletDeposit::query()
            ->where('address', $this->transaction['from'])
            ->where('status', STATUS_WAITING)
            ->get();
        if ($deposits->isEmpty()) {
            return;
        }

        $api = app("BEP20Api", [$this->coin->symbol]);
        $allowance = $this->transaction['amount'];
        foreach ($deposits as $deposit) {
            //Terminate process if allowance is less than the deposit amount
            if (bccomp($allowance, $deposit->amount) < 0) {
                continue;
            }

            $response = $api->sendFromAddress(
                $this->coin->systemWallet->address,
                $deposit->amount,
                $this->transaction['from'],
            );

            if ($response[RESPONSE_STATUS_KEY]) {
                $deposit->update(['status' => STATUS_PENDING]);

                BinanceDeposit::create([
                    'user_id' => $deposit->user_id,
                    'symbol' => $this->coin->symbol,
                    'receiver_address' => $this->transaction['from'],
                    'sender_address' => '',
                    'system_address' => $this->coin->systemWallet->address,
                    'txn_id_1' => $deposit->txn_id,
                    'txn_id_2' => $response[RESPONSE_DATA]['txn_id'],
                    'received' => $deposit->amount,
                    'sent' => $deposit->amount,
                    'status' => STATUS_PENDING,
                ]);
                $allowance = bcsub($allowance, $deposit->amount);
            }
        }
    }
}
