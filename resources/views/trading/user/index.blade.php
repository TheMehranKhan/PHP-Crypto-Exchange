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
                                        <th class="all">{{ __('Market') }}</th>
                                        <th class="min-desktop">{{ __('Type') }}</th>
                                        <th class="all">{{ __('Price') }}</th>
                                        <th class="min-desktop">{{ __('Amount') }}</th>
                                        <th class="min-desktop">{{ __('Total') }}</th>
                                        <th class="min-desktop">{{ __('Fee') }}</th>
                                        <th class="min-desktop text-right">{{ __('Date') }}</th>
                                    </tr>
                                @endslot

                                @foreach($dataTable['items'] as $transaction)
                                    <tr>
                                        <td>{{ $transaction->trade_pair }}</td>
                                        <td>{{ order_type($transaction->order_type) }}</td>
                                        <td>{{ $transaction->price }}</td>
                                        <td>{{ $transaction->amount }}</td>
                                        <td>{{ $transaction->total }}</td>
                                        <td>{{ $transaction->fee }}</td>

                                        <td class="text-right">{{ $transaction->created_at->toFormattedDateString() }}</td>
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
