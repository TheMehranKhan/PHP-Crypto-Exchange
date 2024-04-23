<div id="livePrice" class="font-size-13">
    <section class="font-size-15">
        <div class="my-3">
            <div class="row">
                <div class="col-md-12 d-md-flex border border-dark">
                    <div class="owl-carousel">
                        <div v-for="item in tickers" class="pl-3 pr-3 pt-3 d-flex justify-content-between border-dark lf-border-md-right lf-border-sm-bottom">
                            <div>
                                <p class="text-white font-18 font-weight-bold" v-text="item.symbol"></p>
                                <p class="font-18 font-weight-bold" v-text="item.last_price"></p>
                                <p :class="['font-15', item.change > 0 ? 'text-success' : 'text-danger']" v-text="item.change+' %'"></p>
                            </div>
                            <div class="d-flex align-items-center">
                                <img height="30"
                                     src="https://cdn.arzdigital.com/uploads/assets/coins/charts/tether-chart.png?t=1620570605">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="tm-feature section-padding bg-black">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-7">
                    @component('regular_pages.components.section_title', ['align' => 'center'])
                        {{ __("Live Price") }}
                        @slot('subtite')
                            {{ __('Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet blanditiis doloremque dolores doloribus esse iusto laborum mollitia porro rem sapiente') }}
                        @endslot
                    @endcomponent
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-12 col-lg-12">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr class="font-size-15">
                                <th>{{__('Market')}}</th>
                                <th>{{__('Price')}}</th>
                                <th>{{__('24H Volume')}}</th>
                                <th>{{__('24H Highest')}}</th>
                                <th>{{__('24H lowest')}}</th>
                                <th>{{__('24H change')}}</th>
                                <th>{{__('BUY/SELL')}}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="font-size-14" v-for="item in tickers" :id="item.symbol">
                                <td v-text="item.symbol"></td>
                                <td v-text="item.last_price"></td>
                                <td v-text="item.tradeVolume"></td>
                                <td v-text="item.high24hr"></td>
                                <td v-text="item.low24hr"></td>
                                <td v-text="item.change"></td>
                                <td>
                                    <a :href=`/exchange/${item.symbol}` class="btn btn-sm btn-warning">{{__('BUY/SELL')}}</a>
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
@section('extra-script')
    <script>
        "use strict";

    </script>
@endsection