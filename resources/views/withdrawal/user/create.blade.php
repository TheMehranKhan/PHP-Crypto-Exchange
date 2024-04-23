@extends('layouts.master',['hideBreadcrumb'=>true,'activeSideNav' => active_side_nav(),'topLess' => true])
@section('title', $title)
@section('content')
    @include('layouts.dashboard.title')
    @component('components.card')
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{$title}}</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3 text-center text-light">
                            <div class="card lf-toggle-border-color lf-toggle-bg-card">
                                <div class="card-header bg-primary">
                                    <h3 class="text-bold text-lg-center text-light m-0 font-weight-bold">{{ $wallet->symbol }}</h3>
                                    <p class="text-sm-center text-light mb-0">({{ $wallet->coin->name }})</p>
                                </div>
                                <div class="card-body">
                                    <img src="{{ get_coin_icon($wallet->coin->icon) }}" alt="{{ $wallet->symbol }}"
                                         class="img-rounded img-fluid lf-w-120px">
                                </div>
                                <div class="card-footer bg-success">
                                    <h4 class="m-0">{{ __("Balance :balance", ['balance' => $wallet->primary_balance]) }}</h4>
                                </div>
                                @if(!empty($bonus))
                                <div class="card-footer bg-warning">
                                    <h4 class="m-0">{{ __("Bonus Balance :balance", ['balance' => $bonus->earning]) }}</h4>
                                </div>
                                @endif
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="card lf-toggle-border-color lf-toggle-bg-card">
                                <div class="card-body">
                                    @if($wallet->coin->withdrawal_status == ACTIVE)
                                        {!! Form::open(['route'=>['user.wallets.withdrawals.store', $wallet->symbol], 'method' => 'post', 'class'=>'form-horizontal validator dark-text-color', 'id' => 'withdrawalForm']) !!}
                                        @if(in_array($wallet->coin->type, [COIN_TYPE_CRYPTO, COIN_TYPE_ERC20,COIN_TYPE_BEP20,COIN_TYPE_TRC20,COIN_TYPE_TRC10]))
                                            @include('withdrawal.user._crypto_form')
                                        @else
                                            @include('withdrawal.user._fiat_from')
                                        @endif

                                        {{--amount--}}
                                        <div class="form-group {{ $errors->has('amount') ? 'has-error' : '' }}">
                                            <label for="amount"
                                                   class="control-label required">{{ __('Amount') }}</label>
                                            <div>
                                                {{ Form::text('amount',  old('amount', null), ['class'=>'form-control lf-toggle-bg-input lf-toggle-border-color', 'id' =>'amount', 'placeholder' => __('ex: 20.99')]) }}
                                                <span class="invalid-feedback"
                                                      data-name="amount">{{ $errors->first('amount') }}</span>
                                            </div>
                                        </div>

                                        {{--withdrawal_policy--}}
                                        <div class="form-group {{ $errors->has('withdrawal_policy') ? 'has-error' : '' }}">
                                            <div class="d-flex mt-4">
                                                <div class="lf-checkbox">
                                                    {{ Form::checkbox('withdrawal_policy', 1, false, ['id' => 'policy']) }}
                                                    <label for="policy">{{ __("Accept withdrawal's policy.") }}</label>
                                                </div>
                                                <a class="ml-2 text-info"
                                                   href="{{ settings('withdrawal_policy_page_url') }}"><small>{{ __("Withdrawal's policy page") }}</small></a>
                                            </div>
                                            <span class="invalid-feedback"
                                                  data-name="withdrawal_policy">{{ $errors->first('withdrawal_policy') }}</span>
                                        </div>

                                        {{--submit button--}}
                                        <div class="form-group">
                                            {{ Form::submit(__('Withdraw Balance'),['class'=>'btn btn-info form-submission-button']) }}
                                        </div>
                                        {!! Form::close() !!}
                                    @else
                                        @include('withdrawal.user._disable_alert')
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{__('Important Information')}}</h4>
                </div>
                <div class="card-body">
                    <div class="important-info">
                        <ul>
                            <li>
                                <i class="mdi mdi-checkbox-blank-circle"></i>
                                {{__('For security reasons, Trademen process withdrawals by
                                review once a day. For more information in this
                                policy. Please see our wallet security page.')}}
                            </li>
                            @if(in_array($wallet->coin->type, [COIN_TYPE_CRYPTO, COIN_TYPE_ERC20,COIN_TYPE_TRC20,COIN_TYPE_BEP20,COIN_TYPE_TRC10]))
                                <li>
                                    <i class="mdi mdi-checkbox-blank-circle"></i>
                                    {{ __('Minimum Withdrawal for this Coin is :minDeposit and the Network supported is :network', ['minDeposit' => !empty($wallet->coin->minimum_withdrawal_amount) ? $wallet->coin->minimum_withdrawal_amount : "No Limit", 'network' => ($wallet->coin->api['selected_apis'] == "CoinpaymentsApi") ? $wallet->coin->symbol : str_replace('Api','',$wallet->coin->api['selected_apis'])]) }}
                                </li>
                                <li>
                                    <i class="mdi mdi-checkbox-blank-circle"></i>
                                    {{ __('Withdrawal Fee :fee', ['fee' => ($wallet->coin->withdrawal_fee_type == 'percent') ? $wallet->coin->withdrawal_fee.'%' : $wallet->coin->withdrawal_fee]) }}
                                </li>
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    @endcomponent
@endsection

@section('script')
    @include('withdrawal.user._validation_script')
    <script>
        "use strict";

        @if($wallet->coin->type === COIN_TYPE_FIAT)
        new Vue({
            el: '#app',
            data: {
                showBank: "{{ old('api') === API_BANK ? true : false }}",
                showAddress: "{{ old('api') === API_ADVCASH ? false : true }}",
            },
            methods: {
                changePaymentMethod(event) {
                    this.showBank = event.target.value == "{{ API_BANK }}" ? true : false;
                    this.showAddress = event.target.value == "{{ API_ADVCASH }}" ? false : true;
                }
            }
        });
        @endif
    </script>
@endsection
