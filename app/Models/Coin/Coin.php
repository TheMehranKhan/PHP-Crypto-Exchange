<?php

namespace App\Models\Coin;

use App\Jobs\CoinPair\DisableAssociatedCoinPairJob;
use App\Jobs\Wallet\GenerateUsersWalletsJob;
use App\Models\BankAccount\BankAccount;
use App\Models\Core\User;
use App\Models\Deposit\WalletDeposit;
use App\Models\Wallet\Wallet;
use App\Models\Withdrawal\WalletWithdrawal;
use App\Override\Eloquent\LaraframeModel as Model;
use App\Override\Logger;
use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Coin extends Model
{
    use HasFactory;

    public $incrementing = false;
    protected $primaryKey = 'symbol';
    protected $keyType = 'string';

    protected $fillable = [
        'symbol',
        'name',
        'type',
        'token_info',
        'icon',
        'exchange_status',
        'deposit_status',
        'deposit_fee',
        'deposit_fee_type',
        'minimum_deposit_amount',
        'total_deposit',
        'total_deposit_fee',
        'withdrawal_status',
        'withdrawal_fee',
        'withdrawal_fee_type',
        'minimum_withdrawal_amount',
        'daily_withdrawal_limit',
        'total_withdrawal',
        'total_withdrawal_fee',
        'api',
        'is_active',
        'decimal_place',
        'contract_address',
        'property_id',
    ];

    protected static function boot(): void
    {
        parent::boot();

        static::updated(static function ($model) {
            if ($model->wasChanged('is_active') && $model->is_active) {
                if (env('QUEUE_CONNECTION', 'sync') === 'sync') {
                    GenerateUsersWalletsJob::dispatchSync($model);
                } else {
                    GenerateUsersWalletsJob::dispatch($model);
                }
            }

            if ($model->wasChanged('is_active') && $model->is_active == INACTIVE) {
                DisableAssociatedCoinPairJob::dispatchSync($model);
            }
        });
    }

    public function baseCoinPairs(): HasMany
    {
        return $this->hasMany(CoinPair::class, 'base_coin', 'symbol');
    }

    public function coinPairs(): HasMany
    {
        return $this->hasMany(CoinPair::class, 'coin', 'symbol');
    }

    public function coinStakes(): HasMany
    {
        return $this->hasMany(CoinStake::class, 'symbol', 'symbol');
    }

    public function coinBonuses(): HasMany
    {
        return $this->hasMany(CoinBonus::class, 'symbol', 'symbol')->where('is_active',ACTIVE);
    }

    public function bankAccount(): BelongsTo
    {
        return $this->belongsTo(BankAccount::class);
    }

    public function getApiAttribute($value): array
    {
        return !is_null($value) ? json_decode($value, true) : [];
    }

    public function setApiAttribute($value): void
    {
        $this->attributes['api'] = json_encode($value);
    }

    public function getAssociatedApi($api = null)
    {
        if (isset($this->api['selected_apis'])) {
            if ($this->type === COIN_TYPE_FIAT && $api && in_array($api, $this->api['selected_apis'])) {
                return app($api, [$this->symbol]);
            } else if (in_array($this->type, [COIN_TYPE_CRYPTO, COIN_TYPE_ERC20, COIN_TYPE_BEP20, COIN_TYPE_TRC10, COIN_TYPE_TRC20])) {
                return app($this->api['selected_apis'], [$this->symbol]);
            }
        }
        return null;
    }

    public function deposits()
    {
        return $this->hasMany(WalletDeposit::class, 'symbol', 'symbol');
    }

    public function withdrawals()
    {
        return $this->hasMany(WalletWithdrawal::class, 'symbol', 'symbol');
    }

    public function generateSystemAddress()
    {
        if ($this->systemWallet()->exists()) {
            switch ($this->api['selected_apis']) {
                case API_ETHEREUM:
                    if (empty($this->systemWallet->address) && empty($this->systemWallet->passphrase)) {
                        $response = app(API_ETHEREUM, [$this->symbol])->generateAddress();
                        if ($response['error'] === 'ok') {
                            $this->systemWallet()->update([
                                'address' => $response['result']['address'],
                                'passphrase' => encrypt($response['result']['passphrase']),
                            ]);
                        } else {
                            Logger::error(new Exception($response['error']), '[FAILED][Coin][generateSystemAddress]');
                        }
                    }
                    break;
                case API_TRON:
                case API_TRC20:
                case API_TRC10:
                    if (empty($this->systemWallet->address) && empty($this->systemWallet->private_key)) {
                        $checkWallet = Wallet::where('is_system_wallet', 1)
                            ->whereNotNull('address')
                            ->whereHas('coin', function ($query) {
                                $query->whereIn('type', [COIN_TYPE_TRC20, COIN_TYPE_TRC10])
                                    ->orWhere('symbol', 'TRX');
                            })
                            ->first();
                        if ($checkWallet) {
                            $response = [
                                'error' => 'ok',
                                'result' => [
                                    'address' => $checkWallet->address,
                                    'privateKey' => $checkWallet->private_key,
                                    'publicKey' => $checkWallet->public_key,
                                ]
                            ];
                        } else {
                            $response = app(API_TRON, [$this->symbol])->generateAddress();
                        }

                        if ($response['error'] === 'ok') {
                            $this->systemWallet()->update([
                                'address' => $response['result']['address'],
                                'private_key' => encrypt($response['result']['privateKey']),
                                'public_key' => encrypt($response['result']['publicKey']),
                            ]);
                        } else {
                            Logger::error(new Exception($response['error']), '[FAILED][Coin][generateSystemAddress]');
                        }
                    }
                    break;
            }
        } else {
            // Retrieve super admin user
            $admin = User::superAdmin()->first();
            if (!empty($admin)) {
                switch ($this->api['selected_apis']) {
                    case API_ETHEREUM:
                        $response = app(API_ETHEREUM, [$this->symbol])->generateAddress();
                        if ($response['error'] === 'ok') {
                            Wallet::create([
                                'user_id' => $admin->id,
                                'symbol' => $this->symbol,
                                'address' => $response['result']['address'],
                                'passphrase' => encrypt($response['result']['passphrase']),
                                'is_system_wallet' => ACTIVE,
                            ]);
                        } else {
                            Logger::error(new Exception($response['error']), '[FAILED][Coin][generateSystemAddress]');
                        }
                        break;
                    case API_TRON:
                        $response = app(API_TRON, [$this->symbol])->generateAddress();
                        if ($response['error'] === 'ok') {
                            Wallet::create([
                                'user_id' => $admin->id,
                                'symbol' => $this->symbol,
                                'address' => $response['result']['address'],
                                'public_key' => encrypt($response['result']['publicKey']),
                                'private_key' => encrypt($response['result']['privateKey']),
                                'is_system_wallet' => ACTIVE,
                            ]);
                        } else {
                            Logger::error(new Exception($response['error']), '[FAILED][Coin][generateSystemAddress]');
                        }
                        break;
                    case API_TRC20:
                        $response = app(API_TRC20, [$this->symbol])->generateAddress();
                        if ($response['error'] === 'ok') {
                            Wallet::create([
                                'user_id' => $admin->id,
                                'symbol' => $this->symbol,
                                'address' => $response['result']['address'],
                                'public_key' => encrypt($response['result']['publicKey']),
                                'private_key' => encrypt($response['result']['privateKey']),
                                'is_system_wallet' => ACTIVE,
                            ]);
                        } else {
                            Logger::error(new Exception($response['error']), '[FAILED][Coin][generateSystemAddress]');
                        }
                        break;
                    case API_TRC10:
                        $response = app(API_TRC10, [$this->symbol])->generateAddress();
                        if ($response['error'] === 'ok') {
                            Wallet::create([
                                'user_id' => $admin->id,
                                'symbol' => $this->symbol,
                                'address' => $response['result']['address'],
                                'public_key' => encrypt($response['result']['publicKey']),
                                'private_key' => encrypt($response['result']['privateKey']),
                                'is_system_wallet' => ACTIVE,
                            ]);
                        } else {
                            Logger::error(new Exception($response['error']), '[FAILED][Coin][generateSystemAddress]');
                        }
                        break;
                }
            }
        }
    }

    public function systemWallet(): HasOne
    {
        return $this->hasOne(Wallet::class, 'symbol')->where('is_system_wallet', ACTIVE);
    }

}
