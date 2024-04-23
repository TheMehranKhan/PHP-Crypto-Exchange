@extends('layouts.master',['hideBreadcrumb'=>true,'activeSideNav' => active_side_nav(),'topLess' => true])
@section('title', __('Google Two Factor Authentication'))
@section('content')
    @include('layouts.dashboard.title')
    @component('components.card', ['pageTitle' => __('Google 2 Factor Authentication')])
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{__('Google 2 Factor Authentication')}}</h4>
                </div>
                <div class="card-body">
                    <div class="col-6 mx-auto">
                        <div class="card h-100 border-primary justify-content-center">
                            <form id="google2fa" action="{{ route('profile.google-2fa.verify') }}" method="post">
                                {{ csrf_field() }}
                                <div class="form-group has-feedback {{ $errors->has('google_app_code') ? 'has-error' : '' }}">
                                    <div>
                                        {{ Form::text('google_app_code', null, ['class'=>'form-control text-center', 'placeholder' => __('Enter G2FA app code'), 'data-cval-name' => 'One time password','data-cval-rules' => 'required|integer']) }}
                                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                    </div>
                                    <span class="invalid-feedback">{{ $errors->first('google_app_code') }}</span>
                                </div>
                                <div class="row">
                                    <!-- /.col -->
                                    <div class="col-md-12">
                                        {{ Form::submit(__('Verify Google 2FA Code'), ['class'=>'btn btn-info btn-flat btn-block form-submission-button']) }}
                                    </div>
                                    <!-- /.col -->
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="text-center mt-4">
                        <a href="{{ route('logout') }}">{{ __('Logout From Account') }}</a>
                    </div>
                </div>
            </div>
        </div>
    @endcomponent
@endsection

@section('after-style')
    @include('layouts.includes._avatar_and_loader_style')
    <style>
        .cm-center {
            float: none;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
@endsection

@section('script')
    @if(language(App()->getLocale())['direction']==PAGE_DIRECTION_RIGHT_TO_LEFT)
        <script src="{{ asset('plugins/cvalidator/cvalidator-language-fa.js') }}"></script>
    @else
        <script src="{{ asset('plugins/cvalidator/cvalidator-language-en.js') }}"></script>
    @endif
    <script src="{{ asset('plugins/cvalidator/cvalidator.js') }}"></script>
    <script>
        "use strict";

        $(document).ready(function () {
            $('#google2fa').cValidate({
                rules: {
                    'google_app_code': 'required|integer',
                },
                messages: {}
            });
        });
    </script>
@endsection
