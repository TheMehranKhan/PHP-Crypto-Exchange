@extends('layouts.master',['hideBreadcrumb'=>true,'activeSideNav' => active_side_nav(),'topLess' => true])
@section('title', $title)
@section('content')
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
                            <nav aria-label="breadcrumb">
                                <ol class="text-right breadcrumbs list-unstyle mb-0">
                                    <li class="breadcrumb-item"><a class="text-info" href="{{ route('home') }}"><i
                                                    class="fa fa-home"></i> {{ __('Home') }}</a></li>
                                    @foreach(get_breadcrumbs() as $breadcrumb)
                                        @if($loop->last || empty($breadcrumb['display_url']))
                                            <li class="breadcrumb-item active"
                                                aria-current="page">{{ $breadcrumb['name'] }}</li>
                                        @else
                                            <li class="breadcrumb-item"><a class="text-info"
                                                                           href="{{ $breadcrumb['url'] }}">{{ $breadcrumb['name'] }}</a>
                                            </li>
                                        @endif
                                    @endforeach
                                </ol>
                            </nav>
                        </div>
                        <div class="card-body">
                            {{ $dataTable['filters'] }}
                            {{ $dataTable['advanceFilters'] }}
                            @component('components.table',['class'=> 'lf-data-table'])
                                @slot('thead')
                                    <tr>
                                        <th class="min-phone-l">{{ __('Name') }}</th>
                                        <th class="min-phone-l">{{ __('Symbol') }}</th>
                                        <th class="min-phone-l">{{ __('Minimum Withdrawal') }}</th>
                                        <th class="min-phone-l">{{ __('Withdrawal Fee') }}</th>
                                        <th class="min-phone-l">{{ __('Daily Withdrawal Limit') }}</th>
                                        <th class="text-center min-phone-l">{{ __('Status') }}</th>
                                    </tr>
                                @endslot

                                @foreach($dataTable['items'] as $key=>$fee)
                                    <tr>
                                        <td><img src="{{ get_coin_icon($fee->icon) }}" alt="Item Emoji"
                                                 class="img-table cm-center mr-2"> {{ $fee->name }}</a></td>
                                        <td>{{ $fee->symbol }}</td>
                                        <td>{{ $fee->minimum_withdrawal_amount }}</td>
                                        <td>{{ $fee->withdrawal_fee}}</td>
                                        <td>{{ $fee->daily_withdrawal_limit }}</td>
                                        <td class="text-center">
                                    <span class="font-size-12 py-1 px-2 badge badge-{{ config('commonconfig.active_status.' . $fee->is_active . '.color_class') }}">{{ active_status($fee->is_active) }}
                                    </span>
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
