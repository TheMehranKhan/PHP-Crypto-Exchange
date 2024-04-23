<?php

namespace App\Console\Commands;

use App\Jobs\Stake\StakeProcessJob;
use App\Models\Stake\WalletStake;
use Carbon\Carbon;
use Illuminate\Console\Command;

class StakeProcess extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'StakeProcess:run';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Stake Processing';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $stakes = WalletStake::where('status',STATUS_PROCESSING)->whereDate('completed_at', '<=', Carbon::now())->get();
        foreach ($stakes as $stake){
            StakeProcessJob::dispatch($stake);
        }
        $this->info('Stake Processing Dispatched.');
    }
}
