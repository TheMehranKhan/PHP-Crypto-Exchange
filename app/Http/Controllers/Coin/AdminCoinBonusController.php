<?php

namespace App\Http\Controllers\Coin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Coin\CoinBonusRequest;
use App\Models\Coin\Coin;
use App\Models\Coin\CoinBonus;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Request;

class AdminCoinBonusController extends Controller
{
    protected $service;

    public function edit(Coin $coin): View
    {
        $data['title'] = __('Edit Bonus Info');
        $data['coin'] = $coin;
        $coins = Coin::where('is_active', ACTIVE)->get()->pluck('symbol','symbol')->toArray();
        $data['coins'] = $coins;
        return view('coins.admin.bonus_form', $data);
    }

    public function update(CoinBonusRequest $request, Coin $coin): RedirectResponse
    {
        $attributes = [
            'name' => $request->get('name'),
            'symbol' => $coin->symbol,
            'minimum_amount' => $request->get('minimum_amount') ?: 0,
            'maximum_amount' => $request->get('maximum_amount') ?: 0,
            'bonus_usage_count' => $request->get('bonus_usage_count'),
            'bonus_earning_type' => $request->get('bonus_earning_type'),
            'bonus_earning' => $request->get('bonus_earning'),
            'coin_earning' => $request->get('coin_earning'),
            'is_active' => $request->get('is_active'),
        ];

        if (CoinBonus::create($attributes)) {
            return redirect()->back()->with(RESPONSE_TYPE_SUCCESS, __('The bonus package has been created successfully.'));
        }
        return redirect()->back()->withInput()->with(RESPONSE_TYPE_ERROR, __('Failed to add bonus package.'));
    }

    public function destroy(): RedirectResponse
    {
        $coinBonus = CoinBonus::find(Request::segment(4));
        if ($coinBonus->update(['is_active' => 0])) {
            return redirect()->back()->with(RESPONSE_TYPE_SUCCESS, __("The bonus package has been deleted successfully."));
        }
        return redirect()->back()->with(RESPONSE_TYPE_ERROR, __("Failed to delete the bonus package."));
    }
}
