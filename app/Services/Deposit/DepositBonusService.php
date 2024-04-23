<?php


namespace App\Services\Deposit;


use App\Jobs\Deposit\DepositProcessJob;

//use App\Mail\Deposit\Confirmation;
use App\Mail\Deposit\Confirmation;
use App\Models\Core\Notification;
use App\Models\Core\User;
use App\Models\Deposit\WalletDeposit;
use App\Models\Wallet\Wallet;
use App\Services\Logger\Logger;
use App\Services\Wallet\SystemWalletService;
use Carbon\Carbon;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class DepositBonusService
{
    private $wallet;

    public function deposit($depositData)
    {
        $user_id = $depositData['id'];
        $this->wallet = Wallet::where("symbol", settings('register_bonus_symbol'))->where('user_id', $user_id)->first();
        if ($this->wallet) {
            DB::beginTransaction();
            try {

                $this->wallet->increment('primary_balance', settings('register_bonus_amount'));

                if (empty($this->wallet)) {
                    throw new Exception("No wallet found with this address: {$depositData['address']}");
                }

            } catch (Exception $exception) {
                DB::rollBack();
                Logger::error($exception, "[FAILED][DepositBonusService][deposit]");
            }
            DB::commit();
        }
    }
}
