<style>
    .staking-inner {
        font-size: .8rem;
        max-width: 700px;
        width: 100%;
    }

    .staking-inner-img {
        margin-bottom: 2rem;
    }

    .staking-inner-options {
        margin-bottom: 2rem;
        padding: 0 0 2rem;
    }

    .option-item {
        border-bottom: 1px solid #434651;
        display: flex;
        justify-content: space-between;
        margin-bottom: 0.3rem;
        padding: 1rem 0 0.5rem;
    }

    .options-item-title {
        color: #8b8d98;
    }

    .options-item-value,
    .calculator-info-value {
        color: #fff;
        font-weight: 500;
    }

    .staking-inner .calculator-info {
        margin-bottom: 2rem;
        padding: 0 0 2rem;
    }

    .staking-inner .calculator-info-item {
        display: flex;
        justify-content: space-between;
        margin-bottom: 0.3rem;
        text-align: right;
    }

    .components-filter-row {
        align-items: center;
        align-items: flex-end;
        display: flex;
        justify-content: flex-start;
        margin-bottom: 2rem;
    }

    .components-filter-row div button {
        background-color: #363841;
        color: #fff;
        transition: 0.3s;
    }

    .components-filter-row div button:hover {
        background-color: #2f3138;
    }

    .components-filter-item input {
        background-color: transparent;
        border: 1px solid #434651;
        font-size: 0.8rem;
        padding: 0.8rem;
    }

    .components-filter-item input:focus {
        border-color: #fdc312;
    }
</style>
<div id="stake" class="w-full">
    <div class="container">
        <h1 class="page-title">
            {{__('Stake')}}
        </h1>

        <div class="staking-inner">
            <div class="staking-inner-img">
                <img :src="`/storage/images/stake.png`" alt="" class="img-fluid">
            </div>
            <div class="staking-inner-options">
                <div class="option-item">
                    <span class="options-item-title">{{__('Coin')}}</span>
                    <span class="options-item-value">
                    @{{coin.name}}
                    </span>
                </div>
                <div class="option-item">
                    <span class="options-item-title">{{__('Symbol')}}</span>
                    <span class="options-item-value">
                    @{{coin.symbol}}
                    </span>
                </div>
                <div class="option-item">
                    <span class="options-item-title">{{__('Minimum Stake Amount')}}</span>
                    <span class="options-item-value">
                    @{{stakes[0].minimum_amount}}
                    </span>
                </div>
                <div class="option-item" v-for="stake in stakes" key=stake">
                    <span class="options-item-title">@{{stake.stake_month}} {{__('Stake Month')}}</span>
                    <span class="options-item-value text-green">
                    @{{stake.stake_earning}}@{{stake.stake_earning_type === 'fixed' ? stake.symbol : '%'}}
                    </span>
                </div>
            </div>
            <div class="staking-inner-calculator">
                <div class="calculator-info">
                    <div class="calculator-info-item">
                        <span>{{__('Balance')}}:</span>
                        <span class="calculator-info-value">
                            <span v-text="balance" class="text-primary"></span>
                            <span>@{{coin.symbol}}</span>
                        </span>
                    </div>
                    <div class="calculator-info-item">
                        <span>{{__('Stake Interest')}}:</span>
                        <span class="calculator-info-value"> @{{estimateEarning}} @{{coin.symbol}}</span>
                    </div>
                    <div class="calculator-info-item"><span>{{__('Stake Periods')}}:</span>
                        @{{selectedPeriod}} {{__('Stake Month')}}</div>
                    <div class="calculator-info-item"><span>{{__('end time')}}:</span> @{{endDate}}</div>
                </div>
                <div class="calculator-form">
                    <form>
                        <span class="form-label">{{__('Stake Periods')}}:</span>
                        <div class="components-filter-row">
                            <div v-for="(stake, index) in stakes" key=stake" v-if="stake.stake_month===selectedPeriod">
                                <button type="button" @click="changePeriod(index)"
                                        class="mr-2 mt-2 border-0 py-2 px-4 rounded btn-primary">
                                    <span class="components-filter__icon">@{{stake.stake_month}} {{__('Stake Month')}}</span>
                                </button>
                            </div>
                            <div v-else>
                                <button type="button" @click="changePeriod(index)"
                                        class="mr-2 mt-2 border-0 py-2 px-4 rounded">
                                    <span class="components-filter__icon">@{{stake.stake_month}} {{__('Stake Month')}}</span>
                                </button>
                            </div>
                        </div>
                        <div class="components-filter-row">
                            <div class="components-filter-item col-6">
                                <label for="text-input-36" class="form-label">{{__('Amount')}} @{{coin.symbol}}:</label>
                                <input placeholder="0.00" v-model="form.stake_amount" @keypress="(e) => handleInput(e)"
                                       @paste.prevent @drop.prevent id="text-input-36" type="text"
                                       class="rounded mt-2 block w-100">
                            </div>
                        </div>
                        {{--withdrawal_policy--}}
                        <div class="components-filter-row">
                            <div class="components-filter-item col-6">
                                    <div class="lf-checkbox">
                                        {{ Form::checkbox('stake_policy', 1, false, ['id' => 'policy']) }}
                                        <label class="font-size-15" for="policy"><a href="{{ settings('stake_policy_page_url') }}"> {{ __("Accept stake's policy.") }}</a></label>
                                    </div>

                            </div>
                        </div>
                        <div class="components-filter-row">
                            <div class="components-filter-item col-6">
                                @guest
                                    <div class="btn btn-block btn-dark link-box">
                                        <a href="{{ route('login') }}">{{ __('Log In') }}</a> {{ __('or') }}
                                        <a href="{{ route('register.index') }}">{{ __('Register') }}</a> {{ __('to exchange') }}
                                    </div>
                                @endguest

                                @auth
                                    <button type="button" @click="submitExchange()" :disabled="isLoading"
                                            class="btn btn-block btn-primary">
                                            <span v-if="isLoading">
                                                <span class="spinner-border spinner-border-sm" role="status"
                                                      aria-hidden="true"></span>
                                                {{ __('Placing Order...') }}
                                            </span>
                                        <span v-else>
                                                {{__('Stake')}}
                                            </span>
                                    </button>
                                @endauth
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>