@extends('layouts.master',['activeSideNav' => active_side_nav()])
@section('title', $title)
@section('content')
    <div class="container my-5">
        @component('components.coin', ['coin' => $coin])
            @component('components.table',['class'=> 'lf-data-table'])
                @slot('thead')
                    <tr>
                        <th class="all">{{__('No')}}</th>
                        <th class="min-phone-l">{{__('Package Name')}}</th>
                        <th class="min-phone-l">{{__('Minimum Amount')}}</th>
                        <th class="min-phone-l">{{__('Maximum Amount')}}</th>
                        <th class="min-phone-l">{{__('Earning')}}</th>
                        <th class="min-phone-l">{{__('Bonus Usage Count')}}</th>
                        <th class="min-phone-l">{{__('Bonus Earning')}}</th>
                        <th class="min-phone-l">{{__('Action')}}</th>
                    </tr>
                @endslot

                @php $i = 1 @endphp
                @foreach($coin->coinBonuses as $bonus)
                    <tr>
                        <td>{{$i}}</td>
                        <td>{{$bonus->name}}</td>
                        <td>{{$bonus->minimum_amount}}</td>
                        <td>{{$bonus->maximum_amount}}</td>
                        <td>{{($bonus->bonus_earning_type == "percent") ? (float)$bonus->bonus_earning."%" : $bonus->bonus_earning." ".$bonus->symbol}}</td>
                        <td>{{$bonus->bonus_usage_count}}</td>
                        <td>{{$bonus->coin_earning}}</td>
                        <td>
                            <a href="{{ route('coins.bonus.destroy', $bonus->id) }}"
                               class="confirmation text-danger font-size-20"
                               data-form-id="delete-{{ $bonus->id }}"
                               data-form-method="DELETE"
                               href="{{ route('coins.bonus.destroy', ['bonus' => $bonus->id]) }}"
                               data-alert="{{__('Do you want to remove this bonus package?')}}">
                                    <i class=" fa fa-remove"></i>
                            </a>
                        </td>
                    </tr>
                    @php $i++ @endphp
                @endforeach
            @endcomponent
            <hr>
            {{  Form::model($coin, ['route'=>['coins.bonus.update', $coin->symbol], 'method' => 'put', 'class'=>'form-horizontal validator', 'enctype'=>'multipart/form-data', 'id' => 'bonusSettingForm']) }}
            {{--package_name--}}
            <div class="form-group">
                <label
                        for="name"
                        class="control-label required">{{ __('Package Name') }}
                </label>
                {{ Form::text('name',  '',
                ['class'=> form_validation($errors, 'name'),
                'id' => 'name', 'placeholder' => __('ex: 10000 TRX First Deposit')]) }}
                <span class="invalid-feedback"
                      data-name="name">{{ $errors->first('name') }}</span>
            </div>

            {{--minimum_bonus_amount--}}
            <div class="form-group">
                <label
                        for="minimum_amount"
                        class="control-label required">{{ __('Minimum Bonus Amount') }}
                </label>
                {{ Form::text('minimum_amount',  null,
                ['class'=> form_validation($errors, 'minimum_amount'),
                'id' => 'minimum_amount', 'placeholder' => __('ex: 0.0005')]) }}
                <span class="invalid-feedback"
                      data-name="minimum_amount">{{ $errors->first('minimum_amount') }}</span>
            </div>

                {{--maximum_bonus_amount--}}
                <div class="form-group">
                    <label
                            for="maximum_amount"
                            class="control-label required">{{ __('Maximum Bonus Amount') }}
                    </label>
                    {{ Form::text('maximum_amount',  null,
                    ['class'=> form_validation($errors, 'maximum_amount'),
                    'id' => 'maximum_amount', 'placeholder' => __('ex: 0.0005')]) }}
                    <span class="invalid-feedback"
                          data-name="maximum_amount">{{ $errors->first('maximum_amount') }}</span>
                </div>

            {{--bonus_usage_count--}}
            <div class="form-group">
                <label for="bonus_usage_count"
                       class="control-label required">{{ __('Remain Bonus Count') }}</label>
                {{ Form::text('bonus_usage_count',  null, ['class'=> form_validation($errors, 'bonus_usage_count'),
                'id' => 'bonus_usage_count', 'placeholder' => __('ex: 1')]) }}
                <span class="invalid-feedback"
                      data-name="bonus_usage_count">{{ $errors->first('bonus_usage_count') }}</span>
            </div>

            {{--Bonus Earning--}}
            <div class="form-group">
                <label for="bonus_earning" class="control-label required">{{ __('Bonus Earning') }}</label>
                <div class="input-group">
                    {{ Form::text('bonus_earning', null, ['class'=> form_validation($errors, 'bonus_earning'),
                    'id' => 'bonus_earning', 'placeholder' => __('ex: 0.01')]) }}
                    <span class="input-group-addon">
                                    {{ Form::select('bonus_earning_type', fee_types(),  null, ['class'=>'form-control no-select',
                                    'id' => 'bonus_earning_type']) }}
                                </span>
                </div>
                <span class="invalid-feedback"
                      data-name="bonus_earning">{{ $errors->first('bonus_earning') }}</span>
            </div>

                {{--Bonus Earning--}}
            <div class="form-group">
                <label for="coin_earning" class="control-label required">{{ __('Coin Earning') }}</label>
                <div class="input-group">
                        {{ Form::select('coin_earning', $coins,  null, ['class'=> form_validation($errors, 'coin_earning'),
                        'id' => 'coin_earning']) }}
                </div>
                <span class="invalid-feedback"
                          data-name="coin_earning">{{ $errors->first('coin_earning') }}</span>
            </div>


            {{--Bonus Status--}}
            <div class="form-group">
                <label for="is_active"
                       class="control-label required">{{ __('Bonus Status') }}</label>
                <div>
                    <div class="lf-switch">
                        {{ Form::radio('is_active', ACTIVE, 'active', ['id' => 'is_active' . '-active',
                        'class' => 'lf-switch-input']) }}
                        <label
                                for="{{ 'is_active' }}-active"
                                class="lf-switch-label lf-switch-label-on">{{ __('Enable') }}
                        </label>

                        {{ Form::radio('is_active', INACTIVE, null, ['id' => 'bonus_status' . '-inactive',
                        'class' => 'lf-switch-input']) }}
                        <label
                                for="{{ 'is_active' }}-inactive"
                                class="lf-switch-label lf-switch-label-off">{{ __('Disable') }}
                        </label>
                    </div>
                    <span class="invalid-feedback"
                          data-name="is_active">{{ $errors->first('is_active') }}</span>
                </div>
            </div>
            {{--submit button--}}
            <div class="form-group my-3">
                {{ Form::submit(__('Add And Save'),['class'=>'btn btn-info form-btn form-submission-button']) }}
                {{ Form::reset(__('Reset'),['class'=>'btn btn-danger form-btn']) }}
            </div>
            {{ Form::close() }}
        @endcomponent
    </div>
@endsection

@section('style')
    @include('coins.admin._style')
    @include('layouts.includes._avatar_and_loader_style')
@endsection

@section('script')
    @if(language(App()->getLocale())['direction']==PAGE_DIRECTION_RIGHT_TO_LEFT)
        <script src="{{ asset('plugins/cvalidator/cvalidator-language-fa.js') }}"></script>
    @else
        <script src="{{ asset('plugins/cvalidator/cvalidator-language-en.js') }}"></script>
    @endif
    <script src="{{ asset('plugins/cvalidator/cvalidator.js') }}"></script>
    <script src="{{asset('plugins/datatables/datatables.min.js')}}"></script>
    <script src="{{asset('plugins/datatables/dataTables.bootstrap4.min.js')}}"></script>
    <script src="{{asset('plugins/datatables/table-datatables-responsive.min.js')}}"></script>
    <script>
        "use strict";

        $(document).ready(function () {
            var form = $('#bonusSettingForm').cValidate({
                rules: {
                    'minimum_amount': 'required|numeric|between:0.00000001,99999999999.99999999|decimalScale:11,8',
                    'bonus_usage_count': 'numeric|between:0,20|decimalScale:2',
                    'bonus_earning': 'required|numeric|min:0|decimalScale:6,8',
                    'is_active': 'required',
                }
            });
        });
    </script>
@endsection
