<?php

namespace App\Http\Controllers\Api\Wallet;

use App\Http\Controllers\Controller;
use App\Models\Coin\CoinPair;
use App\Models\Wallet\Wallet;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use GuzzleHttp\Client;

class UserWalletController extends Controller
{
    public function __construct()
    {
        $this->client = new Client();

        if (settings('enable_thirdparty_exchange') == ACTIVE) {
            $this->provider = settings('thirdparty_provider');
            $exchange_class = "\\ccxt\\$this->provider";
            if ($this->provider == 'kucoin') {
                $this->api = new $exchange_class(array(
                    'apiKey' => settings('thirdparty_api_key'),
                    'secret' => settings('thirdparty_secrete_key'),
                    'password' => settings('thirdparty_passphrase'),
                    'options' => array(
                        'versions' => array(
                            'public' => array(
                                'GET' => array(
                                    'currencies/{currency}' => 'v2',
                                ),
                            ),
                        ),
                    ),
                    //'verbose'=> true
                ));
            } else if ($this->provider == 'binance') {
                $this->api = new $exchange_class(array(
                    'apiKey' => settings('thirdparty_api_key'),
                    'secret' => settings('thirdparty_secrete_key'),
                    'password' => settings('thirdparty_passphrase'),
                    'options' => array(
                        'adjustForTimeDifference' => true,
                        'recvWindow' => 30000,
                    ),
                ));
            } else {
                $this->api = new $exchange_class(array(
                    'apiKey' => settings('thirdparty_api_key'),
                    'secret' => settings('thirdparty_secrete_key'),
                    'password' => settings('thirdparty_passphrase'),
                ));
            }
        }
    }
    public function __invoke()
    {
        $wallets =  Wallet::with('coin:symbol,name,icon,api')
            ->withOnOrderBalance()
            ->where('user_id', Auth::id())
            ->withoutSystemWallet()
            ->orderBy('primary_balance', 'desc')
            ->paginate();

        $balance = 0;

        $forusdvaluetotal = Wallet::where('user_id', Auth::id())->whereNotIn('symbol',['DAI','VEN'])->where('is_system_wallet',0)->get();
        $lastIRT = CoinPair::where('name','USDT_IRT')->first();
        foreach($forusdvaluetotal as $coins){
            $symbol = strtok($coins->symbol, '.');
            switch ($symbol) {
                case "IRT":
                    $price = $coins->primary_balance / (float)$lastIRT->last_price;
                    $balance += $price;
                    break;
                case "USDT":
                    $balance += $coins->primary_balance;
                    break;
                default:
                    if (settings('enable_thirdparty_exchange') == ACTIVE) {
                        $getTicker = $this->api->fetchTicker("$symbol/USDT");
                        $getprice = !empty($getTicker["last"]) ? $getTicker["last"] : 0;
                        $valueinusd = $coins->primary_balance * $getprice;
                        $balance += $valueinusd;
                    } else {
                        $pair = $symbol.'_USDT';
                        $lastPrice = CoinPair::where('name',$pair)->first();
                        $getprice = !empty($lastPrice->last_price) ? $lastPrice->last_price : 0;
                        $valueinusd = $coins->primary_balance * $getprice;
                        $balance += $valueinusd;
                    }
            }
        }
        $irt_balance = (float)$balance * (float)$lastIRT->last_price;

        return response()->json([
            RESPONSE_STATUS_KEY => true,
            RESPONSE_DATA => $wallets,
            "balance" => $balance,
            "irt_balance" => $irt_balance
        ]);
    }

    public function getWallet($symbol)
    {
        $wallets =  Wallet::with('coin:symbol,name,icon,api')
            ->withOnOrderBalance()
            ->where('user_id', Auth::id())
            ->withoutSystemWallet()
            ->whereSymbol($symbol)
            ->first();

        return response()->json([
            RESPONSE_STATUS_KEY => true,
            RESPONSE_DATA => $wallets
        ]);
    }

}
