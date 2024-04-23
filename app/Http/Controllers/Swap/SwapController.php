<?php

namespace App\Http\Controllers\Swap;

use App\Http\Controllers\Controller;
use App\Http\Requests\Swap\SwapRequest;
use App\Models\Coin\Coin;
use App\Models\Coin\CoinPair;
use App\Models\Deposit\WalletDeposit;
use App\Models\Wallet\Wallet;
use App\Models\Withdrawal\WalletWithdrawal;
use App\Override\Logger;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class SwapController extends Controller
{
    public function index(Request $request): View
    {
        $tickers = $this->getTickers($request);
        $coins = Coin::all();
        $data['tickers'] = $tickers;
        $data['coins'] = $coins;
        $data['title'] = __('Swap');
        return view('swap.show', $data);
    }

    public function create(Request $request, CoinPair $coinPair)
    {
        $baseWallet = Wallet::where('symbol', $coinPair->base_coin)->where('user_id', auth()->user()->id)->first();
        $tradeWallet = Wallet::where('symbol', $coinPair->trade_coin)->where('user_id', auth()->user()->id)->first();

        $data['title'] = __('Markets Exchange') . " " . $request->get('coin_pair');
        $data['coin_pair'] = $coinPair;
        $data['base_wallet'] = $baseWallet;
        $data['trade_wallet'] = $tradeWallet;

        return view('markets.user.create', $data);
    }

    public function store(MarketRequest $request, CoinPair $coinPair)
    {
        $baseWallet = Wallet::where('symbol', $coinPair->base_coin)->where('user_id', auth()->user()->id)->first();
        $tradeWallet = Wallet::where('symbol', $coinPair->trade_coin)->where('user_id', auth()->user()->id)->first();

        if ($request->get('type') == 'buy') {

            $total = $request->get('total');
            $feeAmount = $request->get('amount') * $request->get('fee') / 100;

            if (bccomp($total, $baseWallet->primary_balance) > 0) {
                return redirect()
                    ->back()
                    ->withInput()
                    ->with(RESPONSE_TYPE_ERROR, __("You don't have enough balance to exchange!. Your current balance is :amount", [
                            'amount' => $baseWallet->primary_balance,
                        ])
                    );
            }

            $buyParams = [
                'user_id' => Auth::id(),
                'wallet_id' => $baseWallet->id,
                'symbol' => $baseWallet->symbol,
                'address' => $baseWallet->address,
                'amount' => $total - $feeAmount,
                'system_fee' => $request->get('fee'),
                'api' => 'Exchange',
                'status' => STATUS_COMPLETED,
            ];

            $sellParams = [
                'user_id' => Auth::id(),
                'wallet_id' => $tradeWallet->id,
                'symbol' => $tradeWallet->symbol,
                'address' => $tradeWallet->address,
                'amount' => $request->get('amount'),
                'system_fee' => $request->get('fee'),
                'api' => 'Exchange',
                'status' => STATUS_COMPLETED,
            ];

            DB::beginTransaction();
            try {
                if (!$baseWallet->decrement('primary_balance', $total)) {
                    throw new Exception(__('Failed to update wallet.'));
                }

                $withdrawal = WalletWithdrawal::create($buyParams);

                if (empty($withdrawal)) {
                    throw new Exception(__('Failed to create withdrawal.'));
                }

                if (!$tradeWallet->increment('primary_balance', $request->get('amount'))) {
                    throw new Exception(__('Failed to update wallet.'));
                }

                $deposit = WalletDeposit::create($sellParams);

                if (empty($deposit)) {
                    throw new Exception(__('Failed to create deposit.'));
                }
            } catch (Exception $exception) {
                DB::rollBack();
                Logger::error($exception, "[FAILED][Withdrawal][store]");
                return redirect()
                    ->back()
                    ->withInput()
                    ->with(RESPONSE_TYPE_ERROR, __("Unable to withdraw amount."));
            }

            DB::commit();

        } else {
            $total = $request->get('total');
            $feeAmount = $request->get('amount') * $request->get('fee') / 100;

            if (bccomp($total, $tradeWallet->primary_balance) > 0) {
                return redirect()
                    ->back()
                    ->withInput()
                    ->with(RESPONSE_TYPE_ERROR, __("You don't have enough balance to exchange!. Your current balance is :amount", [
                            'amount' => $tradeWallet->primary_balance,
                        ])
                    );
            }

            $buyParams = [
                'user_id' => Auth::id(),
                'wallet_id' => $tradeWallet->id,
                'symbol' => $tradeWallet->symbol,
                'address' => $tradeWallet->address,
                'amount' => $request->get('amount'),
                'system_fee' => $request->get('fee'),
                'api' => 'Exchange',
                'status' => STATUS_COMPLETED,
            ];

            $sellParams = [
                'user_id' => Auth::id(),
                'wallet_id' => $baseWallet->id,
                'symbol' => $baseWallet->symbol,
                'address' => $baseWallet->address,
                'amount' => $total + $feeAmount,
                'system_fee' => $request->get('fee'),
                'api' => 'Exchange',
                'status' => STATUS_COMPLETED,
            ];

            DB::beginTransaction();
            try {
                if (!$tradeWallet->decrement('primary_balance', $request->get('amount'))) {
                    throw new Exception(__('Failed to update wallet.'));
                }

                $withdrawal = WalletWithdrawal::create($buyParams);

                if (empty($withdrawal)) {
                    throw new Exception(__('Failed to create withdrawal.'));
                }

                if (!$baseWallet->increment('primary_balance', $total + $feeAmount)) {
                    throw new Exception(__('Failed to update wallet.'));
                }

                $deposit = WalletDeposit::create($sellParams);

                if (empty($deposit)) {
                    throw new Exception(__('Failed to create deposit.'));
                }
            } catch (Exception $exception) {
                DB::rollBack();
                Logger::error($exception, "[FAILED][Withdrawal][store]");
                return redirect()
                    ->back()
                    ->withInput()
                    ->with(RESPONSE_TYPE_ERROR, __("Unable to withdraw amount."));
            }

            DB::commit();


        }


        return redirect()
            ->back()
            ->with([
                RESPONSE_TYPE_SUCCESS => __('Your Exchange was successfully done.')
            ]);
    }

    public function destroy($id)
    {
        if (auth()->user()->tokens()->where('id', $id)->delete()) {
            return redirect()
                ->route('personal-access-tokens.index')
                ->with(RESPONSE_TYPE_SUCCESS, __('The personal access token has been deleted successfully.'));
        }

        return redirect()
            ->back()
            ->with(RESPONSE_TYPE_ERROR, __('Failed to delete the personal access token.'));
    }

    private function getTickers(Request $request)
    {
        $coinPairs = CoinPair::select('base_coin', 'trade_coin', 'name', 'last_price')
            ->where('is_active', ACTIVE)
//            ->when($request->get('tradePair'), function ($query) use($request) {
//                $query->where('name', $request->tradePair);
//            })
            ->with('exchangeSummary', 'coin')
            ->orderBy('is_default', 'desc')
            ->get();

        $formattedCoinPair = [];

        foreach ($coinPairs as $coinPair) {
            $formattedCoinPair[$coinPair->name] = [
                'last' => $coinPair->last_price,
                'low24hr' => "0",
                'high24hr' => "0",
                'change' => "0",
                'tradeVolume' => "0",
                'baseVolume' => "0",
            ];

            if ($coinPair->exchangeSummary !== null) {
                $formattedCoinPair[$coinPair->name]['low24hr'] = $coinPair->exchangeSummary->low_price;
                $formattedCoinPair[$coinPair->name]['high24hr'] = $coinPair->exchangeSummary->high_price;
                $formattedCoinPair[$coinPair->name]['tradeVolume'] = $coinPair->exchangeSummary->trade_coin_volume;
                $formattedCoinPair[$coinPair->name]['baseVolume'] = $coinPair->exchangeSummary->base_coin_volume;
                $formattedCoinPair[$coinPair->name]['change'] = bcmul(bcdiv(bcsub($coinPair->last_price, $coinPair->exchangeSummary->first_price), $coinPair->exchangeSummary->first_price), '100', 2);
            }
        }

        $response = $request->has('tradePair') ? $formattedCoinPair[$request->get('tradePair')] : $formattedCoinPair;
        $collect = [];
        foreach ($response as $key => $item) {
            $coin = Coin::where('symbol', explode('_', $key)[0])->first();
            $decimal = 2;
            $tradeCoinArr = explode('_', $key);

            array_push($collect, $item + [
                    'symbol' => $key,
                    'base_coin' => $tradeCoinArr[0],
                    'trade_coin' => $tradeCoinArr[1],
                    'last_price' => number_format($item['last'], $decimal),
                    'change' => floatval($item['change']),
                    'baseVolume' => number_format($item['baseVolume'], $decimal)
                ]);
        }
        return $collect;
    }
}
