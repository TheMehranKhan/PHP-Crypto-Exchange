<?php

namespace App\Jobs\Stake;

use App\Models\Stake\WalletStake;
use App\Override\Logger;
use App\Services\Stake\StakeService;
use Carbon\Carbon;
use Exception;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;

class StakeProcessJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $stake;
    public $timeout = 120;
    public $deleteWhenMissingModels = true;


    public function __construct(WalletStake $stake)
    {
        $this->queue = 'default_long';
        $this->connection = 'redis-long-running';
        $this->stake = $stake;
    }

    public function handle(): void
    {
        //The process will not continue if status is not pending
        if ($this->stake->status !== STATUS_PROCESSING) {
            return;
        }

        if ($this->stake->completed_at > Carbon::now()) {
            return;
        }


        DB::beginTransaction();
        try {
            if (!$this->stake->update(['status' => STATUS_COMPLETED])) {
                throw new Exception(__('Failed to update stake wallet status.'));
            }

            if (!$this->stake->wallet->increment('primary_balance', $this->stake->earning)) {
                throw new Exception(__('Failed to update wallet.'));
            }
        } catch (Exception $exception) {
            DB::rollBack();
            Logger::error($exception, "[FAILED][Stake][complete]");
        }

        DB::commit();
    }

    public function failed(Exception $exception)
    {
        Logger::error($exception, "[FAILED][StakeProcessJob]");
    }

}