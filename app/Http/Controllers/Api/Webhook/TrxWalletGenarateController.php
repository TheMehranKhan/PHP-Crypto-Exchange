<?php

namespace App\Http\Controllers\Api\Webhook;

use App\Http\Controllers\Controller;
use App\Models\Coin\Coin;
use App\Models\Wallet\Wallet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Str;

class TrxWalletGenarateController extends Controller
{
    public function __invoke()
    {
        Redis::flushDB('tronContracts');
        Redis::flushDB('tronAddresses');
        $contracts = Coin::select('contract_address')->where('type', 'trc20')->get();
        $contractsArr = [];
        foreach ($contracts as $contract) {
            if (empty(Redis::get('tronContracts'))) {
                Redis::set('tronContracts', $contract->contract_address);
            } else {
                $redisList = Redis::get('tronContracts');
                if (!Str::contains($redisList, $contract->contract_address)) {
                    Redis::append('tronContracts', ',' . $contract->contract_address);
                }

            }
        }

        $addresses = Wallet::select('address')->whereNotNull('address')
            ->whereHas('coin', function ($query) {
                $query->where('type', [COIN_TYPE_TRC20, COIN_TYPE_TRC10]);
                $query->orWhere('symbol', 'TRX');
            })
            ->groupBy('address')
            ->get();

        foreach ($addresses as $address) {
            if (empty(Redis::get('tronAddresses'))) {
                Redis::set('tronAddresses', $address->address);
            } else {
                $redisList = Redis::get('tronAddresses');
                if (!Str::contains($redisList, $address->address)) {
                    Redis::append('tronAddresses', ',' . $address->address);
                }

            }
        }

//        $redisdb = Redis::get('tronAddresses');
        return [];
    }

}
