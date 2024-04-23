<?php

namespace App\Console\Commands;

use App\Models\Order\Order;
use Illuminate\Console\Command;
use DB;

class RobotPurge extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'OrderSeeder:purge';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Remove Extra Data from Robot';

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
        ini_set('max_execution_time', -1);
        $this->clearDB(10);
    }

    private function clearDB($keep)
    {
        ini_set('max_execution_time', -1);
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        $ids = [];

        $deleteUs = Order::latest()->where('user_id', '07178aa8-bbd6-4f8b-9fbf-48711485ab8d')->where('status', 'completed')->take(10000)->skip($keep)->get();

        foreach($deleteUs as $deleteMe){
            $ids[] = $deleteMe->id;
        }

        $order = Order::destroy($ids);
        if ($order){
            DB::table('exchanges')->leftJoin('orders', 'exchanges.order_id', '=', 'orders.id')
                ->whereNull('orders.id')
                ->delete();
        }
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}
