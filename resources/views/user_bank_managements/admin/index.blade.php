@extends('layouts.master',['activeSideNav' => active_side_nav()])
@section('title', $title)
@section('route', $isRoute =true, $routeName = 'Add User Bank', $route = 'user-banks.create')
@section('content')
    <div class="container my-5">
        <div class="row">
            <div class="col-lg-12">
                {{ $dataTable['filters'] }}
                {{ $dataTable['advanceFilters'] }}
                <div class="my-4">
                    @component('components.table',['class'=> 'lf-data-table'])
                        @slot('thead')
                            <tr>
                                <th class="all">{{ __('User Name') }}</th>
                                <th class="all">{{ __('Bank Name') }}</th>
                                <th>{{ __('IBAN') }}</th>
                                <th>{{ __('Account Holder') }}</th>
                                <th class="text-center">{{ __('Active Status') }}</th>
                                <th class="text-center">{{ __('Verify Status') }}</th>
                                <th class="min-desktop-l">{{ __('Created Date') }}</th>
                                <th class="text-right all no-sort">{{ __('Action') }}</th>
                            </tr>
                        @endslot

                        @foreach($dataTable['items'] as $key=>$bankAccount)
                            <tr>
                                <td>{{ get_username_by_user_id($bankAccount->user_id) }}</td>
                                <td>{{ $bankAccount->bank_name }}</td>
                                <td>{{ $bankAccount->iban }}</td>
                                <td>{{ $bankAccount->account_holder }}</td>
                                <td class="text-center">
                                    <span class="font-size-12 py-1 px-2 badge badge-{{ config('commonconfig.active_status.' . $bankAccount->is_active . '.color_class') }}">{{ active_status($bankAccount->is_active) }}
                                    </span>
                                </td>
                                <td class="text-center">
                                    <span class="font-size-12 py-1 px-2 badge badge-{{ config('commonconfig.active_status.' . $bankAccount->is_verified . '.color_class') }}">{{ active_status($bankAccount->is_verified) }}
                                    </span>
                                </td>
                                <td>{{ $bankAccount->created_at->toFormattedDateString() }}</td>
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
                                            @if(has_permission('system-banks.toggle-status'))
                                                <a data-form-id="update-{{ $bankAccount->id }}"
                                                   data-form-method="PUT"
                                                   href="{{ route('user-banks.toggle-status', $bankAccount->id) }}"
                                                   class="dropdown-item confirmation"
                                                   data-alert="{{__('Do you want to change this bank\'s status?')}}"><i
                                                            class="fa fa-toggle-{{ $bankAccount->is_active ? 'on' : 'off' }}"></i> {{ __('Change Status') }}</a>
                                            @endif

                                            @if(has_permission('user-banks.edit'))
                                                <a href="{{ route('user-banks.edit', $bankAccount->id) }}" class="dropdown-item">
                                                    <i class="fa fa-edit"></i> {{ __('Edit') }}
                                                </a>
                                            @endif

                                            @if(has_permission('user-banks.destroy'))
                                                <a data-form-id="delete-{{ $bankAccount->id }}"
                                                   data-form-method="DELETE"
                                                   href="{{ route('user-banks.destroy', $bankAccount->id) }}"
                                                   class="dropdown-item confirmation"
                                                   data-alert="{{__('Do you want to delete this system bank?')}}"><i
                                                            class="fa fa-trash-o"></i> {{ __('Delete') }}</a>
                                            @endif
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    @endcomponent
                </div>
                {{ $dataTable['pagination'] }}
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
