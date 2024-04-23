@extends('layouts.master',['hideBreadcrumb'=>true,'activeSideNav' => active_side_nav(),'topLess' => true])
@section('title', $title)
@section('content')
    @include('layouts.dashboard.title')
    @component('components.profile', ['user' => $user])
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{__($title)}}</h4>
                </div>
                <div class="card-body">
                    <table class="table table-borderless font-size-14 col-xl-4">
                        <tbody>
                        <tr>
                            <td>{{ __('Display Language') }}</td>
                            <td>
                                <strong class="pr-3">:</strong>
                                {{ $preference->display_language ? $preference->language->short_code : get_default_language()}}
                            </td>
                        </tr>
                        <tr>
                            <td>{{ __('Default Exchange') }}</td>
                            <td>
                                <strong class="pr-3">:</strong>
                                {{ $preference->default_coin_pair ? $preference->exchange->name : get_default_exchange() }}
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="form-group my-4">
                        <a href="{{ route('preference.edit') }}"
                           class="btn lf-card-btn btn-info btn-sm-block">{{ __('Change Preference') }}</a>
                    </div>
                </div>
            </div>
        </div>
    @endcomponent

@endsection
@section('style')
    @include('layouts.includes._avatar_and_loader_style')
@endsection
