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
                                        <th class="all">{{ __('Note') }}</th>
                                        <th class="all">{{ __('Ip Address') }}</th>
                                        <th class="min-desktop">{{ __('Device') }}</th>
                                        <th class="min-desktop">{{ __('Location') }}</th>
                                        <th class="min-desktop">{{ __('Browser') }}</th>
                                        <th class="none">{{ __('Operating System') }}</th>
                                        <th class="min-desktop">{{ __('Date') }}</th>
                                    </tr>
                                @endslot
                                @foreach($dataTable['items'] as $key=>$activity)
                                    <tr>
                                        <td>{{ $activity->note }}</td>
                                        <td>{{ $activity->ip_address }}</td>
                                        <td>{{ $activity->device }}</td>
                                        <td>{{ $activity->location }}</td>
                                        <td>{{ $activity->browser }}</td>
                                        <td>{{ $activity->operating_system }}</td>
                                        <td>{{ $activity->created_at->diffForHumans() }}</td>
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
