@extends('layouts.auth_master',['headerLess'=>true, 'activeSideNav' => active_side_nav()])
@section('title', __('Verification'))
@section('content')
    @component('components.auth', ['pageTitle' => __('Get Mobile Verification Code')])
        <form id="mobile-verification-form" action="{{ route('mobile.verification.send') }}" method="post">
            @csrf
            <input type="hidden" name="user_id" value="{{$user->id}}">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fa fa-envelope"></i></div>
                </div>
                <input type="verify_code" class="{{ form_validation($errors, 'verify_code') }}"
                       name="verify_code" placeholder="{{ __('Verify Code') }}" value="{{ old('verify_code') }}">
                <span class="invalid-feedback" data-name="email">{{ $errors->first('verify_code') }}</span>
                <small>{{__('We have sent a verification code to your mobile number, please enter the code below:')}}</small>
            </div>

            @if( env('APP_ENV') != 'local' && settings('display_google_captcha') )
                <div class="input-group mb-3">
                    <div>
                        {{ view_html(NoCaptcha::display()) }}
                    </div>
                    <span class="invalid-feedback">{{ $errors->first('g-recaptcha-response') }}</span>
                </div>
            @endif

            <div class="form-group">
                <button type="submit" class="btn btn-block btn-info font-size-14 font-weight-bold form-submission-button">{{ __('Verify') }}</button>
            </div>
        </form>
        <div class="text-center pt-3">
            <a href="{{ route('login') }}">{{ __('Login') }}</a>
        </div>
        @if(settings('require_mobile_verification'))
            <div class="text-center pt-1">
                <a href="{{ route('forget-password.index') }}">{{ __('Forgot Password?') }}</a>
            </div>
        @endif
    @endcomponent
@endsection

@section('script')
    {{--@if( env('APP_ENV') == 'production' && settings('display_google_captcha') )--}}
    {{ view_html(NoCaptcha::renderJs()) }}
    {{--@endif--}}

    <script>
        "use strict";

        $(document).ready(function () {
            $('#mobile-verification-form').cValidate({
                rules: {
                    'verify_code': 'required|digit|max:255',
                }
            });
        });
    </script>
@endsection
