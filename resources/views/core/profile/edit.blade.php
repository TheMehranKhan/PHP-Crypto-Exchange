@extends('layouts.master',['hideBreadcrumb'=>true,'activeSideNav' => active_side_nav(),'topLess' => true])
@section('title', $title)
@section('content')
    <div class="col-lg-12">
        @component('components.profile', ['user' => $user])
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">{{__('User Details')}}</h4>
                    </div>
                    <div class="card-body">
                        <form onsubmit="event.preventDefault();">
                            <div class="form-row">
                                <div class="form-group col-xl-12">
                                    <div class="media align-items-center mb-3">
                                        @include('core.profile.avatar')
                                        <div class="media-body">
                                            <h4 class="mb-0">{{ $user->profile->full_name }}</h4>
                                            <p class="mb-0">
                                                Max file size is 2M
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <ul class="card-profile__info">
                                    <li>
                                        <h5 class="mr-4">{{__('Address')}}</h5>
                                        <span class="text-muted"
                                        >{{ $user->profile->address }}</span>
                                    </li>
                                    <li class="mb-1">
                                        <h5 class="mr-4">{{__('Since')}}</h5>
                                        <span>{{ $user->profile->created_at->diffForHumans() }}</span>
                                    </li>
                                </ul>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">{{__('Login Details')}}</h4>
                        <span class="text-warning">
                            {{ __('Not Editable') }}
                        </span>
                    </div>
                    <div class="card-body">
                        <form onsubmit="event.preventDefault();">
                            <div class="form-row">
                                <div class="form-group col-xl-12">
                                    <label class="mr-sm-2">{{__('Email')}}</label>
                                    <input class="form-control" disabled value="{{$user->email}}"/>
                                </div>
                                <div class="form-group col-xl-12">
                                    <label class="mr-sm-2">{{__('Username')}}</label>
                                    <input class="form-control" disabled value="{{$user->username}}"/>
                                </div>
                                <div class="form-group col-xl-12">
                                    <label class="mr-sm-2">{{__('Mobile')}}</label>
                                    <input class="form-control" disabled value="{{$user->mobile}}"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">{{__('Edit Profile')}}</h4>
                    </div>
                    <div class="card-body">
                        {{ Form::model($user->profile, ['route'=>['profile.update'],'class'=>'form-horizontal edit-profile-form','method'=>'put', 'id' => 'profileEditForm']) }}
                        {{--first name--}}
                        <div class="form-row">
                            <div class="form-group col-xl-6">
                                <label for="first_name"
                                       class="mr-sm-2 required">{{ __('First Name') }}</label>
                                {{ Form::text('first_name', null, ['class'=> form_validation($errors, 'first_name'), 'id' => 'first_name']) }}
                                <span class="invalid-feedback">{{ $errors->first('first_name') }}</span>
                            </div>
                            {{--last name--}}
                            <div class="form-group col-xl-6">
                                <label for="last_name"
                                       class="mr-sm-2 required">{{ __('Last Name') }}</label>
                                {{ Form::text('last_name', null, ['class'=>form_validation($errors, 'last_name'), 'id' => 'last_name']) }}
                                <span class="invalid-feedback">{{ $errors->first('last_name') }}</span>
                            </div>

                        </div>

                        <div class="form-row">
                            {{--address--}}
                            <div class="form-group col-xl-12">
                                <label for="address"
                                       class="mr-sm-2">{{ __('Address') }}</label>
                                {{ Form::textarea('address',  null, ['class'=> form_validation($errors, 'address'), 'id' => 'address', 'rows'=>2]) }}
                                <span class="invalid-feedback">{{ $errors->first('address') }}</span>
                            </div>

                        </div>
                        {{--submit button--}}
                        {{ Form::close() }}
                    </div>
                </div>
                <div class="form-group">
                    {{ Form::submit(__('Update'),['class'=>'btn btn-info lf-card-btn']) }}
                    {{ Form::button('<i class="fa fa-undo"></i>',['class'=>'btn btn-danger reset-button lf-card-btn']) }}
                </div>
            </div>
        @endcomponent
    </div>
@endsection

@section('style')
    @include('layouts.includes._avatar_and_loader_style')
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
            var form = $('#profileEditForm').cValidate({
                rules: {
                    'first_name': 'required|alphaSpace|between:2,255',
                    'last_name': 'required|alphaSpace|between:2,255',
                    'address': 'max:500',
                },
            });
        });
    </script>
@endsection
