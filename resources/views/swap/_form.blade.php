<style>
    .text-primary {
        color: #fdc312;
    }

    .section-padding-custom {
        padding: 100px 0px 150px !important;
    }

    .input-box {
        background-color: transparent !important;
        border: 1px solid #343c49 !important;
        border-radius: 6px;
        font-size: 16px;
        direction: ltr;
    }

    .input-box button {
        padding: 12px 120px 12px 12px;
        outline: none;
        border: none;
        border-radius: 6px 0px 0px 6px;
    }

    .input-box input {
        background-color: transparent;
        padding: 12px;
        direction: rtl;
    }

    .input-box .dropdown-menu {
        width: 250px;
        padding-block: 0px;
        transform: none !important;
        box-shadow: 0 0px 9px #343c49 !important
    }

    .coins-box1 {
        top: 82px !important;
    }

    .coins-box2 {
        top: 98px !important;
    }

    .list-coins {
        overflow-y: auto !important;
        height: 200px !important;
    }

    .list-coins li {
        cursor: pointer;
        color: #f2f2f2 !important;
        transition: 0.2s;
    }

    .list-coins li:hover {
        color: #212121 !important;
        background-color: #fdc312 !important;
    }

    .coin-search-box {
        width: 230px;
        margin: 10px 10px;
        padding: 4px;
        border: 1px solid #fdc312;
        border-radius: 6px;
        direction: ltr !important;
    }

    .link-box {
        background-color: #343c49;
        padding: 16px;
        text-align: center;
        border-radius: 6px;
    }

    .link-box a {
        transition: 0.3s;
        color: #fdc312 !important;
    }

    .link-box a:hover {
        padding-inline: 4px;
        color: #fdc312 !important;
    }

    .coin-icon {
        width: 30px !important;
        height: auto;
    }

    .input-label,
    html[dir=rtl] .user-balance {
        float: left;
    }

    html[dir=rtl] .input-label,
    .user-balance {
        float: right;
    }
</style>

<div id="swapForm" class="font-size-13">
    <section class="price-grid section-padding-custom" data-scroll-index="1">
        <div class="container">

            <!-- components title start -->
            <div class="components-title mb-5 pb-3">
                <h2 class="text-center">{{ __('Quick Buy') }}</h2>
            </div>
            <!-- components title end -->

            <div class="lf-no-header-inner">
                <div class="col-lg-4 col-md-12 m-auto">

                    <div class="input-group mb-md-4 mb-2">

                        <div class="w-full mb-1 text-center">
                            <span class="font-size-15 input-label">{{__('You send:')}}</span>
                            <a class="font-size-15 pl-1 user-balance" @click="injectBalance" style="cursor: pointer;">
                                <i class="fa fa-credit-card"></i>
                                <span v-text="balance" class="text-primary"></span>
                                <span v-text="basePair.symbol"></span>
                            </a>
                        </div>
                        <div class="w-full d-flex input-box">
                            <button type="button" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <img class="coin-icon mr-2" :src=`/storage/images/coin-icons/${basePair.icon}`
                                     :alt="'?'"/>
                                @{{basePair.symbol}}
                            </button>
                            <div class="dropdown-menu coins-box1">
                                <input v-model="firstCoinSearch" type="text" placeholder="search..."
                                       class="coin-search-box">
                                <ul class="list-group list-coins">
                                    <li v-for="coin in firstCoinList" key="coin.symbol"
                                        @click="(basePair=coin),changeCoin('base')"
                                        class="list-group-item list-group-item-action">
                                        <img class="coin-icon mr-2" :src=`/storage/images/coin-icons/${coin.icon}`
                                             :alt="'?'"/>
                                        @{{coin.symbol}}
                                    </li>
                                </ul>
                                <!-- <select v-model="basePair" @change="changeCoin('base')" class="form-control lf-filter-sort-by">
                                    <option v-for="coin in coins" :value="coin" key="coin.symbol">
                                        @{{coin.symbol}}
                                    </option>
                                </select> -->
                            </div>
                            <input placeholder="0.00" type="text" v-model="form.base_amount"
                                   @keypress="(e) => handleInput(e)" @paste.prevent @drop.prevent class="w-full">
                        </div>
                        {{-- <span class="invalid-feedback" data-name="base_amount">{{ $errors->first('base_amount') }}</span>--}}
                    </div>
                    <div class="w-full text-center">
                        <img src="/images/swap.png" width="42" class="m-auto cursor-pointer exchange-coins"
                             @click="changeType"/>
                    </div>
                    <div class="input-group mb-md-3 mb-2">
                        <div class="w-full mb-1 p-2 text-center">
                            <span class="font-size-15 input-label">{{__('You get:')}}</span>
                        </div>
                        <div class="w-full d-flex input-box">
                            <button type="button" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <img class="coin-icon mr-2" :src=`/storage/images/coin-icons/${quotePair.icon}`
                                     :alt="'?'"/>
                                @{{quotePair.symbol}}
                            </button>
                            <div class="dropdown-menu coins-box2">
                                <input v-model="secondCoinSearch" type="text" placeholder="search..."
                                       class="coin-search-box">
                                <ul class="list-group list-coins">
                                    <li v-for="coin in secondCoinList" key="coin.symbol"
                                        @click="(quotePair=coin),changeCoin()"
                                        class="list-group-item list-group-item-action">
                                        <img class="coin-icon mr-2" :src=`/storage/images/coin-icons/${coin.icon}`
                                             :alt="'?'"/>
                                        @{{coin.symbol}}
                                    </li>
                                </ul>
                            </div>
                            <input @keypress="(e) => handleInput(e)" @paste.prevent @drop.prevent type="text"
                                   class="w-full" v-model="form.quote_amount" placeholder="0.00">
                            <!-- <div class="lf-select lf-flex-1">
                                <select v-model="quotePair" @change="changeCoin()" class="form-control lf-filter-sort-by">
                                    <option v-for="coin in coins" :value="coin" key="coin.symbol" v-text="coin.symbol"></option>
                                </select>
                            </div> -->
                        </div>
                        {{-- <span class="invalid-feedback" data-name="username">{{ $errors->first('username') }}</span>--}}
                    </div>
                    <div class="w-full mb-1 p-2">
                        <span class="text-danger" v-if="marketError">{{__('Pair is not available')}}</span>
                        <br v-if="marketError">
                        <span class="font-size-15" v-if="!marketError">{{__('Exchange Rate:')}} 1 ~ @{{ exchangeRate }} @{{quotePair.symbol}}</span>
                        <span class="font-size-15" v-else>{{__('Exchange Rate:')}} @{{ exchangeRate }}</span>
                    </div>

                    <div class="form-group mt-3">
                        @guest
                            <div class="link-box">
                                <a href="{{ route('login') }}">{{ __('Log In') }}</a> {{ __('or') }}
                                <a href="{{ route('register.index') }}">{{ __('Register') }}</a> {{ __('to exchange') }}
                            </div>
                        @endguest

                        @auth
                            <button type="submit" @click="submitExchange()" :disabled="isLoading"
                                    class="btn btn-block btn-primary">
                                <span v-if="isLoading">
                                    <span class="spinner-border spinner-border-sm" role="status"
                                          aria-hidden="true"></span>
                                    {{ __('Placing Order...') }}
                                </span>
                                <span v-else>
                                    {{__('Submit')}}
                                </span>
                                {{-- <span>--}}
                                {{-- <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>--}}
                                {{-- {{ __('Placing Order...') }}--}}
                                {{-- </span>--}}
                                {{-- <span >--}}
                                {{-- {{ __('SELL') }} <span v-text="pairDetail.tradeCoin"></span>--}}
                                {{-- </span>--}}
                            </button>
                        @endauth
                    </div>
                </div>
            </div>

        </div>
    </section>
</div>