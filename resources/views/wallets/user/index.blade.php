@extends('layouts.master',['hideBreadcrumb'=>true,'activeSideNav' => active_side_nav(),'topLess' => true])
@section('title', $title)
@section('content')
    @include('layouts.dashboard.title')
    <div class="content-body">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">{{$title}}</h4>
                            @if(isset($isRoute) && has_permission($route))
                                <a class="btn btn-info {{isset($extraClass)?$extraClass:''}}"
                                   href="{{ route($route) }}">{{ __($routeName) }}</a>
                            @endif
                        </div>
                        <div class="card-body">
                            {{ $dataTable['filters'] }}
                            {{ $dataTable['advanceFilters'] }}

                            @component('components.table',['class'=> 'lf-data-table'])
                                @slot('thead')
                                    <tr>
                                        <th class="all">{{ __('Wallet') }}</th>
                                        <th>{{ __('Wallet Name') }}</th>
                                        <th class="all">{{ __('Total Balance') }}</th>
                                        <th>{{ __('On Order') }}</th>
                                        <th>{{ __('On Stake') }}</th>
                                        <th class="text-right all no-sort">{{ __('Action') }}</th>
                                    </tr>
                                @endslot
                                @foreach($dataTable['items'] as $key=>$wallet)
                                    <tr>
                                        <td>
                                            <img src="{{ get_coin_icon($wallet->coin->icon) }}" alt="Item Emoji"
                                                 class="img-table cm-center mr-2">
                                            {{ $wallet->symbol }}
                                        </td>
                                        <td>{{ $wallet->coin->name }}</td>
                                        <td>{{ $wallet->primary_balance }}</td>
                                        <td>{{ $wallet->on_order_balance ?? bcmul(0,1)  }}</td>
                                        <td>{{ $wallet->on_stake_balance ?? bcmul(0,1)  }}</td>
                                        <td class="lf-action text-right">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-info dropdown-toggle"
                                                        data-toggle="dropdown" aria-expanded="false">
                                                    <i class="fa fa-gear"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right" role="menu">
                                                    @if( has_permission('user.wallets.deposits.create'))
                                                        <a class="dropdown-item"
                                                           href="{{ route('user.wallets.deposits.create',$wallet->symbol) }}"><i
                                                                    class="fa fa-plus text-success mr-2"></i>{{ __('Deposit') }}
                                                        </a>
                                                    @endif

                                                    @if( has_permission('user.wallets.deposits.index'))
                                                        <a class="dropdown-item"
                                                           href="{{ route('user.wallets.deposits.index', $wallet->symbol) }}"><i
                                                                    class="fa fa-list-ul mr-2"></i>{{ __('Deposit History') }}
                                                        </a>
                                                    @endif

                                                    @if( has_permission('user.wallets.withdrawals.create'))
                                                        <a class="dropdown-item"
                                                           href="{{ route('user.wallets.withdrawals.create', $wallet->symbol) }}"><i
                                                                    class="fa fa-minus text-danger mr-2"></i>{{ __('Withdraw') }}
                                                        </a>
                                                    @endif

                                                    @if( has_permission('user.wallets.withdrawals.index'))
                                                        <a class="dropdown-item"
                                                           href="{{ route('user.wallets.withdrawals.index', $wallet->symbol) }}"><i
                                                                    class="fa fa-list-ul mr-2"></i>{{ __('Withdrawal History') }}
                                                        </a>
                                                    @endif
                                                    @if( has_permission('user.wallets.stakes.create'))
                                                        <a class="dropdown-item"
                                                           href="{{ route('stake.show', $wallet->symbol) }}"><i
                                                                    class="fa fa-dollar text-success mr-2"></i>{{ __('Stake') }}
                                                        </a>
                                                    @endif

                                                    @if( has_permission('user.wallets.stakes.index'))
                                                        <a class="dropdown-item"
                                                           href="{{ route('user.wallets.stakes.index', $wallet->symbol) }}"><i
                                                                    class="fa fa-list-ul mr-2"></i>{{ __('Stake History') }}
                                                        </a>
                                                    @endif
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            @endcomponent
                            {{ $dataTable['pagination'] }}
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection

@section('style')
    @include('layouts.includes.list-css')
@endsection

@section('script')
    @include('layouts.includes.list-js')
@endsection
