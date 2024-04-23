<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
        Commands\OrderSeeder::class,
    ];

    /**
     * Define the application's command schedule.
     *
     * @param Schedule $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // $schedule->command('inspire')
        //          ->hourly();
        if (settings('robot_active_status') == 1) {
            $cronTime = settings('robot_time_work');
            $cronPurge = settings('robot_time_purge');

            $schedule->command('OrderSeeder:insert')
                ->cron('*/' . $cronTime . ' * * * *')->onSuccess(function () {
                    // The task succeeded...
                })
                ->onFailure(function () {
                    // The task failed...

                });

            $schedule->command('OrderSeeder:purge')
                ->cron(''.$cronPurge.' * * * *')->onSuccess(function () {
                    // The task succeeded...
                })
                ->onFailure(function () {
                    // The task failed...

                });
        }
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__ . '/Commands');

        require base_path('routes/console.php');
    }
}
