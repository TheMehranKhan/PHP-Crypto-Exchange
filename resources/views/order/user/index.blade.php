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
                                        <th class="min-desktop">{{ __('Category') }}</th>
                                        <th class="all">{{ __('Price') }}</th>
                                        <th class="all">{{ __('Amount') }}</th>
                                        <th class="min-desktop">{{ __('Total') }}</th>
                                        <th class="min-desktop">{{ __('Stop/Rate') }}</th>
                                        <th class="none">{{ __('Date') }}</th>
                                        <th class="min-desktop">{{ __('Status') }}</th>
                                        <th class="none">{{ __('Reference ID') }}</th>
                                        @if(has_permission('user.order.destroy'))
                                            <th class="all">{{ __('Action') }}</th>
                                        @endif
                                    </tr>
                                @endslot

                                @foreach($dataTable['items'] as $key=>$order)
                                    <tr class="{{ $order->type === ORDER_TYPE_BUY ? 'text-success' : 'text-danger' }}">
                                        <td>{{ $order->trade_pair }}</td>
                                        <td>{{ order_type($order->type) }}</td>
                                        <td>{{ order_categories($order->category) }}</td>
                                        <td>{{ $order->price }} <span class="strong">{{ $order->base_coin }}</span></td>
                                        <td>{{ $order->amount }} <span class="strong">{{ $order->trade_coin }}</span>
                                        </td>
                                        <td>{{ bcmul($order->amount, $order->price) }} <span
                                                    class="strong">{{ $order->base_coin }}</span></td>
                                        <td>
                                            @if(!is_null($order->stop_limit))
                                                {{ $order->stop_limit }}
                                                <span class="strong">{{ $order->base_coin }}</span>
                                            @else
                                                -
                                            @endif
                                        </td>
                                        <td>{{ $order->created_at }}</td>
                                        <td>{{ order_status($order->status) }}</td>
                                        <td>{{ $order->id }}</td>
                                        @if(has_permission('user.order.destroy'))
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
                                                        <a data-form-id="delete-{{ $order->id }}"
                                                           data-form-method="DELETE"
                                                           href="{{ route('user.order.destroy', ['order' => $order->id]) }}"
                                                           class="dropdown-item confirmation"
                                                           data-alert="{{__('Do you want to cancel this order?')}}"><i
                                                                    class="fa fa-trash-o"></i> {{ __('Cancel') }}</a>
                                                    </div>
                                                </div>
                                            </td>
                                        @endif
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
