<div class="row">
    <div class="card col-xl-6 col-lg-6 col-md-12 col-xxl-6">
        @include('exchange._user_base_coin_balance')
        <div class="card-body">
            <form id="market-buy-form">
                <div class="form-group row">
                    <label for="price" class="col-sm-3 col-form-label p-1 px-2">{{ __('Price') }}</label>
                    <div class="col-sm-9">
                        <div class="input-group">
                            <p class="form-control col-form-label p-1 px-2">
                                {{ __('Market') }}</p>
                            <div class="input-group-append">
                                <span class="input-group-text" v-text="pairDetail.baseCoin"></span>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="total" class="col-sm-3 col-form-label p-1 px-2">{{ __('Total') }}</label>
                    <div class="col-sm-9">
                        <div class="input-group">
                            <input type="text"
                                   class="form-control text-right"
                                   name="total"
                                   ref="marketBuyFormData"
                                   v-model="marketBuyFormData.total"
                                   id="market-buy-total-element">
                            <div class="input-group-append">
                                <span class="input-group-text" v-text="pairDetail.baseCoin"></span>
                            </div>

                        </div>
                        <div class="mt-3 d-flex justify-content-between" role="group">
                            <button
                                    type="button"
                                    class="lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                    @auth
                                    @click="onClickProduceAmountByPercentHandler('marketBuyFormData', 25, 'buy')"
                                    @endauth
                            >
                                {{ __('25%') }}
                            </button>
                            <button
                                    type="button"
                                    class="lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                    @auth
                                    @click="onClickProduceAmountByPercentHandler('marketBuyFormData', 50, 'buy')"
                                    @endauth
                            >
                                {{ __('50%') }}
                            </button>
                            <button
                                    type="button"
                                    class="lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                    @auth
                                    @click="onClickProduceAmountByPercentHandler('marketBuyFormData', 75, 'buy')"
                                    @endauth
                            >
                                {{ __('75%') }}
                            </button>
                            <button
                                    type="button"
                                    class="lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                    @auth
                                    @click="onClickProduceAmountByPercentHandler('marketBuyFormData', 100, 'buy')"
                                    @endauth
                            >
                                {{ __('100%') }}
                            </button>
                        </div>
                    </div>
                </div>

                @guest
                    <div class="font-size-12 p-2 lf-toggle-border-card text-center">
                        <a href="{{ route('login') }}" class="text-green">{{ __('Log In') }}</a> {{ __('or') }} <a
                                href="{{ route('register.index') }}"
                                class="text-green">{{ __('Register') }}</a> {{ __('to trade') }}
                    </div>
                @endguest

                @auth
                    <button type="submit"
                            class="btn btn-success btn-block form-submission-button"
                            @click="placeOrder('market', 'buy', 'marketBuyForm')"
                            :disabled="marketBuyFormData.placingOrder">
            <span v-if="marketBuyFormData.placingOrder">
                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                {{ __('Placing Order...') }}
            </span>
                        <span v-else>
                {{ __('BUY') }} <span v-text="pairDetail.tradeCoin"></span>
            </span>
                    </button>
                @endauth

            </form>
        </div>
    </div>
    <div class="card col-xl-6 col-lg-6 col-md-12 col-xxl-6">
        @include('exchange._user_trade_coin_balance')

        <div class="card-body">
            <form id="market-sell-form">
                <div class="form-group row">
                    <label for="price" class="col-sm-3 col-form-label p-1 px-2">{{ __('Price') }}</label>
                    <div class="col-sm-9">
                        <div class="input-group">
                            <p class="form-control col-form-label p-1 px-2">
                                {{ __('Market') }}</p>
                            <div class="input-group-append">
                                <span class="input-group-text" v-text="pairDetail.baseCoin"></span>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="amount" class="col-sm-3 col-form-label p-1 px-2">{{ __('Amount') }}</label>
                    <div class="col-sm-9">
                        <div class="input-group">
                            <input type="text"
                                   class="form-control text-right"
                                   name="amount"
                                   ref="marketSellFormData"
                                   v-model="marketSellFormData.amount"
                                   id="market-sell-amount-element">
                            <div class="input-group-append">
                                <span class="input-group-text" v-text="pairDetail.tradeCoin"></span>
                            </div>

                        </div>
                        <div class="mt-3 d-flex justify-content-between" role="group">
                            <button
                                    type="button"
                                    class="lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                    @auth
                                    @click="onClickProduceAmountByPercentHandler('marketSellFormData', 25, 'sell')"
                                    @endauth
                            >
                                {{ __('25%') }}
                            </button>
                            <button
                                    type="button"
                                    class="lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                    @auth
                                    @click="onClickProduceAmountByPercentHandler('marketSellFormData', 50, 'sell')"
                                    @endauth
                            >
                                {{ __('50%') }}
                            </button>
                            <button
                                    type="button"
                                    class="lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                    @auth
                                    @click="onClickProduceAmountByPercentHandler('marketSellFormData', 75, 'sell')"
                                    @endauth
                            >
                                {{ __('75%') }}
                            </button>
                            <button
                                    type="button"
                                    class="lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                    @auth
                                    @click="onClickProduceAmountByPercentHandler('marketSellFormData', 100, 'sell')"
                                    @endauth
                            >
                                {{ __('100%') }}
                            </button>
                        </div>
                    </div>
                </div>

                @guest
                    <div class="font-size-12 p-2 lf-toggle-border-card text-center">
                        <a href="{{ route('login') }}" class="text-green">{{ __('Log In') }}</a> {{ __('or') }} <a
                                href="{{ route('register.index') }}"
                                class="text-green">{{ __('Register') }}</a> {{ __('to trade') }}
                    </div>
                @endguest

                @auth
                    <button type="submit"
                            class="btn btn-danger btn-block form-submission-button"
                            @click="placeOrder('market', 'sell', 'marketSellForm')"
                            :disabled="marketSellFormData.placingOrder">
            <span v-if="marketSellFormData.placingOrder">
                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                {{ __('Placing Order...') }}
            </span>
                        <span v-else>
                {{ __('SELL') }} <span v-text="pairDetail.tradeCoin"></span>
            </span>
                    </button>
                @endauth

            </form>
        </div>
    </div>
</div>
