@extends('layouts.auth_master',['headerLess'=>true, 'activeSideNav' => active_side_nav()])
@section('title', __('Login'))
{{--@section('content')--}}
@component('components.auth', ['pageTitle' => __('Login Your Account')])

    <form id="login-form" action="{{ route('login.post') }}" method="post">
        @csrf
        <p>{{__('Please login to your account')}}</p>

        <div class="form-outline mb-4">
            <div class="input-group">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fa fa-user"></i></div>
                </div>
                <input type="text" name="username"
                       placeholder="{{__('Username')}}" value="{{ old('username') }}" class="form-control"/>
            </div>
            <span class="invalid-feedback" data-name="username">{{ $errors->first('username') }}</span>
        </div>

        <div class="form-outline mb-4">
            <div class="input-group">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fa fa-lock"></i></div>
                </div>
                <input type="password" name="password"
                       placeholder="{{__('Password')}}" id="Password" class="form-control"/>
            </div>
            <span class="invalid-feedback" data-name="password">{{ $errors->first('password') }}</span>

        </div>
        @if( env('APP_ENV') != 'local' && settings('display_google_captcha') )
            <div class="form-outline mb-4">
                <div>
                    {{ view_html(NoCaptcha::display()) }}
                </div>
                <span class="invalid-feedback">{{ $errors->first('g-recaptcha-response') }}</span>
            </div>
        @endif

        <div class="checkbox mb-md-3 mb-2">
            <div class="lf-checkbox">
                <input id="rememberMe" type="checkbox" name="remember_me">
                <label for="rememberMe">{{ __('Remember Me') }}</label>
            </div>
        </div>

        <div class="text-center pt-1 mb-5 pb-1">
            <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3 form-submission-button"
                    type="submit">{{ __('Login') }}
            </button>
            <a class="text-muted" href="{{ route('forget-password.index') }}">{{ __('Forgot Password?') }}</a>
        </div>

        <div class="d-flex align-items-center justify-content-center pb-4">
            <p class="mb-0 me-2 mx-2">{{__("Don't have an account?")}}</p>
            <a href="{{ route('register.index') }}" class="btn btn-outline-primary">{{ __('Register') }}</a>
        </div>

    </form>
@endcomponent
{{--@endsection--}}

@section('script')
    @if( env('APP_ENV') == 'production' && settings('display_google_captcha') )
        {{ view_html(NoCaptcha::renderJs()) }}
    @endif

    @if(language(App()->getLocale())['direction']==PAGE_DIRECTION_RIGHT_TO_LEFT)
        <script src="{{ asset('plugins/cvalidator/cvalidator-language-fa.js') }}"></script>
    @else
        <script src="{{ asset('plugins/cvalidator/cvalidator-language-en.js') }}"></script>
    @endif
    <script src="{{ asset('plugins/cvalidator/cvalidator.js') }}"></script>
    <script>
        "use strict";

        $(document).ready(function () {
            $('#login-form').cValidate({
                rules: {
                    'username': 'required|max:255',
                    'password': 'required|between:6,32'
                }
            });
        });

    </script>
@endsection



