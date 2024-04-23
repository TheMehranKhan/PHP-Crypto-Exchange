<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />

    <!-- PrimeVue -->
    <link href="https://unpkg.com/primevue@^3/resources/themes/arya-orange/theme.css" rel="stylesheet" />
    <link href="https://unpkg.com/primevue@^3/resources/primevue.min.css" rel="stylesheet" />
    <link href="https://unpkg.com/primeflex@^3/primeflex.min.css" rel="stylesheet" />
    <link href="https://unpkg.com/primeicons/primeicons.css" rel="stylesheet" />



    <!-- Dependencies -->
    <script src="{{ asset('js/websocket/vuenext.js') }}"></script>
    <script src="{{ asset('js/websocket/axios.js') }}"></script>
    <script src="{{ asset('js/websocket/core.min.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('css/websocket/bootstrap.min.css') }}" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ asset('css/websocket/styles.css') }}">
    <link rel="stylesheet" href="{{ asset('css/websocket/customPrime.css') }}">
    <link rel="stylesheet" href="{{ asset('css/websocket/components.css') }}">
    <script type="text/javascript" src="{{ asset('js/websocket/tv.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/websocket/reconnect.js') }}"></script>

    <!-- prime components -->
    <script src="https://unpkg.com/primevue@^3/overlaypanel/overlaypanel.min.js"></script>
    <script src="https://unpkg.com/primevue@^3/skeleton/skeleton.min.js"></script>
    <script src="https://unpkg.com/primevue@^3/checkbox/checkbox.min.js"></script>
    <script src="https://unpkg.com/primevue@^3/datatable/datatable.min.js"></script>
    <script src="https://unpkg.com/primevue@^3/column/column.min.js"></script>
    <script src="https://unpkg.com/primevue@^3/progressspinner/progressspinner.min.js"></script>
    <script src="https://unpkg.com/primevue@^3/sidebar/sidebar.min.js"></script>
    <script src="https://unpkg.com/primevue@^3/accordion/accordion.min.js"></script>
    <script src="https://unpkg.com/primevue@^3/accordiontab/accordiontab.min.js"></script>

    <script src="https://unpkg.com/primevue@^3/toast/toast.min.js"></script>
    <script src="https://unpkg.com/primevue@^3/toastservice/toastservice.min.js"></script>

    <!-- deph Chart -->
    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/locales/de_DE.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/geodata/germanyLow.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/fonts/notosans-sc.js"></script>
    <link rel="icon" href="{{ get_favicon() }}">
    <style>
        .lf-side-nav .lf-side-nav-wrapper {
            padding-top: 90px;
            left: 0;
            top: 0;
            height: 100%;
            position: absolute;
            width: 100%;
            background: #343c49;
            z-index: 1;
        }

        .lf-side-nav .lf-side-nav-wrapper nav ul li a {
            display: block;
            color: #fff;
            padding: 10px 20px 10px 10px;
            position: relative;
            font-size: 12px;
        }

        .v-list {
            background-color: #1e1e1e !important;
        }

        .v-list-item {
            color: white;
        }
    </style>

    <!-- slider -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vue-slider-component@latest/theme/default.css">
    <script src="{{ asset('js/websocket/vue-slider.js') }}"></script>

    {{-- light-weightCharts --}}
    <script src="https://unpkg.com/lightweight-charts/dist/lightweight-charts.standalone.production.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vuetify@3.1.6/dist/vuetify.min.css">
    <script src="https://cdn.jsdelivr.net/npm/vuetify@3.1.6/dist/vuetify.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/7.1.96/css/materialdesignicons.min.css">
</head>

<body>

{{-- <span class="font-size-16 font-weight-bold">{{ __('Market Trade History') }}</span> --}}
@guest
    <label id="auth" style="display: none">no</label>
@endguest
@auth
    <label id="userid" style="display: none"> {{ auth()->id() }} </label>
    <label id="auth" style="display: none">ok</label>
@endauth



<div id="app">
    <p-toast></p-toast>
    <p-sidebar :show-close-icon="false" v-model:visible="sidebar" :base-z-index="10000" position="right">
        <div class="child gap-1">
            {{-- <div class="controller row between a-center pr-3">--}}
            <i class="pi pi-times cp" @click="sidebar = false"></i>
            <div class="text-center lf-side-nav-logo d-table w-100">
                <a href="{{route('home')}}" class="align-middle px-2 pt-2 d-table-cell lf-logo{{is_light_mode(settings('company_logo_light')? '': ' lf-logo-inversed')}}">
                    <!-- lf-logo-inversed -->
                    <img src="{{ company_logo() }}" class="img-fluid" alt="">
                </a>
            </div>
            {{-- <!-- {{getnew_nav('side-nav', 'side_nav')}} -->--}}
            <div class="lf-side-nav-wrapper">
                <nav id="lf-side-nav">

                </nav>
                <!-- <v-list v-model:opened="open">
                    <v-list-item prepend-icon="mdi-home" title="Home"></v-list-item>

                    <v-list-group value="Users">
                        <template v-slot:activator="{ props }">
                            <v-list-item v-bind="props" prepend-icon="mdi-account-circle" title="Users"></v-list-item>
                        </template>

                        <v-list-group value="Admin">
                            <template v-slot:activator="{ props }">
                                <v-list-item v-bind="props" title="Admin"></v-list-item>
                            </template>

                            <v-list-item v-for="([title, icon], i) in admins" :key="i" :title="title" :prepend-icon="icon" :value="title"></v-list-item>
                        </v-list-group>

                        <v-list-group value="Actions">
                            <template v-slot:activator="{ props }">
                                <v-list-item v-bind="props" title="Actions"></v-list-item>
                            </template>

                            <v-list-item v-for="([title, icon], i) in cruds" :key="i" :value="title" :title="title" :prepend-icon="icon"></v-list-item>
                        </v-list-group>
                    </v-list-group>
                </v-list> -->
            </div>
        </div>

    </p-sidebar>

    <div class="main-trade-screen-controller">
        <div class="trade-topBar-component">
            <img src="{{ asset('images/websocket/change-coin.png') }}" width="25" class="cp" @click="toggle">
            <!-- <SpotCoinsComponents  /> -->
            <p-overlaypanel ref="op" appendTo="body" :showCloseIcon="false" id="overlay_panel" style="width: 376px;height: 680px;overflow-y: hidden;">
                <div class="spot-coins-controller">
                        <span class="p-input-icon-left">
                            <i class="pi pi-search"></i>
                            <p-inputtext type="text" v-model="filters['global'].value" placeholder="Search" class="w-100"></p-inputtext>
                        </span>
                    {{-- <div class="tab-controller">
                            <div v-for="(tab , index) in SpotCoinsTabs" :key="index" class="tab" :class="SpotCoinsTabSelected == index && 'active'" @click="SpotCoinsTabSelected = index">
                                <span>@{{ tab }}</span>
                </div>
        </div>
        <div class="bg-line-h"></div>
        <div class="controller gap-1 mt-2">
            <div class=" px-2 normal-radius lh-1 cp p-1 gray" v-for="(tab,index) in SpotCoinsSubTabs" :key="index" @click="SpotCoinsSubTabSelected = index" :class="SpotCoinsSubTabSelected == index && 'bg-gold2'">
                <span class="f-13">@{{tab}}</span>
            </div>
        </div> --}}
                    <template v-if="wsAssets.marketList.length > 0">
                        <p-datatable @row-select="onRowSelect" v-model:filters="filters" v-model:selection="selectedCoin" selection-mode="single" data-key="trade_coin" :global-filter-fields="['trade_coin' , 'trade_pair_symbol']" :row-hover="true" :value="wsAssets.marketList" :loading="wsAssets.loading" scrollable scroll-height="500px" :virtual-scroller-options="{ itemSize: 46,delay: 200, numToleratedItems: 10 }">
                            <p-column field="asset" header="Coins">
                                <template #body="data">
                                    <div class="controller gap-05 align-center">
                                        <img class="default-coin" :src="data.data?.trade_coin_icon ? data.data.trade_coin_icon : data.data?.base_coin_icon" :alt="'?'" />
                                        <span class="f-14">@{{ data.data?.trade_coin }}</span>
                                    </div>
                                </template>
                            </p-column>
                            <p-column field="asset" header="Price">
                                <template #body="data">
                                    <span>@{{Currency(data.data.latest_price)}}</span>
                                </template>
                            </p-column>
                            <p-column field="asset" header="24 Change">
                                <template #body="data">
                                    <span :class="Number(data.data.change) > 0 ? 'green':'red'">@{{ data.data.change }}%</span>
                                </template>
                            </p-column>
                        </p-datatable>
                    </template>
                    <p-progressspinner v-else aria-label="Basic ProgressSpinner"></p-progressspinner>
                </div>
            </p-overlaypanel>
            <!-- <SpotCoinsComponents  /> -->
            <img class="default-coin" :src="selected?.trade_coin_icon ? selected?.trade_coin_icon : selected?.base_coin_icon" :alt="'?'" />
            <div class="child ">
                <span class="f-18">@{{selected?.trade_coin ?? getOldSymbol}}/USDT</span>
                <div class="controller flex-row">
                    <span class="f-14 gray">@{{selected?.trade_coin_name ?? getOldSymbol}}</span>

                </div>
            </div>
            <div class="mx-3"></div>
            <div class="controller gap-1 align-center">
                <template v-if="selected?.trade_coin">
                    <div class="child gap-01">
                        <span class="f-17 green fw-b">@{{ Currency(selected?.latest_price) }}</span>
                        <span class="f-14">=@{{ Currency(selected?.latest_price) }} USD</span>
                    </div>
                    <div class="child gap-01 ">
                        <span class="fw-b gray f-13">24H Change</span>
                        <span class="f-14 fw-b " :class="(Number(selected?.change) > 0 ) ? 'green':'red'">@{{Currency(selected?.change)}}%</span>
                    </div>
                    <div class="child gap-01 ">
                        <span class="fw-b gray f-13">30 D Change</span>
                        <span class="f-14 fw-b " v-if="selected?.change_rate_30d" :class="(Number(selected?.change_rate_30d) > 0 ) ? 'green':'red'">@{{Currency(selected?.change_rate_30d)}}%</span>
                        <span class="f-14" v-else>---</span>
                    </div>
                    <div class="child gap-01">
                        <span class="fw-b gray f-13">Circulation</span>
                        <span class="f-13 fw-n" v-if="selected?.circulation">@{{Currency(selected?.circulation)}}</span>
                        <span class="f-14" v-else>---</span>
                    </div>
                    <div class="child gap-01">
                        <span class="fw-b gray f-13">Circulation USD Rank</span>
                        <span class="f-13 fw-n" v-if="selected?.circulation_usd_rank">@{{Currency(selected?.circulation_usd_rank)}}</span>
                        <span class="f-14" v-else>---</span>
                    </div>
                    <div class="child gap-01">
                        <span class="fw-b gray f-13">volume</span>
                        <span class="f-13 fw-n" v-if="selected?.volume_usd">@{{Currency(selected?.volume_usd)}}</span>
                        <span class="f-14" v-else>---</span>
                    </div>
                </template>
                <div class="child gap-01" v-else v-for="item in 7" :key="item">
                    <p-skeleton width="86px" height="24px"></p-skeleton>
                    <p-skeleton width="86px" height="24px"></p-skeleton>
                </div>
            </div>
            <div class="controller align-center ml-auto">
                <p-button label="Trading Bot" icon="pi pi-bolt f-16" class="p-button-text p-button-plain f-14 light-text px-1"></p-button>
                <a href="{{url('/futures')}}"><p-button label="Future" href="#" icon="pi pi-chart-bar f-16" class="p-button-text p-button-plain f-14 light-text px-1"></p-button></a>
                <p-button label="User Guide" icon="pi pi-file f-16" class="p-button-text p-button-plain f-14 light-text px-1"></p-button>
                <p-button icon="pi pi-align-justify f-16" @click="sidebar = true" class="p-button-text p-button-plain f-14 light-text px-1"></p-button>
            </div>
        </div>
        <div class="row mx-0 w-100 mt-1 ">
            <div class="child px-1 col-lg-10">
                <div class="row mx-0 p-0 w-100">
                    <div class="col-lg-9 px-0">
                        <div class="trade-chart-controller">
                            <div class="controller align-center between w-100 head">
                                <span class="fw-b f-16">Chart</span>
                                <div class="tab-controller">
                                    <div v-for="(tab , index) in  ChartTabs.filter((item , index)=> {
                                        if (!(!tvIsEnabeld && index == 0)) return item;

                                    })" :key="index" class="tab" :class="chartSelectedTab == index && 'active'" @click="chartSelectedTab = index">
                                        <span>@{{ tab }}</span>
                                    </div>
                                </div>
                            </div>
                            <div class="chart-controller ">
                                <div class="tradingview-widget-container card">
                                    <div class="graph-loader">
                                    <!-- @if (settings('live_chart'))
                                    @endif -->


                                        <template v-if="chartSelectedTab == (!tvIsEnabeld ? 0:1) ">
                                            <div class="chart-bar-controller">
                                                <span class="fw-b f-14">@{{selected?.trade_coin ? `${selected?.trade_coin}USDT`: getOldSymbol+'USDT'}}</span>
                                                <div class="v-line"></div>
                                                <span class="f-14 cp" @click="chartTime = 1" :class="chartTime == 1 ? 'gold':''">1m</span>
                                                <span class="f-14 cp" @click="chartTime = 2" :class="chartTime == 2 ? 'gold':''">30m</span>
                                                <span class="f-14 cp" @click="chartTime = 3" :class="chartTime == 3 ? 'gold':''">1h</span>
                                                <span class="f-14 cp" @click="chartTime = 4" :class="chartTime == 4 ? 'gold':''">D</span>
                                                <div class="v-line"></div>
                                                <i class="cp pi pi-chart-bar " @click="chartType = 1" :class="chartType == 1 ? 'gold':''"></i>
                                                <i class="cp pi pi-chart-line" @click="chartType = 2" :class="chartType == 2 ? 'gold':''"></i>
                                            </div>
                                        </template>
                                        <div class="text-center" style="border: 1px solid #252834 !important;">
                                            <div class="lw-chart w-100 " style="overflow: hidden" :class="(chartSelectedTab == (!tvIsEnabeld ? 0:1) && showCandelChart) ? 'h-auto':'h-0'" ref="chartContainer" v-if="showCandelChart"></div>
                                            <p-progressspinner v-else class="mx-auto my-5 d-block" aria-label="Basic ProgressSpinner"></p-progressspinner>
                                        </div>
                                        <div v-show="tvIsEnabeld && chartSelectedTab == 0 && showCandelChart" id="tv_chart_container" class="h-100 "></div>
                                    </div>
                                </div>
                                <!-- deph chart -->
                                <div class="w-100 h-100" ref="chartdiv" v-show="chartSelectedTab ==  (!tvIsEnabeld ? 1:2)"></div>
                                <!-- deph chart -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 pl-1 pr-0">
                        <div class="order-book-screen-controller">
                            <div class="tab-controller">
                                <div v-for="(tab , index) in orderBooksTabs" :key="index" class="tab" :class="orderBookSelectedTab == index && 'active'" @click="orderBookSelectedTab = index">
                                    <span>@{{ tab }}</span>
                                </div>
                            </div>
                            <div class="secondary-line-h mb-1"></div>
                            <template v-if="orderBookSelectedTab == 0">
                                <div class="controller align-center between w-100 pr-2">
                                    <div class="controller gap-1 pl-2">
                                        <div @click="sortType = 1" class="sort-item" :class="sortType == 1 && 'active'">
                                            <img src="{{ asset('images/websocket/sort-all.png') }}">
                                        </div>
                                        <div @click="sortType = 2" class="sort-item" :class="sortType == 2 && 'active'">
                                            <img src="{{ asset('images/websocket/sort-buy.png') }}">
                                        </div>


                                        <div @click="sortType = 3" class="sort-item" :class="sortType == 3 && 'active'">
                                            <img src="{{ asset('images/websocket/sort-sell.png') }}">
                                        </div>
                                    </div>
                                </div>
                                <div class="order-book-controller">
                                    <div class="controller w-100 between px-2">
                                        <span class="gray">Price(USDT)</span>
                                        <span class="gray">Amount(@{{selected?.trade_coin ?? getOldSymbol}})</span>
                                        <span class="gray">Total(@{{selected?.trade_coin ?? getOldSymbol}})</span>
                                    </div>

                                    <template v-if="(sortType == 1 || sortType == 3)">
                                        <div v-if="!!orderBooks && !!orderBooks?.ask" v-for="ask in orderBooks?.ask.slice(0 , (sortType == 1 ? 7:14))" :key="ask[0]" class="order-line sell cp" @click="()=>{ orderPrice = ask[0]; calc();}">
                                            <template v-if="!!ask[0]">
                                                <div class="line" :style="{width:Math.round(Number(ask[2]))+'%'}"></div>
                                                <span class="flex-2 j-start ">@{{ask[0] ? Currency(ask[0]) : ''}}</span>
                                            <span class="flex-2 red fw-b">
                                                @{{ask[1] ? Currency(ask[1]) : ''}}
                                            </span>
                                            <span class="flex-1 j-end">@{{ask[3] ? Currency(ask[3]) : ''}}</span>
                                        </template>
                                    </div>
                                    <p-skeleton v-else v-for="item in 5" :key="item" width="100%" height="29px"></p-skeleton>
                                </template>
                                <div class="card card-bg-2  p-2 w-100 controller flex-row align-center j-start">

                                    <template v-if="averagePrice">
                                        <span class="f-18 fw-b" :class="Number(averagePrice) > 0 ? 'green':'red'">
                                            <i class="pi" :class="Number(averagePrice) > 0 ? 'pi-arrow-up':'pi-arrow-down'"></i>
                                            @{{ Currency(averagePrice ?? 0) }}
                                        </span>
                                    </template>
                                    <p-skeleton v-else width="100px" height="29px"></p-skeleton>
                                    <template v-if="averagePrice">
                                        <span class="gray f-14">
                                            = @{{ Currency(averagePrice ?? 0) }} USD
                                        </span>
                                    </template>
                                    <p-skeleton v-else width="100px" height="29px"></p-skeleton>
                                </div>
                                <template v-if="!!orderBooks && !!orderBooks?.bid">
                                    <template v-if="(sortType == 1 || sortType == 2)">
                                        <div v-for="bid in orderBooks?.bid.slice((sortType == 1 ? orderBooks?.bid?.length == 20 ? 13 : 0 :  orderBooks?.bid?.length == 20 ? 6 : 0))" :key="bid[0]" class="order-line buy cp" @click="()=> {orderPrice = bid[0]; calc();}">
                                            <template v-if="!!bid[0]">
                                                <div class="line" :style="{width:Math.round(Number(bid[2]))+'%'}"></div>

                                                <span class="flex-2 j-start ">@{{Currency(bid[0])}}</span>
                                                <span class="flex-2 green fw-b">
                                                    @{{Currency(bid[1])}}
                                                </span>
                                                <span class="flex-1 j-end">@{{Currency(bid[3])}}</span>
                                            </template>
                                        </div>
                                    </template>
                                </template>
                                <p-skeleton v-else v-for="item in 5" :key="item" width="100%" height="29px"></p-skeleton>
                            </div>
                        </template>
                        <div class="order-book-controller " style="height: 574px !important; height: 574px !important" v-else>
                            <div class="controller w-100 between px-2">
                                <span class="gray">Price(USDT)</span>
                                <span class="gray">Amount (@{{selected?.trade_coin ?? getOldSymbol}})</span>
                            </div>

                            <div v-if="!!recountTrade " v-for="(item , index) in recountTrade" :key="index" class="order-line cp">
                                <span class="flex-2 j-start ">@{{ Currency(item?.price) }}</span>
                                <span class="flex-2 j-end fw-b" :class="item.order_type == 'buy' ? 'green':'red'">
                                    @{{ Currency(item?.amount) }}
                                </span>
                            </div>
                            <div class="child mt-3 gap-1" v-if="recountTrade.length == 0">
                                <img src="{{ asset('images/websocket/dark-empty.png') }}" width="150" class="mx-auto">
                                <span class="text-center w-100 d-block gray p-3 f-17 fw-b">Trade Not Founded !</span>
                            </div>
                            <p-skeleton v-else v-for="item in 5" :key="item" width="100%" height="29px"></p-skeleton>
                        </div>
                    </div>
                </div>
            </div>

            <!-- <OrderHistoryComponent /> -->
            <div class="history-screen-controller">
                <div class="controller w-100 between align-center">
                    <div class="tab-controller">
                        <div v-for="(tab , index) in historyTabs" :key="index" class="tab" :class="historySelectedTab == index && 'active'" @click="historySelectedTab = index">
                            <span>@{{ tab }}</span>
                        </div>
                    </div>
                    <div class="controller both-center flex-row">
                        <p-checkbox inputId="showAll" v-model="showAll" :binary="true"></p-checkbox>
                        <label for="showAll" class="gray mb-0">Show all trading pairs</label>
                    </div>
                </div>
                <div class="secondary-line-h"></div>
                <div class="controller gap-1 mt-2">
                    <div class=" px-2 normal-radius lh-1 cp p-1 gray" v-for="(tab,index) in historySubTabs" :key="index" @click="selectedHistorySubTab = index" :class="selectedHistorySubTab == index && 'bg-gold2'">
                        <span class="f-13">@{{tab}}</span>
                    </div>
                </div>
                <div class="mt-3 w-100">
                    <p-datatable :value="historySelectedTab == 0 ? (openOrders.filter((item)=> {
                                if (selectedHistorySubTab == 0 && !item.stop_limit) return true;
                                else if (selectedHistorySubTab == 1 && item.stop_limit) return true;
                                else return false;
                            })): history" :row="10" :paginate="true" responsiveLayout="scroll">
                        <template #empty>
                            <div class="empty-table-component-controller  both-center gray">
                                @guest

                                <span>Please </span>
                                <a href="{{ route('register.index') }}"><span class="gold">Register</span></a>
                                <span>Or</span>
                                <a href="{{ route('login') }}"><span class="gold">Sign In</span></a>

                                @endguest
                                @auth
                                <span>Not Found</span>
                                @endauth

                            </div>
                        </template>
                        <p-column field="name" header="symbol">
                            <template #body="data">
                                <div class="controller gap-05 align-center" v-if="historySelectedTab == 1">
                                    <img class="default-coin" :src="selected?.trade_coin_icon" :alt="'?'" />
                                    <span> @{{ selected?.trade_coin }} </span>
                                </div>
                                <span v-else> @{{ data.data?.trade_coin }} </span>
                            </template>
                        </p-column>

                        <p-column field="price" header="Price">
                            <template #body="data">
                                <span> @{{ Currency(data.data?.price) }} </span>
                            </template>
                        </p-column>

                        <p-column field="amount" header="Amount">
                            <template #body="data">
                                <span> @{{ Currency(data.data?.amount) }} </span>
                            </template>
                        </p-column>
                        <template v-if="historySelectedTab == 0">
                            <p-column field="exchanged" header="exchanged"></p-column>
                            <p-column field="open_amount" header="Open Amount">
                                <template #body="data">
                                    <span> @{{ Currency(data.data?.open_amount) }} </span>
                                </template>
                            </p-column>
                        </template>

                        <p-column field="total" header="Total">
                            <template #body="data">
                                <span> @{{ Currency(data.data?.total) }} </span>
                            </template>
                        </p-column>
                        <p-column field="order_type" header="order Type">
                            <template #body="data">
                                <span :class="data.data?.order_type == 'buy' ? 'green':'red'"> @{{ (data.data?.order_type) }} </span>
                            </template>
                        </p-column>

                        <template>
                            <p-column field="date" header="Date">
                                <template #body="data">
                                    <span> @{{ (data.data?.date) }} </span>
                                </template>
                            </p-column>

                        </template>
                        <template v-if="historySelectedTab == 0">
                            <p-column field="date" header="Cancle Order">
                                <template #body="data">
                                    <p-button label="Cancle" class="bg-red" @click="CancleOrder(data.data.order_id)" :loading="loading" />
                                </template>
                            </p-column>

                        </template>

                    </p-datatable>
                </div>
            </div>

            <!-- <OrderHistoryComponent /> -->
        </div>
        <div class="col-lg-2 px-0">
            <!-- <TradeSpothistoryComponent /> -->

            <div class="trade-spot-form-controller">
                <div class="controller w-100 between align-center">
                    <span class="f-16 fw-b">Spot</span>
                    <div class="controller a-center gap-05">
                        <i class="f-15 cp pi pi-ellipsis-v" style="align-self: center" @click="toggleMenu" aria-haspopup="true" aria-controls="overlay_menu"></i>
                        <p-menu id="overlay_menu" ref="menu" :model="moreItems" :popup="true"></p-menu>
                        <div class="profile-controller cp">
                            <i class="f-15 pi pi-user" href="https://dev.codemen.me/profile"></i>
                        </div>
                    </div>
                </div>
                <div class="controller px-2 flex-row trade-switch-btn">
                    <div class="flex-1">
                        <p-button @click="()=> {
                                    isBuy = true;
                                    clearForm();
                                }" label="Buy" class="w-100" :class="isBuy && 'bg-green'"></p-button>
                    </div>
                    <div class="flex-1">
                        <p-button @click="()=> {
                                    isBuy = false;
                                    clearForm();
                                }" label="Sell" class="w-100" :class="!isBuy && 'bg-red'"></p-button>
                    </div>
                </div>
                <div class="controller gray">
                    <span class="cp fw-b" :class="tradeType == 1 && 'gold'" @click="()=> {
                                tradeType = 1;
                                clearForm();
                            }">Limit</span>
                    <span class="cp fw-b" :class="tradeType == 2 && 'gold'" @click="()=> {
                                tradeType = 2;
                                clearForm();
                            }">Market</span>
                    <span class="cp fw-b" :class="tradeType == 3 && 'gold'" @click="()=> {
                                tradeType = 3;
                                clearForm();
                            }">
                        Stop Limit
                    </span>
                </div>
                <div class="child gap-08">
                    <div class="controller flex-row between ">
                        <span class="gray">
                            Available Balance
                        </span>
                        <span class="f-13"> @{{userBalance?.base_coin_balance ? Currency(isBuy ? userBalance?.base_coin_balance : userBalance?.trade_coin_balance) : '--'}} @{{(!selected?.trade_coin || isBuy) ?  'USDT' : selected?.trade_coin ?? 'USDT'}} </span>
                    </div>
                    <div class="p-inputgroup" v-if="tradeType == 3">
                        <p-inputnumber :disabled="!selected" v-model="stopPrice" :max-fraction-digits="8" placeholder="Stop Price"></p-inputnumber>
                    </div>
                    <div class="p-inputgroup" v-if="tradeType == 1 || tradeType == 3">
                        <p-inputnumber :disabled="!selected" v-model="orderPrice" :max-fraction-digits="8" placeholder="Order Price" @input="($event) => {
                                    orderPrice = $event.value;
                                    calc();
                                }" />
                        <span class="p-inputgroup-addon " style="min-width: fit-content;">
                            <span class="f-13 fw-b "><span> </span> <span>USDT</span></span>
                        </span>
                    </div>
                    <div class="p-inputgroup" v-else>
                        <p-inputnumber disabled v-model="computedWsPrice" :max-fraction-digits="8" placeholder="Order Price">
                        </p-inputnumber>
                    </div>
                    <div class="p-inputgroup">
                        <p-inputnumber :disabled="!selected" v-model="quantity" :max-fraction-digits="8" placeholder="Quantity" @input="($event) => {
                                    quantity = $event.value;
                                    calc();
                                }"></p-inputnumber>
                        <span class="p-inputgroup-addon">
                            <span class="f-13 fw-b"> @{{selected?.trade_coin ?? getOldSymbol}}</span>
                        </span>
                    </div>

                </div>
                <div class="child mt-2">
                    <div class="slider-controller ">
                        <vue-slider :class="`x-slider`" v-model="volume" :marks="marks" :tooltip="'active'" :interval="5" :hide-label="true" :disabled="!selected" @change="(value) => calcSlider(value)"></vue-slider>
                    </div>
                    <div class="controller flex-row between gray mt-2 f-13 pl-2">
                        <span>0</span><span>100%</span>
                    </div>
                </div>
                <div class="child w-100">
                    <div class="p-inputgroup">
                        <p-inputnumber disabled v-model="orderValue" placeholder="Order Value"></p-inputnumber>
                        <span class="p-inputgroup-addon">
                            <span class="f-13 fw-b">USDT</span>
                        </span>
                    </div>
                </div>

                @guest
                <p-button class="trade-submit-btn">
                    <div class="controller flex-row both-center w-100 f-16">
                        <span> Please </span>
                        <a href="{{ route('register.index') }}"><span class="gold">Register</span></a>
                        <span>Or</span>
                        <a href="{{ route('login') }}"><span class="gold">Sign In</span></a>
                    </div>
                </p-button>
                @endguest
                @auth
                <p-button :loading="loading" @click="onSubmit()" :class="isBuy ? 'bg-green':'bg-red'">
                    <div class="controller flex-row both-center w-100 f-16">
                        <span>@{{isBuy ? 'Buy': 'Sell'}}</span>
                    </div>
                </p-button>
                @endauth
                <div class="bg-line-h mt-3"></div>
                <div class="controller flex-row between w-100">
                    <div class="flex-1 px-1">
                        <div class="controller py-1 px-2 w-100 normal-radius gradient-left-green  between">
                            <div class="child center">
                                <span class="fw-b f-14">
                                    Avrage Asks
                                </span>
                                <span class="green fw-b f-13">@{{Currency(calcAmount?.asks)}}</span>
                            </div>

                        </div>
                    </div>
                    <div class="flex-1 px-1">
                        <div class="controller py-1 px-2 w-100 normal-radius gradient-left-red  between">
                            <div class="child center">
                                <span class="fw-b f-14">
                                    Avrage Bids
                                </span>
                                <span class="red fw-b f-13">@{{Currency(calcAmount?.bids)}}</span>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- <TradeSpothistoryComponent /> -->
        </div>


    </div>
    </div>
    </div>


    <script type="module">
        const {
            createApp,
            ref,
            reactive,
            onMounted,
            toRefs,
            onUnmounted,
            computed
        } = Vue;
        const {
            FilterMatchMode,
            FilterOperator
        } = primevue.api;
        const {
            useToast
        } = primevue.usetoast;

        const App = {
            setup() {
                const toast = useToast();
                const chartContainer = ref();
                const open = ref(['Users'])
                const admins = ref([
                    ['Management', 'mdi-account-multiple-outline'],
                    ['Settings', 'mdi-cog-outline'],
                ])
                const cruds = ref([
                    ['Create', 'mdi-plus-outline'],
                    ['Read', 'mdi-file-outline'],
                    ['Update', 'mdi-update'],
                    ['Delete', 'mdi-delete'],
                ])
                const state = reactive({
                    iscancle: false,
                    chartSelectedTab: 0,
                    orderBookSelectedTab: 0,
                    historySelectedTab: 0,
                    markethistory: [],
                    selectedPrice: null,
                    sortType: 1,
                    orderBooks: null,
                    selectedHistorySubTab: 0,
                    showAll: false,
                    isBuy: true,
                    tradeType: 1,
                    orderPrice: null,
                    orderValue: null,
                    volume: 0,
                    SpotCoinsTabSelected: 0,
                    SpotCoinsSubTabSelected: 0,
                    selectedCoin: null,
                    chartType: 1,
                    chartTime: 4,
                    showCandelChart: true,
                    wsAssets: {
                        list: [],
                        loading: true,
                        marketList: [],
                    },
                    selected: null,
                    averagePrice: null,
                    history: [],
                    openOrders: [],
                    filters: {
                        global: {
                            value: null,
                            matchMode: FilterMatchMode.CONTAINS
                        },
                    },
                    userBalance: null,
                    quantity: null,
                    stopPrice: null,
                    loading: false,
                    recountTrade: [],
                    pendingListCount: 0,
                    calcAmount: {
                        bids: 0,
                        asks: 0
                    },
                    coinex: {},
                    sidebar: false,
                    tvIsEnabeld: true,
                    moreItems: [
                    {
                        items: [{
                            label: 'Open Orders',
                            url: '{{ route('user.open.order') }}'
                        }, {
                            label: 'Trade History',
                            url: '{{ route('my-trade-history') }}'
                        }]
                    }]
            });

                const menu = ref();
                const op = ref();
                const ChartTabs = ['TradingView', 'Standard', 'Depth']
                const orderBooksTabs = ['Order Book', 'Recent Trade'];
                const historyTabs = ['Open Orders', 'Trade History'];
                const historySubTabs = ['Limit & Market Orders', 'Stop Limit Order'];

                const SpotCoinsTabs = ['USDT', 'BTC', 'USDC', 'DAI', 'EUR'];
                const SpotCoinsSubTabs = ['All', 'Fan Token', 'Leverage Tokens', 'Margin Trading'];

                const marks = [0, 25, 50, 75, 100];
                const chartdiv = ref();
                const sideBarItems = ref([])

                const toggle = (event) => {
                    op.value.toggle(event);
                };
                const toggleMenu = (event) => {
                    menu.value.toggle(event);
                };
                const Currency = (value) => {
                    if (Number(value) > 999) {
                        return Intl.NumberFormat().format(Number(value).toFixed(8));
                    } else {
                        if (String(value).length >= 3) {
                            return eToNumber((value))
                        } else return value;
                    }
                }

                const eToNumber = (num) => {
                    try {

                        let sign = "";
                        (num += "").charAt(0) == "-" && (num = num.substring(1), sign = "-");
                        let arr = num.split(/[e]/ig);
                        if (arr.length < 2) return sign + num;
                        let dot = (.1).toLocaleString().substring(1, 1),
                            n = arr[0],
                            exp = +arr[1],
                            w = (n = n.replace(/^0+/, '')).replace(dot, ''),
                            pos = n.split(dot)[1] ? n.indexOf(dot) + exp : w.length + exp,
                            L = pos - w.length,
                            s = "" + BigInt(w);
                        w = exp >= 0 ? (L >= 0 ? s + "0".repeat(L) : r()) : (pos <= 0 ? "0" + dot + "0".repeat(Math.abs(pos)) + s : r());

                        L = w.split(dot);
                        if (L[0] == 0 && L[1] == 0 || (+w == 0 && +s == 0)) w = 0; //** added 9/10/2021
                        return sign + w;

                        function r() {
                            return w.replace(new RegExp(`^(.{${pos}})(.)`), `$1${dot}$2`)
                        }
                    } catch (error) {
                        return num
                    }
                }


                const GRemoveSuffix = (val) => {
                    if (!val) return val
                    if (val == 'USDTUSDC' || val == 'USDT') return 'USDT'
                    if (val == 'USDCUSDT' || val == 'USDC') return 'USDC'
                    return val.replace('USDT', '').replace('USDC', '');
                }
                var Ss = "{{request() -> segment(2)}}";
                if (!Ss || Ss == "") {
                    Ss = "BTC";
                } else {
                    Ss = Ss.replace("_USDT", "");
                }

                // const getOldSymbol = computed(()=> {
                //     return (localStorage.getItem('spotSymbol') && localStorage.getItem('spotSymbol') != undefined && localStorage.getItem('spotSymbol') != null) ? localStorage.getItem('spotSymbol') : 'BTC';
                // })
                const getOldSymbol = Ss;
                const setMarketPrice = () => {

                    state.wsAssets.loading = true;

                    const wsService = new WebSocket(`wss://trademen.codemen.me:1011/`);
                    wsService.onmessage = function(ev) {
                        if (ev && ev.data) {
                            if (checkJson(String(ev.data))) {
                                const wsData = JSON.parse(ev.data).codemen;
                                if (!(!wsData || Object.keys(wsData).length === 0)) {
                                    if (wsData) {
                                        console.log('wsData', wsData)
                                        const marketPrice = JSON.parse(ev.data)?.coinex ?? {};

                                        state.wsAssets.loading = false;
                                        state.wsAssets.data = wsData;
                                        state.coinex = JSON.parse(ev.data)?.coinex;

                                        console.log('useRoute()', window.location.pathname)
                                        let selectedParams = "{{request()->segment(2)}}"
                                        if (!selectedParams || selectedParams == "") {
                                            selectedParams = "BTC";
                                        } else {
                                            selectedParams = selectedParams.replace("_USDT", "");
                                        }

                                        if (state.selected) {
                                            const _finded = state.coinex[state.selected.trade_coin] ?? null;
                                            if (!!_finded != state.tvIsEnabeld) {
                                                state.tvIsEnabeld = !!_finded;
                                                state.chartSelectedTab = 0;
                                            }
                                        }

                                        let _marketList = [...wsData];
                                        state.wsAssets.marketList = _marketList.map((_item) => {

                                            const _selectedWs = marketPrice[_item.trade_coin] ?? null;
                                            try {
                                                _item.trade_coin_icon = _item.trade_coin_icon.replace('default.png', `__${_item.trade_coin}.png`);
                                            } catch {
                                                _item.trade_coin_icon = "default.png";
                                            }
                                            if (_selectedWs) {
                                                _item.latest_price = Number(_selectedWs.price_usd ?? 0).toFixed(8);
                                                _item.change = Number(_selectedWs.change_rate ?? 0).toFixed(2);
                                                _item.circulation = _selectedWs?.circulation ? _selectedWs?.circulation : null;
                                                _item.circulation_usd_rank = _selectedWs?.circulation_usd_rank ? _selectedWs?.circulation_usd_rank : null;
                                                _item.volume_usd = _selectedWs?.volume_usd ? _selectedWs?.volume_usd : null;
                                                _item.change_rate_30d = _selectedWs?.change_rate_30d ? _selectedWs?.change_rate_30d : null;
                                            }

                                            return _item;
                                        })

                                        if (!state.selected) {
                                            // state.selected = state.wsAssets.marketList.find((_item)=> _item.trade_coin == state.selected?.trade_coin ?? 'BTC')
                                            const finded = state.wsAssets.marketList.find((item) => item.trade_coin == getOldSymbol);
                                            state.selected = finded;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                const checkJson = (text) => {
                    if (/^[\],:{}\s]*$/.test(text.replace(/\\["\\\/bfnrtu]/g, '@').replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
                        return true
                    } else {
                        return false
                    }
                }
                const wsController = ref();
                const wsDepthControl = ref();

                let root = null;
                let chart = null;
                let xAxis = null;
                let yAxis = null;
                let bidsTotalVolume = null;
                let asksTotalVolume = null;
                let bidVolume = null;
                let asksVolume = null;
                let cursor = null;

                const balanceInterval = ref();

                const initUserWalletSummary = () => {
                    GetBalance();
                    if (balanceInterval.value) {
                        clearInterval(balanceInterval.value);
                    }
                    state.userBalance = null;
                    balanceInterval.value = setInterval(() => {
                        GetBalance();
                    }, 5000);
                }

                const GetBalance = () => {
                    axios({
                        method: 'get',
                        url: "{{ route('exchange.get-wallet-summary') }}",
                        params: {
                            coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_USDT' : getOldSymbol + "_USDT"
                        }
                    }).then((response) => {
                        state.userBalance = response.data;
                    });
                }


                const parseData = (data) => {
                    let res = [];
                    processData(data.bid, "bids", true, res);
                    processData(data.ask, "asks", false, res);
                    xAxis.data.setAll(res);
                    bidsTotalVolume.data.setAll(res);
                    asksTotalVolume.data.setAll(res);
                    bidVolume.data.setAll(res);
                    asksVolume.data.setAll(res);
                }

                function processData(list, type, desc, res) {

                    // Convert to data points
                    for (var i = 0; i < list.length; i++) {
                        list[i] = {
                            value: Number(list[i][0]),
                            volume: Number(list[i][1]),
                        }
                    }

                    // Sort list just in case
                    list.sort(function(a, b) {
                        if (a.value > b.value) {
                            return 1;
                        } else if (a.value < b.value) {
                            return -1;
                        } else {
                            return 0;
                        }
                    });

                    // Calculate cummulative volume
                    if (desc) {
                        for (var i = list.length - 1; i >= 0; i--) {
                            if (i < (list.length - 1)) {
                                list[i].totalvolume = list[i + 1].totalvolume + list[i].volume;
                            } else {
                                list[i].totalvolume = list[i].volume;
                            }
                            let dp = {};

                            dp["value"] = list[i].value;

                            dp[type + "volume"] = list[i].volume;

                            dp[type + "totalvolume"] = list[i].totalvolume;
                            res.unshift(dp);
                        }
                    } else {
                        for (var i = 0; i < list.length; i++) {
                            if (i > 0) {
                                list[i].totalvolume = list[i - 1].totalvolume + list[i].volume;
                            } else {
                                list[i].totalvolume = list[i].volume;
                            }
                            let dp = {};

                            dp["value"] = list[i].value;

                            dp[type + "volume"] = list[i].volume;

                            dp[type + "totalvolume"] = list[i].totalvolume;
                            res.push(dp);
                        }
                    }
                }

                const initDephChart = () => {
                    root = am5.Root.new(chartdiv.value);

                    root.setThemes([am5themes_Animated.new(root)]);

                    chart = root.container.children.push(
                        am5xy.XYChart.new(root, {
                            focusable: true,
                            panX: false,
                            panY: false,
                            wheelX: "none",
                            wheelY: "none",
                            stroke: am5.color(0xffffff),
                            fill: am5.color(0xffffff),
                        })
                    );

                    root.interfaceColors.set("grid", am5.color(0x363841));
                    root.interfaceColors.set("text", am5.color(0xffffff));

                    xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
                        categoryField: "value",
                        renderer: am5xy.AxisRendererX.new(root, {
                            minGridDistance: 70
                        }),
                        tooltip: am5.Tooltip.new(root, {})
                    }));

                    xAxis.get("renderer").labels.template.adapters.add("text", function(text, target) {
                        if (target.dataItem) {

                            return root.numberFormatter.format(Number(target.dataItem.get("category")), "#.####");
                        }
                        return text;
                    });

                    yAxis = chart.yAxes.push(
                        am5xy.ValueAxis.new(root, {
                            maxDeviation: 0.1,
                            renderer: am5xy.AxisRendererY.new(root, {})
                        })
                    );


                    bidsTotalVolume = chart.series.push(am5xy.StepLineSeries.new(root, {
                        minBulletDistance: 10,
                        xAxis: xAxis,
                        yAxis: yAxis,
                        valueYField: "bidstotalvolume",
                        categoryXField: "value",
                        stroke: am5.color(0x209361),
                        fill: am5.color(0x209361),
                        tooltip: am5.Tooltip.new(root, {
                            pointerOrientation: "horizontal",
                            labelText: "[width: 120px]Ask:[/][bold]{categoryX}[/]\n[width: 120px]Total volume:[/][bold]{valueY}[/]\n[width: 120px]Volume:[/][bold]{bidsvolume}[/]"
                        })
                    }));
                    bidsTotalVolume.strokes.template.set("strokeWidth", 2)
                    bidsTotalVolume.fills.template.setAll({
                        visible: true,
                        fillOpacity: 0.2
                    });

                    asksTotalVolume = chart.series.push(am5xy.StepLineSeries.new(root, {
                        minBulletDistance: 10,
                        xAxis: xAxis,
                        yAxis: yAxis,
                        valueYField: "askstotalvolume",
                        categoryXField: "value",
                        stroke: am5.color(0xb03435),
                        fill: am5.color(0xb03435),
                        tooltip: am5.Tooltip.new(root, {
                            pointerOrientation: "horizontal",
                            labelText: "[width: 120px]Ask:[/][bold]{categoryX}[/]\n[width: 120px]Total volume:[/][bold]{valueY}[/]\n[width: 120px]Volume:[/][bold]{asksvolume}[/]"
                        })
                    }));
                    asksTotalVolume.strokes.template.set("strokeWidth", 2)
                    asksTotalVolume.fills.template.setAll({
                        visible: true,
                        fillOpacity: 0.2
                    });

                    bidVolume = chart.series.push(am5xy.ColumnSeries.new(root, {
                        minBulletDistance: 10,
                        xAxis: xAxis,
                        yAxis: yAxis,
                        valueYField: "bidsvolume",
                        categoryXField: "value",
                        fill: am5.color(0x209361)
                    }));
                    bidVolume.columns.template.set("fillOpacity", 0.2);

                    asksVolume = chart.series.push(am5xy.ColumnSeries.new(root, {
                        minBulletDistance: 10,
                        xAxis: xAxis,
                        yAxis: yAxis,
                        valueYField: "asksvolume",
                        categoryXField: "value",
                        fill: am5.color(0xb03435)

                    }));
                    asksVolume.columns.template.set("fillOpacity", 0.2);

                    cursor = chart.set("cursor", am5xy.XYCursor.new(root, {
                        xAxis: xAxis
                    }));
                    cursor.lineY.set("visible", false);


                }
                const ChangeTitle = () => {
                    var price = state.averagePrice;
                    if (!state.averagePrice) {
                        price = 0;
                    }
                    document.title = `${state.selected?.trade_coin ? state.selected?.trade_coin : getOldSymbol}` + " : " + price + " USDT";
                }
                const GetDepthData = () => {
                    try {
                        const url = `wss://trademen.codemen.me:1011/?market=${state.selected?.trade_coin ? state.selected?.trade_coin + 'USDT' : getOldSymbol + 'USDT'}`;
                        console.log(url);
                        wsDepthControl.value = new WebSocket(url);
                        wsDepthControl.value.onmessage = function(ev) {
                            if (ev && ev.data) {
                                if (checkJson(String(ev.data))) {
                                    const wsData = JSON.parse(ev.data);
                                    if (!(!wsData || Object.keys(wsData).length === 0)) {
                                        if (wsData) {
                                            // console.log('market order ', wsData);
                                            let askTotal = 0;
                                            let bidTotal = 0;

                                            let askAverage = 0;
                                            let bidAverage = 0;

                                            let orderBook = {
                                                ask: [],
                                                bid: [],
                                                last: '',
                                                time: 0,
                                                checksum: 0
                                            };
                                            orderBook = wsData;

                                            //start bid

                                            orderBook.bid = orderBook.bid.map(item => {
                                                bidTotal += Number(item[1]);
                                                bidAverage += Number(item[0]);
                                                item[2] = String(((Number(item[1]) * 100) / bidTotal).toFixed(3));
                                                item[3] = String(bidTotal.toFixed(2));
                                                return item;
                                            });
                                            orderBook.bid.sort((a, b) => Number(a[2]) - Number(b[2]))
                                            //end bid

                                            //start ask
                                            orderBook.ask = orderBook.ask.map(item => {
                                                askTotal += Number(item[1]);
                                                askAverage += Number(item[0]);
                                                item[2] = String(((Number(item[1]) * 100) / askTotal).toFixed(3));
                                                item[3] = String(askTotal.toFixed(2));
                                                return item;
                                            });

                                            orderBook.ask.sort((a, b) => Number(b[2]) - Number(a[2]))
                                            parseData({
                                                "ask": orderBook.ask,
                                                "bid": orderBook.bid,
                                                "isFrozen": "0",
                                                "postOnly": "0",
                                                "seq": 67767369
                                            })
                                        }
                                    }
                                }
                            }
                        }
                    } catch (error) {}

                }

                const getOrders = () => {

                    state.orderBooks = null;
                    state.averagePrice = null
                    try {


                        let _candeldata = [];
                        var CoinPair = state.selected?.trade_coin ? state.selected?.trade_coin + '_USDT' : getOldSymbol + "_USDT";
                        var url = "{{ url('api/public') }}?command=returnChartData&tradePair=" + CoinPair + "&start=1";
                        axios({
                            method: 'get',
                            url: url
                        }).then((response) => {
                            let _candelList = []


                            const chart = LightweightCharts.createChart(chartContainer.value, {
                                width: '100%',
                                height: chartContainer.value?.innerHeight,
                                layout: {
                                    background: {
                                        type: 'solid',
                                        color: '#141823'
                                    },
                                    textColor: '#fff',

                                },
                                grid: {
                                    vertLines: {
                                        color: "#242733"
                                    },
                                    horzLines: {
                                        color: "#242733"
                                    }
                                },
                                timeScale: {
                                    minBarSpacing: 6
                                },
                                watermark: {
                                    text: "",
                                    fontSize: 56,
                                    color: "rgba(256, 256, 256, 0.1)",
                                    visible: true
                                }
                            });

                            const candleSeries = chart.addCandlestickSeries({

                            });

                            const volumeSeries = chart.addHistogramSeries({
                                color: "#385263",
                                lineWidth: 2,
                                priceFormat: {
                                    type: "volume"
                                },
                                overlay: true,
                                scaleMargins: {
                                    top: 0.9,
                                    bottom: 0
                                }
                            });
                            response.data.forEach((item) => {
                                let _itemdata = {};
                                _itemdata.low = Number(item.low);
                                _itemdata.high = Number(item.high);
                                _itemdata.open = Number(item.open);
                                _itemdata.close = Number(item.close);
                                const date = new Date(Number(Number(item.date).toFixed() + '000')).toISOString().replace('T', ' ').replace('.000Z', '');
                                _itemdata.time = date;

                                const bar = nextBar(_itemdata);
                                candleSeries.update(bar);
                                volumeSeries.update(bar);
                                _candelList.push(_itemdata);
                            });
                            console.log('_candeldata', _candelList);

                            resize();

                            window.addEventListener("resize", resize, false);

                            function resize() {
                                chart.applyOptions({
                                    width: chartContainer.value.clientWidth,
                                    height: 552
                                });

                                setTimeout(() => chart.timeScale().fitContent(), 0);
                            }



                            const url = `wss://trademen.codemen.me:1011/?market=${state.selected?.trade_coin ? state.selected?.trade_coin + 'USDT' : getOldSymbol + 'USDT'}`
                            // console.log(url);
                            wsController.value = new WebSocket(url);
                            wsController.value.onmessage = function(ev) {
                                if (ev && ev.data) {
                                    if (checkJson(String(ev.data))) {
                                        const wsData = JSON.parse(ev.data);
                                        if (!(!wsData || Object.keys(wsData).length === 0)) {
                                            if (wsData && wsData.bid && wsData.bid.length > 0) {
                                                let askTotal = 0;
                                                let bidTotal = 0;

                                                let askAverage = 0;
                                                let bidAverage = 0;

                                                let orderBook = {
                                                    ask: [],
                                                    bid: [],
                                                    last: '',
                                                    time: 0,
                                                    checksum: 0
                                                };
                                                orderBook = wsData;

                                                //start bid

                                                orderBook.bid = orderBook.bid.map(item => {
                                                    bidTotal += Number(item[1]);
                                                    bidAverage += Number(item[0]);
                                                    item[2] = String(((Number(item[1]) * 100) / bidTotal).toFixed(3));
                                                    item[3] = String(bidTotal.toFixed(2));
                                                    return item;
                                                });
                                                orderBook.bid.sort((a, b) => Number(a[2]) - Number(b[2]))
                                                //end bid

                                                //start ask
                                                orderBook.ask = orderBook.ask.map(item => {
                                                    askTotal += Number(item[1]);
                                                    askAverage += Number(item[0]);
                                                    item[2] = String(((Number(item[1]) * 100) / askTotal).toFixed(3));
                                                    item[3] = String(askTotal.toFixed(2));
                                                    return item;
                                                });

                                                orderBook.ask.sort((a, b) => Number(b[2]) - Number(a[2]));
                                                state.calcAmount.asks = (askTotal / orderBook.ask.length).toFixed(6);
                                                state.calcAmount.bids = (bidTotal / orderBook.bid.length).toFixed(6);

                                                const averagePrice = (askAverage + bidAverage) / (orderBook.ask.length + orderBook.bid.length)

                                                //end ask
                                                const {
                                                    ask,
                                                    bid
                                                } = orderBook;
                                                state.averagePrice = Number(averagePrice).toFixed(8);
                                                state.orderBooks = orderBook;
                                                try {
                                                    ChangeTitle()
                                                } catch {}
                                                // 1675009500000 - "2023-01-29T16:25:00.000Z"
                                                // 1675008000000 - "2023-01-29T16:00:00.000Z"

                                                if (_candeldata.length > 0 && wsData.chart && wsData.chart?.price) {
                                                    const _date = new Date(wsData.chart.updated).getTime();
                                                    const lastIndex = _candeldata.length - 1;
                                                    let lastData = {
                                                        ..._candeldata[lastIndex]
                                                    };

                                                    if (wsData.chart.price > lastData.high) {
                                                        lastData.high = wsData.chart.price;
                                                        _candeldata[lastIndex] = lastData;
                                                    } else if (wsData.chart.price < lastData.low) {
                                                        lastData.low = wsData.chart.price;
                                                        _candeldata[lastIndex] = lastData;
                                                    };
                                                    lastData.value = wsData.chart.price;
                                                    const minuts = new Date(_date - lastData.time).getMinutes();
                                                    if (minuts >= 60) {
                                                        lastData.date = _date;
                                                        _candeldata[lastIndex].date = _date;
                                                    };

                                                    const bar = nextBar(lastData);
                                                    candleSeries.update(bar);
                                                    volumeSeries.update(bar);
                                                }
                                            }
                                        }
                                    }
                                }
                            };

                            function nextBar({
                                open,
                                high,
                                low,
                                close,
                                date,
                                time,
                                value
                            }) { // web socket ro inja bayad bezani
                                if (!nextBar.date) nextBar.date = new Date(date);
                                if (!nextBar.bar) nextBar.bar = {
                                    open,
                                    high,
                                    low,
                                    close
                                };

                                // nextBar.date.setDate(nextBar.date.getDate());
                                nextBar.bar.time = time

                                nextBar.bar.open = open;
                                nextBar.bar.close = close;
                                nextBar.bar.high = high;

                                nextBar.bar.low = low;
                                nextBar.bar.value = value ? value : close;
                                nextBar.bar.color =
                                    nextBar.bar.close < nextBar.bar.open ? "#f23645" : "#089981";

                                return nextBar.bar;
                            }
                        });
                    } catch (error) {

                    }


                }

                const initTv = () => {
                    new TradingView.widget({
                        "width": '100%',
                        "height": '590px',
                        "symbol": state.selected?.trade_coin ? state.selected?.trade_coin + 'USDT' : getOldSymbol + "USDT",
                        "interval": "D",
                        "timezone": "Etc/UTC",
                        "theme": "dark",
                        "style": "1",
                        "locale": "en",
                        "toolbar_bg": "#f1f3f6",
                        "hide_side_toolbar": false,
                        "enable_publishing": false,
                        "allow_symbol_change": true,
                        "container_id": "tv_chart_container",
                    });
                }
                const onErrorImage = (e) => {
                    // e.target.src = 'url';
                }
                const onRowSelect = (event) => {

                    console.log(event.data);
                    state.selected = event.data;
                    state.pendingListCount = 0;

                    localStorage.setItem('spotSymbol', event.data.trade_coin)

                    const _finded = state.coinex[event.data.trade_coin] ?? null;
                    const stateurl = {
                        'user': 'guest'
                    };
                    window.history.pushState(stateurl, '', event.data.trade_coin + "_USDT");
                    op.value.hide();
                    if (!!wsController.value) {
                        wsController.value.close();
                        wsDepthControl.value.close();
                        wsDepthControl.value = null;
                        wsController.value = null;
                        initUserWalletSummary();
                        clearForm();
                        MyTradesHistories();
                        chartContainer.value = null;
                        state.showCandelChart = false;
                        setTimeout(() => {
                            state.showCandelChart = true;
                            MyOpenOrders();
                            getOrders();
                            recentTrade();
                            if (!!_finded != state.tvIsEnabeld) {
                                state.tvIsEnabeld = !!_finded;
                                state.chartSelectedTab = 0;
                            }

                        }, 1500);
                        setTimeout(() => {
                            GetDepthData();
                            initTv();
                        }, 1000);
                    } else {
                        getOrders();
                        GetDepthData();
                    }
                    try {
                        ChangeTitle();
                    } catch {}
                }

                const computedWsPrice = computed(() => {
                    return state.wsAssets.data.find((item) => item.trade_coin == state.selected?.trade_coin ?? getOldSymbol)?.latest_price ?? 0;
                })
                const getWsPrice = () => {
                    return state.wsAssets.data.find((item) => item.trade_coin == state.selected?.trade_coin ?? getOldSymbol)?.latest_price ?? 0;
                }

                const calc = () => {

                    const {
                        tradeType,
                        orderPrice,
                        quantity,
                        isBuy,
                        userBalance,
                        selected
                    } = state;

                    const price = (tradeType == 1 || tradeType == 3) ? orderPrice : getWsPrice();
                    const amount = quantity;
                    // const final = state.isBuy ? amount * price : price / amount;
                    const final = selected.trade_coin == 'IRT' ? amount : amount * price;
                    console.log('price', price);
                    console.log('amount', amount);
                    console.log('final', final);
                    state.orderValue = final;


                    const balance = isBuy ? userBalance.base_coin_balance : userBalance.trade_coin_balance;
                    console.log('balance', balance);
                    const val = isBuy ? ((selected.trade_coin == 'IRT' ? amount : amount * price) / balance) * 100 : (amount * 100) / balance;

                    if (val >= 100) {
                        state.volume = 100;
                        calcSlider(100)
                    } else {
                        state.volume = Math.round(val)
                    }
                }


                const clearForm = () => {
                    state.quantity = null;
                    state.orderPrice = null;
                    state.orderValue = null;
                    state.volume = 0;
                }

                const calcSlider = (value) => {

                    const {
                        tradeType,
                        orderPrice,
                        selected
                    } = state;
                    const price = (tradeType == 1 || tradeType == 3) ? orderPrice : getWsPrice();
                    if (Number(price) > 0 && value > 0) {
                        if (state.isBuy) {
                            //  { base_coin_balance: "21.74355086", trade_coin_balance: "47.82006952" }
                            const balanceUSDT = Number(state.userBalance.base_coin_balance);
                            const PriceusedUSDT = (balanceUSDT * value) / 100;

                            const AmountOfCrypto = selected.trade_coin == 'IRT' ? PriceusedUSDT : PriceusedUSDT / price;
                            if (balanceUSDT) state.quantity = AmountOfCrypto;
                            else clearForm()
                            if (value == 100) state.orderValue = AmountOfCrypto;
                        } else {
                            ///SELL
                            const BalanceCrypto = Number(state.userBalance.trade_coin_balance);

                            const AmountToSell = (BalanceCrypto * value) / 100
                            // const AmountGiveUSDT = AmountToSell*price ;
                            if (BalanceCrypto) state.quantity = AmountToSell;
                            else clearForm();
                            if (value == 100) state.orderValue = AmountToSell;
                        }

                        state.orderValue = selected.trade_coin == 'IRT' ? state.quantity : state.quantity * price;
                    } else {
                        setTimeout(() => {
                            clearForm()
                        }, 500);
                    }
                }


                const onSubmit = () => {
                    const {
                        stopPrice,
                        quantity,
                        orderPrice,
                        orderValue,
                        tradeType,
                        isBuy,
                        selected,
                        userBalance
                    } = state;

                    const _category = ['limit', 'market', 'stop_limit'][tradeType - 1];
                    const _order_type = isBuy ? 'buy' : 'sell';
                    if (isBuy) {
                        if (userBalance.base_coin_balance < orderValue) {
                            return toast.add({
                                severity: 'error',
                                summary: 'Balance Error',
                                detail: 'Balance Not Enogh',
                                life: 3000
                            });
                        }
                    } else {
                        if (userBalance.trade_coin_balance < quantity) {
                            return toast.add({
                                severity: 'error',
                                summary: 'Balance Error',
                                detail: 'Balance Not Enogh',
                                life: 3000
                            });
                        }
                    }
                    CreateOrder(Number(orderPrice).toFixed(8), Number(quantity).toFixed(8), Number(orderValue).toFixed(8), _category, _order_type, selected.trade_pair, "")
                }

                const CreateOrder = async (price, amount, total, category, order_type, trade_pair, stop) => {
                    console.log(price, amount);
                    if (category != "market") {
                        if (price == "0.00000000" || amount == "0.00000000") {
                            return toast.add({
                                severity: 'error',
                                summary: "Order Create Error",
                                detail: "enter amount and price",
                                life: 3000
                            });
                        }
                    }

                    var payload = {};
                    if (category == "market") {
                        payload.total = total;
                        payload.trade_pair = trade_pair;
                        payload.amount = null;
                        payload.order_type = order_type;
                        payload.category = category;
                    } else if (category == "stop_limit") {
                        payload.total = total;
                        payload.stop = stop;
                        payload.price = price;
                        payload.amount = amount;
                        payload.category = category;
                        payload.order_type = order_type;
                        payload.trade_pair = trade_pair;
                    } else if (category == "limit") {
                        payload.price = price;
                        payload.amount = amount
                        payload.total = total;
                        payload.category = category;
                        payload.order_type = order_type;
                        payload.trade_pair = trade_pair;
                    }
                    // console.log(payload);

                    state.loading = true; // in loading

                    let res = await axios.post("{{ route('user.order.store') }}", payload);
                    // console.log('new order ', res.data);
                    try {
                        var data = res.data;
                        if (data.success == true) {
                            toast.add({
                                severity: 'success',
                                summary: 'Order Created',
                                detail: data.message,
                                life: 3000
                            });
                            clearForm();
                            GetMyOrders();
                        } else {
                            toast.add({
                                severity: 'error',
                                summary: "Order Create Error",
                                detail: data.message,
                                life: 3000
                            });
                        }
                    } catch {
                        toast.add({
                            severity: 'error',
                            summary: 'Server Error',
                            detail: "",
                            life: 3000
                        });
                    }


                    state.loading = false; // in loading
                    // MyOpenOrders()//
                }

                const CancleOrder = async (orderid) => {
                    var ss = "{{ route('user.order.store') }}".replace("store", "");
                    var url = ss + orderid + "/destroy";
                    state.loading = true; // in loading
                    axios.post(url, "_method=DELETE").then((res) => {
                            var datares = res.data;
                            console.log('deleted res', datares)
                            if (datares.success == true) {
                                state.iscancle = true;
                                state.pendingListCount = 0;
                                state.openOrders = state.openOrders.filter((item) => item.order_id != orderid)
                                state.pendingListCount = openOrders.length;
                                toast.add({
                                    severity: 'success',
                                    summary: 'Order Cancled',
                                    detail: res?.msg,
                                    life: 3000
                                });
                                GetMyOrders();
                            } else {
                                toast.add({
                                    severity: 'error',
                                    summary: 'Order Not Cancled',
                                    detail: res?.msg,
                                    life: 3000
                                });
                            }
                            state.loading = false; // in loading

                        })
                        .catch((er) => {
                            toast.add({
                                severity: 'error',
                                summary: 'Server Error',
                                detail: 'Somtting wrong try agin later',
                                life: 3000
                            });
                        })
                        .finally(() => state.loading = false);
                }
                const historyInterval = ref();
                const MyTradesHistories = () => {
                    GetTradesHistoryMy();
                    if (historyInterval.value) {
                        clearInterval(historyInterval.value);
                    }
                    historyInterval.value = setInterval(() => {
                        GetTradesHistoryMy();
                    }, 5000);
                }

                const GetTradesHistoryMy = () => {
                    var isauth = document.getElementById("auth").innerHTML;
                    if (isauth == "ok") {
                        var url = "{{ route('exchange.get-my-trades') }}";
                        axios({
                            method: 'get',
                            url: url,
                            params: {
                                coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_USDT' : getOldSymbol + "_USDT"
                            }
                        }).then((response) => {
                            console.log('response history', response.data)
                            state.history = response.data;
                        });
                    }
                }

                const recentTrade = () => {
                    var url = "https://dev.codemen.me/exchange/get-trade-histories";
                    axios({
                        method: 'get',
                        url: url,
                        params: {
                            coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_USDT' : getOldSymbol + "_USDT",
                            _: new Date().getTime()
                        }

                    }).then((response) => {
                        // console.log('history ', response);
                        state.recountTrade = response?.data ?? [];
                    }).catch((err) => {
                        console.log('wf', err);
                    });
                };

                const historyxInterval = ref();

                const MyOpenOrders = () => {
                    GetMyOrders();
                    if (historyxInterval.value) {
                        clearInterval(historyxInterval.value);
                    }
                    historyxInterval.value = setInterval(() => {
                        GetMyOrders();
                    }, 5000);

                }

                const GetMyOrders = () => {
                    var isauth = document.getElementById("auth").innerHTML;
                    if (isauth == "ok") {
                        var url = "{{ route('exchange.get-my-open-orders') }}";
                        axios({
                            method: 'get',
                            url: url,
                            params: {
                                coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_USDT' : getOldSymbol + "_USDT"
                            }
                        }).then((response) => {
                            if (state.pendingListCount > 0 && response.data.length < state.pendingListCount && state.iscancle == false) {
                                toast.add({
                                    severity: 'success',
                                    summary: 'success',
                                    detail: 'Trade was Successful',
                                    life: 3000
                                });
                            }
                            state.iscancle = false;
                            console.log('open orders', response.data)
                            state.openOrders = response.data;
                            state.pendingListCount = response.data.length;
                        });
                    }
                }


                const StartGetMarketHistory = () => {
                    var url = "{{ route('exchange.get-trade-histories') }}";
                    axios({
                        method: 'get',
                        url: url,
                        params: {
                            coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_USDT' : getOldSymbol + "_USDT"
                        }
                    }).then((response) => {
                        // console.log(response.data);
                        state.markethistory = response.data;
                    });
                }
                const MarketInterval = ref();

                const GetTradeHistoryMarket = () => {
                    StartGetMarketHistory();
                    if (MarketInterval.value) {
                        clearInterval(MarketInterval.value);
                    }
                    MarketInterval.value = setInterval(() => {
                        StartGetMarketHistory();
                    }, 3000);

                }

                const sortMenuList = (items)=>{
                    let hi=[]
                    let hii=[]
                    for (const item in items) {
                        console.log(items[item],'hosseinali');
                        if (items[item].parent_id>0) {
                            for (const ali in items) {
                                if (items[ali].order === items[item].parent_id) {
                                    hi.push(items[item])
                                    items[ali]['children'] = hi
                                    hii.push(item)
                                }
                            }
                        }
                    }
                    console.log(items,hii,'hiiiiiiiii');
                    hii.forEach(element => {
                        for (const item in items) {
                            if (item === element) {
                                delete items[item]
                            } else sideBarItems.value.push(item)
                        }
                    });
                    console.log(items,'final');
                    sideBarItems.value = items
                    console.log(sideBarItems.value);
                }



                onUnmounted(() => {
                    if (ligtChart) {
                        chart.remove();
                        ligtChart = null;
                    }
                });

                onMounted(() => {
                    var menuItems = `{{ get_nav_json('top-nav', 'json') }}`;
                    sortMenuList(JSON.parse(menuItems.replace(/&quot;/g,'"')))
                    getOrders();
                    GetDepthData();
                    setMarketPrice();
                    initDephChart();
                    initTv();
                    MyOpenOrders();
                    MyTradesHistories();
                    initUserWalletSummary();
                    GetTradeHistoryMarket();
                    recentTrade();
                    try {
                        ChangeTitle();
                    } catch {}
                });

                return {
                    ...toRefs(state),
                    op,
                    toggle,
                    Currency,
                    ChartTabs,
                    orderBooksTabs,
                    historyTabs,
                    historySubTabs,
                    marks,
                    chartdiv,
                    SpotCoinsTabs,
                    SpotCoinsSubTabs,
                    onRowSelect,
                    calc,
                    calcSlider,
                    clearForm,
                    computedWsPrice,
                    onSubmit,
                    CancleOrder,
                    chartContainer,
                    toggleMenu,
                    menu,
                    getOldSymbol,
                    onErrorImage,
                    open,
                    admins,
                    cruds
                };
            },
            components: {
                "Dialog": primevue.Dialog,
                "p-button": primevue.button,
                "p-inputnumber": primevue.inputnumber,
                "Dropdown": primevue.Dropdown,
                "p-datatable": primevue.datatable,
                "p-column": primevue.column,
                "p-overlaypanel": primevue.overlaypanel,
                "p-checkbox": primevue.checkbox,
                "p-skeleton": primevue.skeleton,
                "p-inputtext": primevue.inputtext,
                "p-progressspinner": primevue.progressspinner,
                "p-toast": primevue.toast,
                "p-selectbutton": primevue.selectbutton,
                "p-menu": primevue.menu,
                "p-sidebar": primevue.sidebar,
                "p-accordion": primevue.accordion,
                "p-accordiontab": primevue.accordiontab,
                VueSlider: window['vue-slider-component']
            }
        };
        const {
            createVuetify
        } = Vuetify
        const vuetify = createVuetify()
        createApp(App)
            .use(primevue.config.default, {
                ripple: true
            })
            .use(primevue.toastservice)
            .use(vuetify)
            .mount("#app");

        if ($('#lf-main-nav').length > 0) {
            $('#lf-main-nav').find('.active').parents('li').addClass('active');
            $('#lf-main-nav').slicknav({
                prependTo: ".lf-responsive-menu-wrapper",
                'closedSymbol': '&#xf105;',
                'openedSymbol': '&#xf107;',
                label: ""
            });
        }

        if ($('#lf-side-nav').length > 0) {
            $(window).on("load", function() {
                $("#lf-side-nav").mCustomScrollbar({
                    theme: "dark",
                    scrollInertia: 300,
                    axis: 'y'
                });
            });
        }

        if ($('.lf-side-nav').length > 0) {
            let navDir = 'margin-left';
            if ($('html').attr('dir') == 'rtl') {
                navDir = 'margin-right';
            }
            $('.lf-side-nav li.active').parents('li').addClass('active menu-open');
            // $(window).on("load", function () {
            $(document).on('click', ".lf-side-nav-controller", function() {

                if ($('.lf-side-nav').hasClass('lf-side-nav-open')) {
                    $('.lf-side-nav').removeClass('lf-side-nav-open');
                    if ($('body').hasClass('lf-fixed-sidenav') && $(window).width() >= 992) {
                        $('.wrapper').css(navDir, '0px');
                    }
                } else {
                    $('.lf-side-nav').addClass('lf-side-nav-open');
                    if ($('body').hasClass('lf-fixed-sidenav') && $(window).width() >= 992) {
                        $('.wrapper').css(navDir, '280px');
                    }
                }
            });
            if ($('body').hasClass('lf-fixed-sidenav')) {
                $(window).on('resize', function() {
                    if ($('.lf-side-nav').hasClass('lf-side-nav-open')) {
                        if ($(window).width() >= 992) {
                            $('.wrapper').css(navDir, '280px');
                        } else {
                            $('.wrapper').css(navDir, '0px');
                        }
                    } else {
                        $('.wrapper').css(navDir, '0px');
                    }
                })
            }
            // });
            $(document).on('click', '.lf-side-nav li a', function() {
                var a = $(this).parent();
                var b = a.hasClass('menu-open');
                if (b) {
                    a.children('ul').slideUp(200, function() {
                        a.removeClass('menu-open')
                    });
                } else {
                    a.children('ul').slideDown(200, function() {
                        a.addClass('menu-open')
                    });
                }
            })
        }
        document.getElementById('lf-side-nav').style.backgroundColor = 'red';
    </script>

</body>

</html>