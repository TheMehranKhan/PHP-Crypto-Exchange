<div class="module module-orderform">
    <div class="col-xl-12 col-lg-12 col-md-12 col-xxl-12">
        <ul class="nav nav-pills d-block" role="tablist">
            <li>
                <a class="rounded-left module-orderform__buy-forms__button button-tab button-tab-buy active"
                   data-toggle="pill"
                   href="#buyLimit"
                   role="tab"
                   aria-selected="true">{{__('Buy')}}</a>
            </li>
            <li>
                <a class="rounded-right module-orderform__buy-forms__button button-tab button-tab-sell"
                   data-toggle="pill"
                   href="#sellLimit"
                   role="tab"
                   aria-selected="false">{{__('Sell')}}</a>
            </li>
        </ul>
        <div class="row market-limit">
            <div class="tab-content w-100">
                <div class="tab-pane fade show active"
                     id="buyLimit"
                     role="tabpanel">
                    @include('futures._user_base_coin_balance')
                    <div class="card-body">
                        <form id="limit-buy-form">
                            <div class="form-group row">
                                <label for="buy-price"
                                       class="col-sm-3 col-form-label p-1 px-2">{{ __('Price') }}</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <input
                                                type="text"
                                                class="form-control text-left"
                                                v-model="limitBuyFormData.price"
                                                @input="onChangeProduceTotalHandler('limitBuyFormData')"
                                                name="price"
                                                id="limit-buy-price-element">
                                        <div class="input-group-append">
                                            <span class="input-group-text" v-text="pairDetail.baseCoin"></span>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="leverage" class="col-sm-12 col-form-label p-1 px-2">{{ __('Leverage:') }}
                                    <span
                                            v-text="limitBuyFormData.leverage"></span>x</label>
                                <div class="col-sm-12 mt-3">
                                    <div class="range">
                                        <input dir="ltr" @input="onChangeProduceLeverageHandler('limitBuyFormData')"
                                               v-model="limitBuyFormData.leverage" type="range" name="leverage" min="1"
                                               max="100" steps="1" value="1">
                                    </div>
                                    <ul class="range-labels">
                                        <li class="active selected">1x</li>
                                        <li>25x</li>
                                        <li>50x</li>
                                        <li>75x</li>
                                        <li>100x</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="buy-price"
                                       class="col-sm-3 col-form-label p-1 px-2">{{ __('Amount') }}</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <input type="text"
                                               class="form-control text-left"
                                               v-model="limitBuyFormData.amount"
                                               @input="onChangeProduceTotalHandler('limitBuyFormData')"
                                               name="amount"
                                               id="limit-buy-amount-element">
                                        <div class="input-group-append">
                                            <span class="input-group-text" v-text="pairDetail.tradeCoin"></span>
                                        </div>

                                    </div>
                                    <div class="mt-3 d-flex justify-content-between" role="group">
                                        <button
                                                type="button"
                                                class="rounded bg-primary lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                                @auth
                                                @click="onClickProduceAmountByPercentHandler('limitBuyFormData', 25, 'buy')"
                                                @endauth
                                        >
                                            {{ __('25%') }}
                                        </button>
                                        <button
                                                type="button"
                                                class="rounded bg-primary lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                                @auth
                                                @click="onClickProduceAmountByPercentHandler('limitBuyFormData', 50, 'buy')"
                                                @endauth
                                        >
                                            {{ __('50%') }}
                                        </button>
                                        <button
                                                type="button"
                                                class="rounded bg-primary lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                                @auth
                                                @click="onClickProduceAmountByPercentHandler('limitBuyFormData', 75, 'buy')"
                                                @endauth
                                        >
                                            {{ __('75%') }}
                                        </button>
                                        <button
                                                type="button"
                                                class="rounded bg-primary lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                                @auth
                                                @click="onClickProduceAmountByPercentHandler('limitBuyFormData', 100, 'buy')"
                                                @endauth
                                        >
                                            {{ __('100%') }}
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="buy-price"
                                       class="col-sm-3 col-form-label p-1 px-2">{{ __('Total') }}</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <input type="text"
                                               class="form-control text-left"
                                               v-model="limitBuyFormData.total"
                                               @input="onChangeProduceAmountHandler('limitBuyFormData')"
                                               ref="limitBuyFormData"
                                               name="total"
                                               id="limit-buy-total-element">
                                        <div class="input-group-append">
                                            <span class="input-group-text" v-text="pairDetail.baseCoin"></span>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            @guest
                                <div class="font-size-12 p-2 lf-toggle-border-card text-center">
                                    <a href="{{ route('login') }}"
                                       class="text-green">{{ __('Log In') }}</a> {{ __('or') }} <a
                                            href="{{ route('register.index') }}"
                                            class="text-green">{{ __('Register') }}</a> {{ __('to trade') }}
                                </div>
                            @endguest

                            @auth
                                <button type="submit"
                                        class="btn btn-success btn-block form-submission-button"
                                        @click="placeOrder('limit', 'buy', 'limitBuyForm')"
                                        :disabled="limitBuyFormData.placingOrder">
            <span v-if="limitBuyFormData.placingOrder">
                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                {{ __('Placing Order...') }}
            </span>
                                    <span v-else>
                {{ __('BUY/LONG') }} <span v-text="pairDetail.tradeCoin"></span>
            </span>
                                </button>
                            @endauth

                        </form>
                    </div>
                </div>
                <div class="tab-pane fade"
                     id="sellLimit"
                     role="tabpanel">
                    @include('futures._user_trade_coin_balance')
                    <div class="card-body">
                        <form id="limit-sell-form">
                            <div class="form-group row">
                                <label for="sell-price"
                                       class="col-sm-3 col-form-label p-1 px-2">{{ __('Price') }}</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <input
                                                type="text"
                                                class="form-control text-left"
                                                v-model="limitSellFormData.price"
                                                @input="onChangeProduceTotalHandler('limitSellFormData')"
                                                name="price"
                                                id="limit-sell-price-element">
                                        <div class="input-group-append">
                                            <span class="input-group-text" v-text="pairDetail.baseCoin"></span>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="leverage" class="col-sm-12 col-form-label p-1 px-2">{{ __('Leverage:') }}
                                    <span
                                            v-text="limitSellFormData.leverage"></span>x</label>
                                <div class="col-sm-12 mt-3">
                                    <div class="range">
                                        <input dir="ltr" @input="onChangeProduceLeverageHandler('limitSellFormData')"
                                               v-model="limitSellFormData.leverage" type="range" name="leverage" min="1"
                                               max="100" steps="1" value="1">
                                    </div>
                                    <ul class="range-labels">
                                        <li class="active selected">1x</li>
                                        <li>25x</li>
                                        <li>50x</li>
                                        <li>75x</li>
                                        <li>100x</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="sell-price"
                                       class="col-sm-3 col-form-label p-1 px-2">{{ __('Amount') }}</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <input type="text"
                                               class="form-control text-left"
                                               v-model="limitSellFormData.amount"
                                               @input="onChangeProduceTotalHandler('limitSellFormData')"
                                               name="amount"
                                               id="limit-sell-amount-element">
                                        <div class="input-group-append">
                                            <span class="input-group-text" v-text="pairDetail.tradeCoin"></span>
                                        </div>

                                    </div>
                                    <div class="mt-3 d-flex justify-content-between" role="group">
                                        <button
                                                type="button"
                                                class="rounded bg-primary lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                                @auth
                                                @click="onClickProduceAmountByPercentHandler('limitSellFormData', 25, 'sell')"
                                                @endauth
                                        >
                                            {{ __('25%') }}
                                        </button>
                                        <button
                                                type="button"
                                                class="rounded bg-primary lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                                @auth
                                                @click="onClickProduceAmountByPercentHandler('limitSellFormData', 50, 'sell')"
                                                @endauth
                                        >
                                            {{ __('50%') }}
                                        </button>
                                        <button
                                                type="button"
                                                class="rounded bg-primary lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                                @auth
                                                @click="onClickProduceAmountByPercentHandler('limitSellFormData', 75, 'sell')"
                                                @endauth
                                        >
                                            {{ __('75%') }}
                                        </button>
                                        <button
                                                type="button"
                                                class="rounded bg-primary lf-toggle-border-card lf-toggle-text-color lf-toggle-bg-input font-size-10 p-1 px-2"
                                                @auth
                                                @click="onClickProduceAmountByPercentHandler('limitSellFormData', 100, 'sell')"
                                                @endauth
                                        >
                                            {{ __('100%') }}
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="sell-price"
                                       class="col-sm-3 col-form-label p-1 px-2">{{ __('Total') }}</label>
                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <input type="text"
                                               class="form-control text-left"
                                               v-model="limitSellFormData.total"
                                               @input="onChangeProduceAmountHandler('limitSellFormData')"
                                               ref="limitSellFormData"
                                               name="total"
                                               id="limit-sell-total-element">
                                        <div class="input-group-append">
                                            <span class="input-group-text" v-text="pairDetail.baseCoin"></span>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            @guest
                                <div class="font-size-12 p-2 lf-toggle-border-card text-center">
                                    <a href="{{ route('login') }}"
                                       class="text-green">{{ __('Log In') }}</a> {{ __('or') }} <a
                                            href="{{ route('register.index') }}"
                                            class="text-green">{{ __('Register') }}</a> {{ __('to trade') }}
                                </div>
                            @endguest

                            @auth
                                <button type="submit"
                                        class="btn btn-danger btn-block form-submission-button"
                                        @click="placeOrder('limit', 'sell', 'limitSellForm')"
                                        :disabled="limitSellFormData.placingOrder">
            <span v-if="limitSellFormData.placingOrder">
                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                {{ __('Placing Order...') }}
            </span>
                                    <span v-else>
                {{ __('SELL/SHORT') }} <span v-text="pairDetail.tradeCoin"></span>
            </span>
                                </button>
                            @endauth

                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
