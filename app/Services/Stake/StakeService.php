<?php

namespace App\Services\Stake;

use App\Jobs\Stake\StakeProcessJob;
use App\Mail\Stake\StakeComplete;
use App\Models\Stake\WalletStake;
use App\Services\Logger\Logger;
use Carbon\Carbon;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class StakeService
{
    protected $stake;

    public function __construct(WalletStake $stake)
    {
        $this->stake = $stake;
    }

    public function show()
    {
        $data['stake'] = $this->stake;
        $data['title'] = __("Stake Details");
        return view('stake.admin.show', $data);
    }

    public function stake()
    {
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
                return false;
            }

            DB::commit();
            return true;
    }
}
