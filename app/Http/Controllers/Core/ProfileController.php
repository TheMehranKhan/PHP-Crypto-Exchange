<?php

namespace App\Http\Controllers\Core;

use App\Http\Controllers\Controller;
use App\Models\Coin\CoinPair;
use App\Models\Core\UserActivity;
use App\Models\Exchange\Exchange;
use App\Models\Wallet\Wallet;
use App\Services\Core\UserActivityService;
use Illuminate\Http\JsonResponse;
use App\Http\Requests\Core\{PasswordUpdateRequest, UserAvatarRequest, UserRequest};
use App\Services\Core\ProfileService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use GuzzleHttp\Client;
use Illuminate\View\View;

class ProfileController extends Controller
{
    private $service;
    private $client;

    public function __construct(ProfileService $service)
    {
        $this->service = $service;
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

    public function index(): View
    {
        $data = $this->service->profile();
        $userLastLogin = UserActivity::where('user_id',$data['user']->id)->orderBy('created_at','desc')->first();
        $data['userLastLogin'] = $userLastLogin;
        $data['tradeHistories'] = Exchange::where('is_maker' ,ACTIVE)->where('user_id', Auth::id())->orderBy('created_at', 'desc')->take(10)->get();
        $data['title'] = __('Profile');
        $data['balance'] = 0;
        if (settings('enable_thirdparty_exchange') == ACTIVE) {
            $forusdvaluetotal = Wallet::where('user_id', $data['user']->id)->whereNotIn('symbol', ['DAI', 'VEN'])->where('is_system_wallet', 0)->get();
            $lastIRT = CoinPair::where('name', 'USDT_IRT')->first();
            foreach ($forusdvaluetotal as $coins) {
                $symbol = strtok($coins->symbol, '.');
                switch ($symbol) {
                    case "IRT":
                        $price = $coins->primary_balance / (float)$lastIRT->last_price;
                        $data['balance'] += $price;
                        break;
                    case "USDT":
                        $data['balance'] += $coins->primary_balance;
                        break;
                    default:
                        $getTicker = $this->api->fetchTicker("$symbol/USDT");
                        $getprice = !empty($getTicker["last"]) ? $getTicker["last"] : 0;
                        $valueinusd = $coins->primary_balance * $getprice;
                        $data['balance'] += $valueinusd;
                }
            }
            $data['irt_balance'] = (float)$data['balance'] * (float)$lastIRT->last_price;
        }
        return view('core.profile.index', $data);
    }

    public function edit(): View
    {
        $data = $this->service->profile();
        $data['title'] = __('Edit Profile');

        return view('core.profile.edit', $data);
    }

    public function update(UserRequest $request): RedirectResponse
    {
        $parameters = $request->only(['first_name', 'last_name', 'address']);
        if (Auth::user()->profile()->update($parameters)) {
            app(UserActivityService::class)->store(Auth::id(), 'update profile');
            return redirect()->route('profile.edit')->with(RESPONSE_TYPE_SUCCESS, __('Profile has been updated successfully.'));
        }

        return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('Failed to update profile.'));
    }

    public function changePassword(): View
    {
        $data = $this->service->profile();
        $data['title'] = __('Change Password');

        return view('core.profile.change_password', $data);
    }

    public function updatePassword(PasswordUpdateRequest $request): RedirectResponse
    {
        $response = $this->service->updatePassword($request);

        if ($response[RESPONSE_STATUS_KEY]) {
            if (app(UserActivityService::class)->store(Auth::id(), 'update password')){
                Auth::logout();
                return redirect()->route('login')->with(RESPONSE_TYPE_SUCCESS, $response[RESPONSE_MESSAGE_KEY]);
            }
        }
        return redirect()->back()->with(RESPONSE_TYPE_ERROR, $response[RESPONSE_MESSAGE_KEY]);
    }

    public function avatarUpdate(UserAvatarRequest $request): JsonResponse
    {
        $response = $this->service->avatarUpload($request);

        return response()->json($response);
    }
}
