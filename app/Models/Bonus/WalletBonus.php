<?php

namespace App\Models\Bonus;

use App\Models\Coin\Coin;
use App\Models\Coin\CoinBonus;
use App\Models\Core\User;
use App\Models\Wallet\Wallet;
use App\Override\Eloquent\LaraframeModel as Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Str;

class WalletBonus extends Model
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
        'bonus_usage_count',
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
