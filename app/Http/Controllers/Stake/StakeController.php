<?php

namespace App\Http\Controllers\Stake;

use App\Http\Controllers\Controller;

use App\Models\Coin\Coin;
use App\Models\Coin\CoinStake;
use App\Services\Core\DataTableService;
use Illuminate\Http\Request;
use Illuminate\View\View;

class StakeController extends Controller
{
    public function index(Request $request): View
    {
        $searchFields = [
            ['symbol', __('Coin'),],
            ['name', __('Package Name'), 'coin'],
        ];

        $orderFields = [
            ['symbol', __('Wallet')],
            ['name', __('Wallet Name'), 'coin'],
        ];

        $filterFields = [
            ['primary_balance', __('Balance'), 'preset', null,
                [
                    [__('Hide 0(zero) balance'), '>', 0],
                ]
            ],
        ];

        $queryBuilder = Coin::has('coinStakes')->with(['coinStakes' => function($qs){
            $qs->orderBy('minimum_amount', 'asc');
        }])->orderBy('symbol', 'desc');

        $data['dataTable'] = app(DataTableService::class)
            ->setSearchFields($searchFields)
            ->setOrderFields($orderFields)
            ->setFilterFields($filterFields)
            ->create($queryBuilder);

        $data['title'] = __('Stake');
        return view('stake.user.index', $data);
    }

    public function show(Coin $coin)
    {
        $data['title'] = __('Stake Show');
        $data['coin'] = $coin;
        $data['stake'] = CoinStake::where('symbol', $coin->symbol)->orderBy('minimum_amount', 'asc')->get();
        if (count($data['stake']) == 0) {
            return redirect()->back()
                ->with(RESPONSE_TYPE_ERROR, __("The stake service is currently disabled for this coin. Please try another coin or sometime later."));
        }
        return view('stake.user.show', $data);
    }
}
