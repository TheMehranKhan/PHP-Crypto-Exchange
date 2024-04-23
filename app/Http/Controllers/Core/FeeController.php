<?php

namespace App\Http\Controllers\Core;

use App\Http\Controllers\Controller;
use App\Services\Core\DataTableService;
use App\Models\Coin\Coin;


class FeeController extends Controller
{
    public function index()
    {
        $searchFields = [
            ['name', __('Coin Name')],
            ['symbol', __('Symbol')],
            ['minimum_withdrawal_amount', __('Minimum Withdrawal')],
            ['withdrawal_fee', __('Withdrawal Fee')],
            ['daily_withdrawal_limit', __('Daily Withdrawal Limit')],

        ];
        $orderFields = [
            ['first_name', __('First Name'), 'profile'],
            ['last_name', __('Last Name'), 'profile'],
            ['email', __('Email')],
            ['username', __('Username')],
            ['slug', __('Role'), 'role'],
            ['created_at', __('Registered Date')],
        ];

        $filterFields = [
            ['status', __('Status'), active_status()]
        ];

        $queryBuilder = Coin::orderBy('created_at', 'desc');

        $downloadableHeadings = [
            ['id', __('ID')],
            ['name', __('Name')],
            ['symbol', __('Symbol')],
            ['minimum_withdrawal_amount', __('Minimum Withdrawal')],
            ['withdrawal_fee', __('Withdrawal Fee')],
            ['daily_withdrawal_limit', __('Daily Withdrawal Limit')],
            ['status', __('Status')]
        ];

        $data['dataTable'] = app(DataTableService::class)
            ->setSearchFields($searchFields)
            ->setOrderFields($orderFields)
            ->setFilterFields($filterFields)
            ->downloadable($downloadableHeadings)
            ->create($queryBuilder);

        $data['title'] = __('Fees');
        return view('core.fee.index', $data);
    }
}
