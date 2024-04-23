<div id="livePrice" class="font-size-13">
    <section class="tm-feature section-padding pt-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-7">
                    @component('regular_pages.components.section_title', ['align' => 'center'])
                        {{ __("Markets") }}
                        @slot('subtite')
                            {{ __('Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet blanditiis doloremque dolores doloribus esse iusto laborum mollitia porro rem sapiente') }}
                        @endslot
                    @endcomponent
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-12 col-lg-12">
                    <div class="table-responsive">
                        <table id="datatable" class="table table-hover table-striped">
                            <thead>
                            <tr class="font-size-15">
                                <th class="all text-center">{{__('Market')}}</th>
                                <th class="all text-center">{{__('Price')}}</th>
                                <th class="min-phone-l text-center">{{__('24H Change')}}</th>
                                <th class="min-phone-l text-center">{{__('24h High')}}</th>
                                <th class="min-phone-l text-center">{{__('24h Low')}}</th>
                                <th class="min-phone-l text-center">{{__('24h Volume')}}</th>
                                <th class="min-phone-l text-center">{{__('24h Volume')}}</th>
                                <th class="all no-sort text-center">{{__('BUY/SELL')}}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-if="loading" class="w-full" style="font-size: 20px;text-align:center">
                                <td colspan="8" class="text-center">
                                    <div class="d-flex align-items-center justify-content-center">
                                            <span>
                                                loading...
                                            </span>
                                        <div class="spinner-grow" style="width: 3rem; height: 3rem;" role="status">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="font-size-14" v-for="item in tickers" :id="item.symbol">
                                <td class="text-center">
                                    <div class="d-flex">
                                        <img class="p-1 img-market" :src="item.trade_coin_icon" height="40" width="40" />
                                        <div class="list-boy__named">
                                            <span v-text="item.trade_coin" class="d-block color-dark"></span>
                                            <span v-text="item.base_coin" class="d-block color-primary"></span>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-center">@{{Currency(item.latest_price)}}</td>
                                <td :class="[item.change > 0 ? 'text-success' : 'text-danger']" class="text-center"> @{{item.change}} </td>
                                <td class="text-center text-success"> <span v-if="!!item.high_price"> @{{item.high_price}} </span> <span v-else>-</span> </td>
                                <td class="text-center text-danger"><span v-if="!!item.low_price"> @{{Currency(item.low_price)}} </span> <span v-else>-</span></td>
                                <td class="text-center"><span v-if="!!item.base_coin_volume"> @{{item.base_coin_volume}} </span> <span v-else>-</span></td>
                                <td class="text-center"><span v-if="!!item.trade_coin_volume"> @{{Currency(item.trade_coin_volume)}} </span> <span v-else>-</span></td>
                                <td class="text-center">
                                    <a :href=`${item.marketLink}` class="btn btn-sm btn-info">{{__('BUY/SELL')}}</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>