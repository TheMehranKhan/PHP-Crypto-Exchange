<?php

namespace App\Models\Coin;

use App\Models\Stake\WalletBonus;
use App\Override\Eloquent\LaraframeModel as Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CoinBonus extends Model
{
    use HasFactory;

    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'name',
        'symbol',
        'minimum_amount',
        'maximum_amount',
        'bonus_usage_count',
        'bonus_earning_type',
        'bonus_earning',
        'coin_earning',
        'is_active'
    ];

    protected static function boot(): void
    {
        parent::boot();

        static::creating(static function ($model) {
            $model->{$model->getKeyName()} = Str::uuid()->toString();
        });
    }

    public function coin(): BelongsTo
    {
        return $this->belongsTo(Coin::class, 'symbol', 'symbol');
    }

    public function bonuses()
    {
        return $this->hasMany(WalletBonus::class, 'package_id', 'id');
    }
}
