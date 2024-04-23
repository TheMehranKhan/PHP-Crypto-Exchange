<?php

namespace App\Http\Controllers\Api\Webhook;

use App\Http\Controllers\Controller;
use App\Jobs\Webhook\ValidateTrxIpnJob;
use App\Models\Deposit\WalletDeposit;
use Illuminate\Http\Request;

class TrxIpnController extends Controller
{
    public function __invoke(Request $request, $currency)
    {
        if ($request->has('txn_id') && $request->get('txn_id')) {
            $validateTXN = WalletDeposit::where('txn_id',$request->get('txn_id'))->first();
            if (empty($validateTXN)){
                $ipnData = $request->only('txn_id','address','contract');
                ValidateTrxIpnJob::dispatch($currency, $ipnData);
            }
        }

        return [];
    }
}
