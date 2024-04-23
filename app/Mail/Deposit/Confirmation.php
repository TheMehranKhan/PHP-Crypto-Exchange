<?php

namespace App\Mail\Deposit;

use App\Models\Deposit\WalletDeposit;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class Confirmation extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;

    public $deposit;
    public $profile;

    public function __construct($deposit, $profile)
    {
        $this->deposit = $deposit;
        $this->profile = $profile;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('email.deposit.confirmation')
            ->subject("Deposit Confirmation");
    }
}
