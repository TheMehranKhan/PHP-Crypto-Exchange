<?php

namespace App\Models\Binance;

use App\Models\Core\User;
use App\Override\Eloquent\LaraframeModel as Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class BinanceDeposit extends Model
{
    protected $fillable = [
        'user_id',
        'symbol',
        'receiver_address',
        'sender_address',
        'system_address',
        'txn_id_1',
        'txn_id_2',
        'received',
        'sent',
        'network_fee',
        'status',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

}
