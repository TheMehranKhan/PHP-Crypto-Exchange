@extends('layouts.auth_master',['headerLess'=>true, 'activeSideNav' => active_side_nav()])
@section('title', __('Register'))
@section('content')
    @component('components.auth', ['pageTitle' => __('Create Your Account')])
        <form id="registerForm" action="{{ route('register.store') }}" method="post">
            @csrf
            <div class="form-row">
                <div class="col-md-6">
                    <div class="input-group mb-md-3 mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text lf-w-40px"><i class="fa fa-user"></i></div>
                        </div>
                        <input type="text"
                               class="{{ form_validation($errors, 'first_name') }}"
                               name="first_name"
                               value="{{ old('first_name') }}"
                               placeholder="{{__('First Name')}}">
                        <span class="invalid-feedback" data-name="first_name">{{ $errors->first('first_name') }}</span>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="input-group mb-md-3 mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text lf-w-40px"><i class="fa fa-user"></i></div>
                        </div>
                        <input type="text"
                               class="{{ form_validation($errors, 'last_name') }}"
                               name="last_name"
                               value="{{ old('last_name') }}"
                               placeholder="{{__('Last Name')}}">
                        <span class="invalid-feedback" data-name="last_name">{{ $errors->first('last_name') }}</span>
                    </div>
                </div>
            </div>

            <div class="input-group mb-md-3 mb-2">
                <div class="input-group-prepend">
                    <div class="input-group-text lf-w-40px"><i class="fa fa-user"></i></div>
                </div>
                <input type="text"
                       class="{{ form_validation($errors, 'username') }} typeleft"
                       name="username"
                       value="{{ old('username') }}"
                       placeholder="{{__('Username')}}">
                <span class="invalid-feedback" data-name="username">{{ $errors->first('username') }}</span>
            </div>

            <div class="input-group mb-md-3 mb-2">
                <div class="input-group-prepend">
                    <div class="input-group-text lf-w-40px"><i class="fa fa-envelope"></i></div>
                </div>
                <input type="text"
                       class="{{ form_validation($errors, 'email') }} typeleft"
                       name="email"
                       value="{{ old('email') }}"
                       placeholder="{{__('Email')}}">
                <span class="invalid-feedback" data-name="email">{{ $errors->first('email') }}</span>
            </div>

            <div class="input-group mb-md-3 mb-2">
                <input dir="ltr" id="phone"
                       type="text"
                       class="{{ form_validation($errors, 'mobile') }} form-group typeleft"
                       name="mobile"
                       value="{{ old('mobile') }}"
                >
                <span class="invalid-feedback" data-name="mobile">{{ $errors->first('mobile') }}</span>
            </div>

            <div class="input-group mb-md-3 mb-2">
                <div class="input-group-prepend">
                    <div class="input-group-text lf-w-40px"><i class="fa fa-calendar"></i></div>
                </div>
                <input dir="rtl" id="birthday"
                       type="text"
                       class="{{ form_validation($errors, 'birthday') }}"
                       name="birthday"
                       value="{{ old('birthday') }}"
                       placeholder="{{__('Birthday')}}">
                <span class="invalid-feedback" data-name="birthday">{{ $errors->first('birthday') }}</span>
            </div>

            <div class="input-group mb-md-3 mb-2">
                <div class="input-group-prepend">
                    <div class="input-group-text lf-w-40px"><i class="fa fa-lock"></i></div>
                </div>
                <input type="password"
                       class="{{ form_validation($errors, 'password') }}"
                       name="password"
                       placeholder="{{__('Password')}}">
                <span class="invalid-feedback" data-name="password">{{ $errors->first('password') }}</span>
            </div>

            <div class="input-group mb-md-3 mb-2">
                <div class="input-group-prepend">
                    <div class="input-group-text lf-w-40px"><i class="fa fa-lock"></i></div>
                </div>
                <input type="password"
                       class="{{ form_validation($errors, 'password_confirmation') }}"
                       name="password_confirmation"
                       placeholder="{{__('Confirm Password')}}">
                <span class="invalid-feedback"
                      data-name="password_confirmation">{{ $errors->first('password_confirmation') }}</span>
            </div>

            @if( env('APP_ENV') != 'local' && settings('display_google_captcha') )
                <div class="input-group mb-md-3 mb-2">
                    <div>
                        {{ view_html(NoCaptcha::display()) }}
                    </div>
                    <span class="invalid-feedback">{{ $errors->first('g-recaptcha-response') }}</span>
                </div>
            @endif

            <div class="checkbox mb-md-3 mb-2">
                <div class="lf-checkbox">
                    <input id="rememberMe"
                           type="checkbox"
                           name="check_agreement">
                    <label data-toggle="modal" data-bs-toggle="modal" data-target="#GSCCModal" for="rememberMe"
                           class="lf-toggle-text-color">
                        {{  __('Accept our terms and conditions.') }}
                    </label>
                </div>
                <span class="invalid-feedback"
                      data-name="check_agreement">{{ $errors->first('check_agreement') }}</span>
            </div>

            <div class="form-group">
                <button type="submit"
                        class="btn btn-block btn-info font-size-14 font-weight-bold form-submission-button">{{ __('Register') }}</button>
            </div>
            @if(request()->has('ref') && settings('referral'))
                <input type="hidden" name="referral_id" value="{{ request()->get('ref') }}">
                <span class="invalid-feedback" data-name="referral_id">{{ $errors->first('referral_id') }}</span>
            @endif
        </form>
        <div class="text-center pt-2">
            <a href="{{ route('login') }}">{{ __('Login') }}</a>
        </div>
        @if(settings('require_email_verification'))
            <div class="text-center pt-1">
                <a href="{{ route('forget-password.index') }}">{{ __('Forgot Password?') }}</a>
            </div>
        @endif
        <div id="GSCCModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <!-- Modal -->
            <div class="modal-dialog">
                <div class="modal-content lf-toggle-bg-card">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">{{$visualPage->title}}</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"><i class="fa fa-close"></i> </button>
                    </div>
                    <div class="modal-body">
                        {{ view_html(short_code(dynamic_language($visualPage->body,$fallbackLang,$currentLang))) }}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">Understood</button>
                    </div>
                </div>
            </div>
        </div>
    @endcomponent
@endsection


@section('script')
    @if( env('APP_ENV') == 'production' && settings('display_google_captcha') )
        {{ view_html(NoCaptcha::renderJs()) }}
    @endif

    <script src="{{ asset('plugins/inttelinput/intlTelInput.min.js') }}"></script>
    @if(language(App()->getLocale())['direction']==PAGE_DIRECTION_RIGHT_TO_LEFT)
        <script src="{{ asset('plugins/cvalidator/cvalidator-language-fa.js') }}"></script>
    @else
        <script src="{{ asset('plugins/cvalidator/cvalidator-language-en.js') }}"></script>
    @endif
    <script src="{{ asset('plugins/cvalidator/cvalidator.js') }}"></script>
    <script src="{{ asset('plugins/moment.js/moment.min.js') }}"></script>
    <script src="{{ asset('plugins/bs4-datetimepicker/js/bootstrap-datepicker.min.js') }}"></script>
    <script>
        "use strict";

        $(document).ready(function () {
            $('#registerForm').cValidate({
                rules: {
                    'first_name': 'required|alphaSpace|between:2,255',
                    'last_name': 'required|alphaSpace|between:2,255',
                    'username': 'required|alphaDash|max:255',
                    'birthday': 'date:yyyy-mm-dd',
                    'email': 'required|email|between:5,255',
                    'mobile': 'required|between:6,32',
                    'password': 'required|strongPassword|between:8,32',
                    'password_confirmation': 'required|same:password',
                    'check_agreement': 'required',
                }
            });

            var input = document.querySelector("#phone");
            window.intlTelInput(input, {
                // allowDropdown: false,
                autoHideDialCode: true,
                // autoPlaceholder: "off",
                // dropdownContainer: document.body,
                // excludeCountries: ["us"],
                formatOnDisplay: true,
                geoIpLookup: function(callback) {
                    $.get("https://ipinfo.io?token=bae2888f59b3f5", function() {}, "jsonp").always(function(resp) {
                        var countryCode = (resp && resp.country) ? resp.country : "";
                        callback(countryCode);
                    });
                },
                // hiddenInput: "full_number",
                initialCountry: "auto",
                // localizedCountries: { 'gb': 'United Kingdom' },
                nationalMode: false,
                // onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
                // placeholderNumberType: "MOBILE",
                // preferredCountries: ['cn', 'jp'],
                // separateDialCode: true,
                utilsScript: "{{ asset('plugins/inttelinput/utils.js') }}",
            });

            $('#birthday').datepicker({
                format: 'yyyy-mm-dd',
                startView : 2,
                endDate: '-18y'
            });
        });

    </script>
@endsection

@section('style')
    <link rel="stylesheet" href="{{ asset('plugins/bs4-datetimepicker/css/bootstrap-datepicker.min.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/inttelinput/intlTelInput.min.css') }}">
@endsection
