@extends('layouts.master',['activeSideNav' => active_side_nav()])
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
                            @component('components.table',['class'=> 'lf-data-table','title'=>$title])
                                @slot('route')
                                    @if(isset($isRoute) && has_permission($route))
                                        <a class="btn btn-info {{isset($extraClass)?$extraClass:''}}"
                                           href="{{ route($route) }}">{{ __($routeName) }}</a>
                                    @endif
                                @endslot
                                @slot('thead')
                                    <tr>
                                        <th class="all">{{ __('Date') }}</th>
                                        <th class="min-desktop">{{ __('Address/Bank') }}</th>
                                        <th class="all">{{ __('Amount') }}</th>
                                        <th class="all">{{ __('Status') }}</th>
                                        <th class="none">{{ __('Ref ID') }}</th>
                                        <th class="none">{{ __('Txn Id') }}</th>
                                        <th class="none">{{ __('System Fee') }}</th>
                                        <th class="all text-right no-sort">{{ __('Action') }}</th>
                                    </tr>
                                @endslot

                                @foreach($dataTable['items'] as $deposit)

                                    <tr>
                                        <td>{{ $deposit->created_at }}</td>
                                        @if($deposit->api == API_BANK)
                                            <td>{{ $deposit->bankAccount->bank_name }}</td>
                                        @else
                                            <td>{{ $deposit->address }}</td>
                                        @endif
                                        <td>{{ $deposit->amount }} <span class="strong">{{ $deposit->symbol }}</span>
                                        </td>
                                        <td>
                                    <span class="font-size-12 py-1 px-2 badge badge-{{ config('commonconfig.transaction_status.' . $deposit->status . '.color_class') }}">{{ transaction_status($deposit->status) }}
                                    </span>
                                        </td>
                                        <td>{{ $deposit->id }}</td>
                                        <td>{{ $deposit->txn_id }}</td>
                                        <td>{{ $deposit->system_fee }} {{ $deposit->symbol }}</td>
                                        <td class="lf-action text-right">
                                            <div class="btn-group">
                                                <button type="button"
                                                        class="btn btn-sm btn-info dropdown-toggle"
                                                        data-toggle="dropdown"
                                                        aria-expanded="false">
                                                    <i class="fa fa-gear"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right"
                                                     role="menu">
                                                    @if(has_permission('user.wallets.deposits.show'))
                                                        <a href="{{ route('user.wallets.deposits.show',['wallet' => $deposit->symbol, 'deposit' => $deposit->id ]) }}"
                                                           class="dropdown-item"><i
                                                                    class="fa fa-eye"></i> {{ __('Show') }}
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

@endsection

@section('style')
    @include('layouts.includes.list-css')
@endsection

@section('script')
    @include('layouts.includes.list-js')
@endsection
