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
                                        <th class="all">{{ __('Icon') }}</th>
                                        <th class="all text-center">{{ __('Wallet') }}</th>
                                        <th class="min-desktop text-center">{{ __('Last Earning At') }}</th>
                                        <th class="all text-right">{{ __('Amount') }}</th>
                                    </tr>
                                @endslot

                                @foreach($dataTable['items'] as $referralEarning)
                                    <tr>
                                        <td>
                                            <img class="img-sm img-table"
                                                 src="{{ get_coin_icon($referralEarning->coin->icon) }}"
                                                 alt="Coin Icon">
                                        </td>
                                        <td class="text-center">{{ $referralEarning->symbol }}</td>
                                        <td class="text-center">{{ $referralEarning->last_earning_at }}</td>
                                        <td class="text-right">{{ $referralEarning->amount }} {{ $referralEarning->symbol }}</td>
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
