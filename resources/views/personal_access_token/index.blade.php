@extends('layouts.master',['hideBreadcrumb'=>true,'activeSideNav' => active_side_nav(),'topLess' => true])
@section('title', $title)
@section('route', $isRoute =true, $routeName = 'Create Access Token', $route = 'personal-access-tokens.create')
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
                            @component('components.table',['class'=> 'lf-data-table'])
                                @slot('thead')
                                    <tr class="text-white">
                                        <th>{{ __('Created At') }}</th>
                                        <th class="all">{{ __('APP Name') }}</th>
                                        <th>{{ __('Lasted Used') }}</th>
                                        <th class="text-right all no-sort">{{ __('Action') }}</th>
                                    </tr>
                                @endslot

                                @foreach($tokens as $token)
                                    <tr>
                                        <td>{{ optional($token->created_at)->toFormattedDateString() }}</td>
                                        <td>{{ $token->name }}</td>
                                        <td>{{ optional($token->last_used_at)->toFormattedDateString() }}</td>

                                        <td class="lf-action text-right">
                                            <div class="btn-group">
                                                <button type="button"
                                                        class="btn btn-sm btn-info dropdown-toggle"
                                                        data-toggle="dropdown"
                                                        aria-expanded="false">
                                                    <i class="fa fa-gear"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right" role="menu">
                                                    @if(has_permission('personal-access-tokens.destroy'))
                                                        <a data-form-id="update-{{ $token->id }}"
                                                           data-form-method="DELETE"
                                                           href="{{ route('personal-access-tokens.destroy', $token->id) }}"
                                                           class="dropdown-item confirmation"
                                                           data-alert="{{__('Do you really want to delete this personal token?')}}"><i
                                                                    class="fa fa-edit"></i> {{ __('Delete') }}</a>
                                                    @endif
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            @endcomponent
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('style')
    <link rel="stylesheet" href="{{ asset('plugins/datatables/dataTables.bootstrap4.min.css') }}">
@endsection

@section('script')
    <script src="{{ asset('plugins/bs4-datetimepicker/js/bootstrap-datetimepicker.min.js') }}"></script>
    <script src="{{asset('plugins/datatables/datatables.min.js')}}"></script>
    <script src="{{asset('plugins/datatables/dataTables.bootstrap4.min.js')}}"></script>
    <script src="{{asset('plugins/datatables/table-datatables-responsive.min.js')}}"></script>
@endsection
