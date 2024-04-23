@extends('layouts.master', ['hideBreadcrumb' => true, 'cmbPage' => '','activeSideNav'=>active_side_nav()])
@section('title', $title)
@section('content')
    @section('title', __('Stake'))
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

                            @component('components.table',['class'=> 'lf-data-table'])
                                @slot('thead')
                                    <tr>
                                        <th class="all text-center">{{__('Coin')}}</th>
                                        <th class="all text-center">{{__('Min Amount')}}</th>
                                        <th class="all text-center">{{__('Max Amount')}}</th>
                                        <th class="all text-center">{{__('Status')}}</th>
                                        <th class="all text-center">{{__('Actions')}}</th>
                                    </tr>
                                @endslot
                                @foreach($dataTable['items'] as $key=>$coin)
                                    <tr>
                                        <td>
                                            <img src="{{ get_coin_icon($coin->icon) }}" alt="Item Emoji"
                                                 class="img-table cm-center mr-2">
                                            {{ $coin->symbol }}
                                        </td>
                                        <td>{{ $coin->name }}</td>
                                        <td>{{ count($coin->coinStakes) > 0 ? $coin->coinStakes[0]->minimum_amount : 0}}</td>
                                        <td class="text-center">{!! count($coin->coinStakes) > 0 ? '<span class="font-size-12 py-1 px-2 badge badge-success">'.__('Active').'</span>' : '<span class="font-size-12 py-1 px-2 badge badge-danger">'.__('Inactive').'</span>' !!}</td>
                                        <td class="text-center">
                                            <a class="font-size-12 py-1 px-2 badge badge-warning"
                                               href="{{ route('stake.show',$coin->symbol) }}">{{__('Details')}}
                                            </a>
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
    @include('stake.user._style')
@endsection

@section('script')
    @include('layouts.includes.list-js')
@endsection