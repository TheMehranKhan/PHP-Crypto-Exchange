@extends('layouts.master',['hideBreadcrumb'=>true,'activeSideNav' => active_side_nav(),'topLess' => true])
@section('title', $title)
@section('route', $isRoute =true, $routeName = 'New Ticket', $route = 'tickets.create')
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
                            @component('components.table',['class' => 'lf-data-table'])
                                @slot('thead')
                                    <tr>
                                        <th class="all">{{ __('Ticket ID') }}</th>
                                        <th class="min-phone-l">{{ __('Heading') }}</th>
                                        <th class="none">{{ __('Reference ID') }}</th>
                                        <th class="min-phone-l">{{ __('Date') }}</th>
                                        <th class="all">{{ __('Status') }}</th>
                                        <th class="text-center all no-sort">{{ __('Action') }}</th>
                                    </tr>
                                @endslot
                                @foreach($dataTable['items'] as $ticket)
                                    <tr>
                                        <td>{{ $ticket->id }}</td>
                                        <td>{{ $ticket->title }}</td>
                                        <td>
                                            @if($ticket->ticket_id)
                                                <div class="border-bottom d-flex mb-3 pb-3 align-items-center">
                                                    <a target="_blank"
                                                       href="{{ route('tickets.show', $ticket->ticket_id) }}">{{$ticket->ticket_id}}</a>
                                                </div>
                                            @endif
                                        </td>
                                        <td>{{ $ticket->created_at }}</td>
                                        <td><small
                                                    class="font-size-12 py-1 px-2 badge badge-{{ config('commonconfig.ticket_status.'.$ticket->status.'.color_class') }}">{{ ticket_status($ticket->status) }}</small>
                                        </td>
                                        <td class="lf-action text-light">
                                            <div class="btn-group">
                                                <button class="btn btn-info dropdown-toggle"
                                                        data-toggle="dropdown">
                                                    <i class="fa fa-gear"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    @if( has_permission('tickets.show'))
                                                        <a class="dropdown-item"
                                                           href="{{ route('tickets.show', $ticket->id) }}">
                                                            <i class="fa fa-eye"></i> {{ __('Show') }}
                                                        </a>
                                                    @endif
                                                    @if( has_permission('tickets.close') && in_array($ticket->status, [STATUS_OPEN, STATUS_PROCESSING]))
                                                        <a class="dropdown-item confirmation"
                                                           data-alert="{{ __('Are you sure to close this ticket?') }}"
                                                           data-form-id="up-{{$ticket->id}}" data-form-method="put"
                                                           href="{{ route('tickets.close', $ticket->id) }}">
                                                            <i class="fa fa-power-off"></i> {{ __('Close') }}
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
