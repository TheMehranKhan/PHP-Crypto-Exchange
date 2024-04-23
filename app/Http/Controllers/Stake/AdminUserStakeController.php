<?php

namespace App\Http\Controllers\Stake;

use App\Http\Controllers\Controller;
use App\Models\Core\User;
use App\Models\Wallet\Wallet;
use App\Services\Core\DataTableService;
use Illuminate\View\View;

class AdminUserStakeController extends Controller
{
    public function index(User $user, Wallet $wallet): View
    {
        $data['userId'] = $user;

        $searchFields = [
            ['id', __('Reference ID')],
            ['amount', __('Amount')],
            ['staking_months', __('Staking Months')],
            ['earning', __('Earning')],
            ['symbol', __('Symbol')],
        ];

        $orderFields = [
            ['created_at', __('Date')],
            ['symbol', __('Wallet')]
        ];

        $filterFields = [
            ['status', __('Status'), transaction_status()],
        ];

        $queryBuilder = $wallet->stakes()
            ->orderBy('created_at', 'desc');

        $data['dataTable'] = app(DataTableService::class)
            ->setSearchFields($searchFields)
            ->setOrderFields($orderFields)
            ->setFilterFields($filterFields)
            ->create($queryBuilder);

        $data['title'] = __('Stake History: :user', ['user' => $user->profile->full_name]);
        return view('stake.user.user_stake_history', $data);
    }
}
