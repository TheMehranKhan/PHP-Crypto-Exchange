@extends('layouts.master',['activeSideNav' => active_side_nav()])
@section('title', $title)
@section('content')
    <div class="container my-5">
        @component('components.coin', ['coin' => $coin])
            @component('components.table',['class'=> 'lf-data-table'])
                @slot('thead')
                    <tr class="bg-primary text-white">
                        <th class="all">{{__('No')}}</th>
                        <th class="min-phone-l">{{__('Package Name')}}</th>
                        <th class="min-phone-l">{{__('Minimum Amount')}}</th>
                        <th class="min-phone-l">{{__('Earning')}}</th>
                        <th class="min-phone-l">{{__('System Fee')}}</th>
                        <th class="min-phone-l">{{__('Action')}}</th>
                    </tr>
                @endslot

                @php $i = 1 @endphp
                @foreach($coin->coinStakes as $stake)
                    <tr>
                        <td>{{$i}}</td>
                        <td>{{$stake->name}}</td>
                        <td>{{$stake->minimum_amount}}</td>
                        <td>{{($stake->stake_earning_type == "percent") ? (float)$stake->stake_earning."%" : $stake->stake_earning." ".$stake->symbol}}</td>
                        <td>{{($stake->stake_fee_type == "percent") ? (float)$stake->stake_fee."%" : $stake->stake_fee." ".$stake->symbol}}</td>
                        <td>
                            <a href="{{ route('coins.stake.destroy', $stake->id) }}"
                               class="dropdown-item confirmation"
                               data-form-id="delete-{{ $stake->id }}"
                               data-form-method="DELETE"
                               href="{{ route('coins.stake.destroy', ['stake' => $stake->id]) }}"
                               data-alert="{{__('Do you want to remove this stake package?')}}">
                                <button type="button" class="p-01 border-0 btn-danger">
                                    <i class=" fa fa-remove"></i>
                                </button>
                            </a>
                        </td>
                    </tr>
                    @php $i++ @endphp
                @endforeach
            @endcomponent
            <hr>
            {{  Form::model($coin, ['route'=>['coins.stake.update', $coin->symbol], 'method' => 'put', 'class'=>'form-horizontal validator', 'enctype'=>'multipart/form-data', 'id' => 'stakeSettingForm']) }}
            {{--package_name--}}
            <div class="form-group">
                <label
                        for="name"
                        class="control-label required">{{ __('Package Name') }}
                </label>
                {{ Form::text('name',  '',
                ['class'=> form_validation($errors, 'name'),
                'id' => 'name', 'placeholder' => __('ex: Bronze, Silver, Gold,...')]) }}
                <span class="invalid-feedback"
                      data-name="name">{{ $errors->first('name') }}</span>
            </div>

            {{--minimum_stake_amount--}}
            <div class="form-group">
                <label
                        for="minimum_amount"
                        class="control-label required">{{ __('Minimum Stake Amount') }}
                </label>
                {{ Form::text('minimum_amount',  null,
                ['class'=> form_validation($errors, 'minimum_amount'),
                'id' => 'minimum_amount', 'placeholder' => __('ex: 0.0005')]) }}
                <span class="invalid-feedback"
                      data-name="minimum_amount">{{ $errors->first('minimum_amount') }}</span>
            </div>

            {{--stake_fee--}}
            <div class="form-group">
                <label for="stake_fee" class="control-label required">{{ __('Stake Fee') }}</label>
                <div class="input-group">
                    {{ Form::text('stake_fee', null, ['class'=> form_validation($errors, 'stake_fee'),
                    'id' => 'stake_fee', 'placeholder' => __('ex: 0.01')]) }}
                    <span class="input-group-addon">
                                    {{ Form::select('stake_fee_type', fee_types(),  null, ['class'=>'form-control no-select',
                                    'id' => 'stake_fee_type']) }}
                                </span>
                </div>
                <span class="invalid-feedback"
                      data-name="stake_fee">{{ $errors->first('stake_fee') }}</span>
            </div>

            {{--stake_month--}}
            <div class="form-group">
                <label for="stake_month"
                       class="control-label required">{{ __('Stake Time (Month)') }}</label>
                {{ Form::text('stake_month',  null, ['class'=> form_validation($errors, 'stake_month'),
                'id' => 'stake_month', 'placeholder' => __('ex: 1')]) }}
                <span class="invalid-feedback"
                      data-name="stake_month">{{ $errors->first('stake_month') }}</span>
            </div>

            {{--stake_fee--}}
            <div class="form-group">
                <label for="stake_earning" class="control-label required">{{ __('Stake Earning') }}</label>
                <div class="input-group">
                    {{ Form::text('stake_earning', null, ['class'=> form_validation($errors, 'stake_earning'),
                    'id' => 'stake_earning', 'placeholder' => __('ex: 0.01')]) }}
                    <span class="input-group-addon">
                                    {{ Form::select('stake_earning_type', fee_types(),  null, ['class'=>'form-control no-select',
                                    'id' => 'stake_earning_type']) }}
                                </span>
                </div>
                <span class="invalid-feedback"
                      data-name="stake_earning">{{ $errors->first('stake_earning') }}</span>
            </div>

            {{--stake_status--}}
            <div class="form-group">
                <label for="is_active"
                       class="control-label required">{{ __('Stake Status') }}</label>
                <div>
                    <div class="lf-switch">
                        {{ Form::radio('is_active', ACTIVE, 'active', ['id' => 'is_active' . '-active',
                        'class' => 'lf-switch-input']) }}
                        <label
                                for="{{ 'is_active' }}-active"
                                class="lf-switch-label lf-switch-label-on">{{ __('Enable') }}
                        </label>

                        {{ Form::radio('is_active', INACTIVE, null, ['id' => 'stake_status' . '-inactive',
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
            var form = $('#stakeSettingForm').cValidate({
                rules: {
                    'minimum_withdrawal_amount': 'required|numeric|between:0.00000001,99999999999.99999999|decimalScale:11,8',
                    'daily_withdrawal_limit': 'numeric|between:0.00000001,99999999999.99999999|decimalScale:11,8',
                    'withdrawal_fee': 'required|numeric|min:0|decimalScale:6,8',
                    'withdrawal_status': 'required',
                }
            });
        });
    </script>
@endsection
