<?php

namespace App\Models\Stake;

use App\Models\BankAccount\BankAccount;
use App\Models\Coin\Coin;
use App\Models\Coin\CoinStake;
use App\Models\Core\User;
use App\Models\Wallet\Wallet;
use App\Override\Eloquent\LaraframeModel as Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Str;

class WalletStake extends Model
{
    use HasFactory;

    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'user_id',
        'wallet_id',
        'package_id',
        'symbol',
        'amount',
        'system_fee',
        'staking_months',
        'earning',
        'completed_at',
        'status'
    ];

    protected static function boot(): void
    {
        parent::boot();

        static::creating(static function ($model) {
            $model->{$model->getKeyName()} = Str::uuid()->toString();
        });
    }

    public function wallet(): BelongsTo
    {
        return $this->belongsTo(Wallet::class);
    }

    public function coin(): BelongsTo
    {
        return $this->belongsTo(Coin::class, 'symbol', 'symbol');
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
