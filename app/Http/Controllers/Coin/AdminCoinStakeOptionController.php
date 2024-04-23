<?php

namespace App\Http\Controllers\Coin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Coin\CoinStakeRequest;
use App\Models\Coin\Coin;
use App\Models\Coin\CoinStake;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Request;

class AdminCoinStakeOptionController extends Controller
{
    protected $service;

    public function edit(Coin $coin): View
    {
        $data['title'] = __('Edit Stake Info');
        $data['coin'] = $coin;
        return view('coins.admin.stake_form', $data);
    }

    public function update(CoinStakeRequest $request, Coin $coin): RedirectResponse
    {
        $attributes = [
            'name' => $request->get('name'),
            'symbol' => $coin->symbol,
            'minimum_amount' => $request->get('minimum_amount') ?: 0,
            'stake_fee_type' => $request->get('stake_fee_type'),
            'stake_fee' => $request->get('stake_fee') ?: 0,
            'stake_month' => $request->get('stake_month'),
            'stake_earning_type' => $request->get('stake_earning_type'),
            'stake_earning' => $request->get('stake_earning'),
            'is_active' => $request->get('is_active'),
        ];

        if (CoinStake::create($attributes)) {
            return redirect()->back()->with(RESPONSE_TYPE_SUCCESS, __('The stake package has been created successfully.'));
        }
        return redirect()->back()->withInput()->with(RESPONSE_TYPE_ERROR, __('Failed to add stake package.'));
    }

    public function destroy(): RedirectResponse
    {
        $coinStake = CoinStake::find(Request::segment(4));
        if ($coinStake->delete()) {
            return redirect()->back()->with(RESPONSE_TYPE_SUCCESS, __("The stake package has been deleted successfully."));
        }
        return redirect()->back()->with(RESPONSE_TYPE_ERROR, __("Failed to delete the stake package."));
    }
}
