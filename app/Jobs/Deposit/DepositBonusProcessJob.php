<?php

namespace App\Jobs\Deposit;

use App\Services\Deposit\DepositBonusService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class DepositBonusProcessJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $depositData;

    public function __construct($depositData)
    {
        $this->depositData = $depositData;
    }

    public function handle(DepositBonusService $depositBonusService)
    {
        $depositBonusService->deposit($this->depositData);
    }
}
