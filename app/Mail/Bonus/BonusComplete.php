<?php

namespace App\Mail\Bonus;

use App\Models\Bonus\WalletBonus;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class BonusComplete extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;

    public $stake;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(WalletStake $stake)
    {
        $this->stake = $stake;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('email.stake.complete')
            ->subject("Stake Confirmation");
    }
}
