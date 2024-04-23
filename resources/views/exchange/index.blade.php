@extends('layouts.trade_master',['hideBreadcrumb'=>true, 'activeSideNav' => active_side_nav(), 'landing'=>false, 'h100'=>false, 'topLess' => true])
@section('title', $title)
@section('content')

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
            {{--        <div class="child gap-1">--}}
            {{--            --}}{{--                <div class="controller row between a-center pr-3">--}}
            {{--            <i class="pi pi-times cp" @click="sidebar = false"></i>--}}
            {{--            <div class="text-center lf-side-nav-logo d-table w-100">--}}
            {{--                <a href="{{route('home')}}"--}}
            {{--                   class="align-middle px-2 pt-2 d-table-cell lf-logo{{is_light_mode(settings('company_logo_light')? '': ' lf-logo-inversed')}}">--}}
            {{--                    <!-- lf-logo-inversed -->--}}
            {{--                    <img src="{{ company_logo() }}"--}}
            {{--                         class="img-fluid"--}}
            {{--                         alt="">--}}
            {{--                </a>--}}
            {{--            </div>--}}
            {{--            --}}{{--                <!-- {{getnew_nav('side-nav', 'side_nav')}} -->--}}
            {{--            <div class="lf-side-nav-wrapper">--}}
            {{--                <nav id="lf-side-nav">--}}
            {{--                    {{ get_nav('top-nav', 'side_nav') }}--}}
            {{--                </nav>--}}
            {{--            </div>--}}
            {{--        </div>--}}

        </p-sidebar>

        <div class="main-trade-screen-controller">
            <div class="trade-topBar-component">
                <img src="{{ asset('images/websocket/change-coin.png') }}" width="25" class="cp" @click="toggle">
                <!-- <SpotCoinsComponents  /> -->
                <p-overlaypanel ref="op" appendTo="body" :showCloseIcon="false" id="overlay_panel"
                                style="width: 376px;height: 680px;overflow-y: hidden;">
                    <div class="spot-coins-controller">
                            <span class="p-input-icon-left">
                                <i class="pi pi-search"></i>
                                <p-inputtext type="text" v-model="filters['global'].value" placeholder="{{__('Search')}}"
                                             class="w-100"></p-inputtext>
                            </span>
                        <div class="tab-controller">
                            <div v-for="(tab , index) in SpotCoinsTabs" :key="index" class="tab" :class="SpotCoinsTabSelected == index && 'active'" @click="setCoinPairs(index)">
                                <span>@{{ tab }}</span>
                            </div>
                        </div>
                        <div class="bg-line-h"></div>
                        {{--                    <div class="controller gap-1 mt-2">--}}
                        {{--                        <div class=" px-2 normal-radius lh-1 cp p-1 gray" v-for="(tab,index) in SpotCoinsSubTabs" :key="index" @click="SpotCoinsSubTabSelected = index" :class="SpotCoinsSubTabSelected == index && 'bg-gold2'">--}}
                        {{--                            <span class="f-13">@{{tab}}</span>--}}
                        {{--                        </div>--}}
                        {{--                    </div> --}}
                        <template v-if="wsAssets.marketList.length > 0">
                            <p-datatable @row-select="onRowSelect" v-model:filters="filters"
                                         v-model:selection="selectedCoin" selection-mode="single" data-key="trade_coin"
                                         :global-filter-fields="['trade_coin' , 'trade_pair_symbol']" :row-hover="true"
                                         :value="wsAssets.marketList" :loading="wsAssets.loading" scrollable
                                         scroll-height="500px">
                                <p-column field="asset" header="{{__('Coins')}}">
                                    <template #body="data">
                                        <div class="controller gap-05 align-center">
                                            <img class="default-coin" :src="data.data?.trade_coin_icon" :alt="'?'"/>
                                            <span class="f-14">@{{ data.data?.trade_coin }}/@{{ data.data?.base_coin }}</span>
                                        </div>
                                    </template>
                                </p-column>
                                <p-column field="asset" header="{{__('Price')}}">
                                    <template #body="data">
                                        <span>@{{Currency(data.data.latest_price)}}</span>
                                    </template>
                                </p-column>
                                <p-column field="asset" header="{{__('24 Change')}}">
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
                <img class="default-coin" :src="selected?.trade_coin_icon" :alt="'?'"/>
                <div class="child ">
                    <span class="f-18">@{{selected?.trade_coin ?? oldTradeCoin}}/@{{selected?.base_coin ?? oldBaseCoin}}</span>
                    <div class="controller flex-row">
                        <span class="f-14 gray">@{{selected?.trade_coin_name ?? oldTradeCoin}}</span>

                    </div>
                </div>
                <div class="mx-3"></div>
                <div class="controller gap-1 align-center">
                    <template v-if="selected?.trade_coin">
                        <div class="child gap-01">
                            <span class="f-17 green fw-b">@{{ Currency(selected?.latest_price) }}</span>
                            <span class="f-14">=@{{ Currency(selected?.latest_price) }} @{{selected?.base_coin ?? oldBaseCoin}}</span>
                        </div>
                        <div class="child gap-01 ">
                            <span class="fw-b gray f-13">{{__('24H Change')}}</span>
                            <span class="f-14 fw-b " :class="(Number(selected?.change) > 0 ) ? 'green':'red'">@{{Currency(selected?.change)}}%</span>
                        </div>
                        <div class="child gap-01 ">
                            <span class="fw-b gray f-13">{{__('24h High')}}</span>
                            <span class="f-14 fw-b " v-if="selected?.high_price"
                                  :class="(Number(selected?.high_price) > 0 ) ? 'green':'red'">@{{Currency(selected?.high_price)}}%</span>
                            <span class="f-14" v-else>---</span>
                        </div>
                        <div class="child gap-01">
                            <span class="fw-b gray f-13">{{__('24h Low')}}</span>
                            <span class="f-13 fw-n" v-if="selected?.low_price">@{{Currency(selected?.low_price)}}</span>
                            <span class="f-14" v-else>---</span>
                        </div>
                        <div class="child gap-01">
                            <span class="fw-b gray f-13">{{__('24h Volume')}}</span>
                            <span class="f-13 fw-n" v-if="selected?.base_coin_volume">@{{Currency(selected?.base_coin_volume)}}</span>
                            <span class="f-14" v-else>---</span>
                        </div>
                        <div class="child gap-01">
                            <span class="fw-b gray f-13">{{__('24h Volume')}}</span>
                            <span class="f-13 fw-n" v-if="selected?.trade_coin_volume">@{{Currency(selected?.trade_coin_volume)}}</span>
                            <span class="f-14" v-else>---</span>
                        </div>
                    </template>
                    <div class="child gap-01" v-else v-for="item in 7" :key="item">
                        <p-skeleton width="86px" height="24px"></p-skeleton>
                        <p-skeleton width="86px" height="24px"></p-skeleton>
                    </div>
                </div>
                <div class="controller align-center ml-auto moreinfo">
                    {{--                <p-button label="{{__('Trading Bot')}}" icon="pi pi-bolt f-16"--}}
                    {{--                          class="p-button-text p-button-plain f-14 light-text px-1"></p-button>--}}
                    <a href="{{route('futures.index')}}">
                        <p-button label="{{__('Future')}}" href="#" icon="pi pi-chart-bar f-16"
                                  class="p-button-text p-button-plain f-14 light-text px-1"></p-button>
                    </a>
                    <p-button label="{{__('User Guide')}}" icon="pi pi-file f-16"
                              class="p-button-text p-button-plain f-14 light-text px-1"></p-button>
                    {{--                <p-button icon="pi pi-align-justify f-16" @click="sidebar = true"--}}
                    {{--                          class="p-button-text p-button-plain f-14 light-text px-1"></p-button>--}}
                </div>
            </div>
            <div class="row mx-0 w-100 mt-1 ">
                <div class="child px-1 col-lg-10">
                    <div class="row mx-0 p-0 w-100">
                        <div class="col-lg-9 px-0">
                            <div class="trade-chart-controller">
                                <div class="controller align-center between w-100 head">
                                    <span class="fw-b f-16">{{ __('Chart') }}</span>
                                    <div class="tab-controller">
                                        <div v-for="(tab , index) in  ChartTabs.filter((item , index)=> {
                                        if (!(!tvIsEnabeld && index == 0)) return item;

                                    })" :key="index" class="tab" :class="chartSelectedTab == index && 'active'"
                                             @click="chartSelectedTab = index">
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
                                                    <span class="fw-b f-14">@{{selected?.trade_coin ? `${selected?.trade_coin}oldBaseCoin`: oldTradeCoin+oldBaseCoin}}</span>
                                                    <div class="v-line"></div>
                                                    <span class="f-14 cp" @click="chartTime = 1"
                                                          :class="chartTime == 1 ? 'gold':''">1m</span>
                                                    <span class="f-14 cp" @click="chartTime = 2"
                                                          :class="chartTime == 2 ? 'gold':''">30m</span>
                                                    <span class="f-14 cp" @click="chartTime = 3"
                                                          :class="chartTime == 3 ? 'gold':''">1h</span>
                                                    <span class="f-14 cp" @click="chartTime = 4"
                                                          :class="chartTime == 4 ? 'gold':''">D</span>
                                                    <div class="v-line"></div>
                                                    <i class="cp pi pi-chart-bar " @click="chartType = 1"
                                                       :class="chartType == 1 ? 'gold':''"></i>
                                                    <i class="cp pi pi-chart-line" @click="chartType = 2"
                                                       :class="chartType == 2 ? 'gold':''"></i>
                                                </div>
                                            </template>
                                            <div class="text-center" style="border: 1px solid #252834 !important;">
                                                <div class="lw-chart w-100 " style="overflow: hidden"
                                                     :class="(chartSelectedTab == (!tvIsEnabeld ? 0:1) && showCandelChart) ? 'h-auto':'h-0'"
                                                     ref="chartContainer" v-if="showCandelChart"></div>
                                                <p-progressspinner v-else class="mx-auto my-5 d-block"
                                                                   aria-label="Basic ProgressSpinner"></p-progressspinner>
                                            </div>
                                            <div v-show="tvIsEnabeld && chartSelectedTab == 0 && showCandelChart"
                                                 id="tv_chart_container" class="h-100 "></div>
                                            <!-- deph chart -->
                                            <div class="bg-dark ltr w-100 h-100" ref="chartdiv"
                                                 v-show="chartSelectedTab ==  (!tvIsEnabeld ? 1:2)"></div>
                                            <!-- deph chart -->
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 pl-1 pr-0">
                            <div class="order-book-screen-controller">
                                <div class="tab-controller">
                                    <div v-for="(tab , index) in orderBooksTabs" :key="index" class="tab"
                                         :class="orderBookSelectedTab == index && 'active'"
                                         @click="orderBookSelectedTab = index">
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
                                            <span class="gray">{{__('Price')}}(@{{selected?.base_coin ?? oldBaseCoin}})</span>
                                            <span class="gray">{{__('Amount')}}(@{{selected?.trade_coin ?? oldTradeCoin}})</span>
                                            <span class="gray">{{__('Total')}}(@{{selected?.trade_coin ?? oldTradeCoin}})</span>
                                        </div>

                                        <template v-if="(sortType == 1 || sortType == 3)">
                                            <div v-if="!!orderBooks && !!orderBooks?.ask"
                                                 v-for="ask in orderBooks?.ask.slice(0 , (sortType == 1 ? 7:14))"
                                                 :key="ask[0]" class="order-line sell cp"
                                                 @click="()=>{ orderPrice = ask[0]; calc();}">
                                                <template v-if="!!ask[0]">
                                                    <div class="line" :style="{width:Math.round(Number(ask[2]))+'%'}"></div>
                                                    <span class="flex-2 j-start ">@{{ ask[0] ? Currency(ask[0]) : ''}}</span>
                                                    <span class="flex-2 red fw-b">
                                                        @{{ ask[1] ? Currency(ask[1]) : ''}}
                                                    </span>
                                                    <span class="flex-1 j-end">@{{ ask[3] ? Currency(ask[3]) : ''}}</span>
                                                </template>
                                            </div>
                                            <p-skeleton v-else v-for="item in 5" :key="item" width="100%"
                                                        height="29px"></p-skeleton>
                                        </template>
                                        <div class="card card-bg-2  p-2 w-100 controller flex-row align-center j-start">

                                            <template v-if="averagePrice">
                                            <span class="f-18 fw-b" :class="Number(averagePrice) > 0 ? 'green':'red'">
                                                <i class="pi"
                                                   :class="Number(averagePrice) > 0 ? 'pi-arrow-up':'pi-arrow-down'"></i>
                                                @{{ Currency(averagePrice ?? 0) }}
                                            </span>
                                            </template>
                                            <p-skeleton v-else width="100px" height="29px"></p-skeleton>
                                            <template v-if="averagePrice">
                                            <span class="gray f-14">
                                                = @{{ Currency(averagePrice ?? 0) }}  USD
                                            </span>
                                            </template>
                                            <p-skeleton v-else width="100px" height="29px"></p-skeleton>
                                        </div>
                                        <template v-if="!!orderBooks && !!orderBooks?.bid">
                                            <template v-if="(sortType == 1 || sortType == 2)">
                                                <div v-for="bid in orderBooks?.bid.slice((sortType == 1 ? orderBooks?.bid?.length == 20 ? 13 : 0 :  orderBooks?.bid?.length == 20 ? 6 : 0))"
                                                     :key="bid[0]" class="order-line buy cp"
                                                     @click="()=> {orderPrice = bid[0]; calc();}">
                                                    <template v-if="!!bid[0]">
                                                        <div class="line"
                                                             :style="{width:Math.round(Number(bid[2]))+'%'}"></div>

                                                        <span class="flex-2 j-start ">@{{Currency(bid[0])}}</span>
                                                        <span class="flex-2 green fw-b">
                                                        @{{Currency(bid[1])}}
                                                    </span>
                                                        <span class="flex-1 j-end">@{{Currency(bid[3])}}</span>
                                                    </template>
                                                </div>
                                            </template>
                                        </template>
                                        <p-skeleton v-else v-for="item in 5" :key="item" width="100%"
                                                    height="29px"></p-skeleton>
                                    </div>
                                </template>
                                <div class="order-book-controller "
                                     style="height: 574px !important; height: 574px !important" v-else>
                                    <div class="controller w-100 between px-2">
                                        <span class="gray">{{__('Price')}}(@{{selected?.base_coin ?? oldBaseCoin}})</span>
                                        <span class="gray">{{__('Amount')}} (@{{selected?.trade_coin ?? oldTradeCoin}})</span>
                                    </div>

                                    <div v-if="!!recountTrade " v-for="(item , index) in recountTrade" :key="index"
                                         class="order-line cp">
                                        <span class="flex-2 j-start ">@{{ Currency(item?.price) }}</span>
                                        <span class="flex-2 j-end fw-b" :class="item.order_type == 'buy' ? 'green':'red'">
                                        @{{ Currency(item?.amount) }}
                                    </span>
                                    </div>
                                    <div class="child mt-3 gap-1" v-if="recountTrade.length == 0">
                                        <img src="{{ asset('images/websocket/dark-empty.png') }}" width="150"
                                             class="mx-auto">
                                        <span class="text-center w-100 d-block gray p-3 f-17 fw-b">Trade Not Founded !</span>
                                    </div>
                                    <p-skeleton v-else v-for="item in 5" :key="item" width="100%"
                                                height="29px"></p-skeleton>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- <OrderHistoryComponent /> -->
                    <div class="history-screen-controller">
                        <div class="controller w-100 between align-center">
                            <div class="tab-controller">
                                <div v-for="(tab , index) in historyTabs" :key="index" class="tab"
                                     :class="historySelectedTab == index && 'active'" @click="historySelectedTab = index">
                                    <span>@{{ tab }}</span>
                                </div>
                            </div>
                            <div class="controller both-center flex-row">
                                <p-checkbox inputId="showAll" v-model="showAll" :binary="true"></p-checkbox>
                                <label for="showAll" class="gray mb-0">{{__('Show all trading pairs')}}</label>
                            </div>
                        </div>
                        <div class="secondary-line-h"></div>
                        <div class="controller gap-1 mt-2">
                            <div class=" px-2 normal-radius lh-1 cp p-1 gray" v-for="(tab,index) in historySubTabs"
                                 :key="index" @click="selectedHistorySubTab = index"
                                 :class="selectedHistorySubTab == index && 'bg-gold2'">
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

                                            <span>{{__('Please')}}</span>
                                            <a href="{{ route('register.index') }}"><span class="gold">{{__('Register')}}</span></a>
                                            <span>{{__('or')}}</span>
                                            <a href="{{ route('login') }}"><span class="gold">{{__('Log In')}}</span></a>

                                        @endguest
                                        @auth
                                            <span>{{__('Not Found')}}</span>
                                        @endauth

                                    </div>
                                </template>
                                <p-column field="name" header="{{__('Symbol')}}">
                                    <template #body="data">
                                        <div class="controller gap-05 align-center" v-if="historySelectedTab == 1">
                                            <img class="default-coin" :src="selected?.trade_coin_icon" :alt="'?'"/>
                                            <span> @{{ selected?.trade_coin }} </span>
                                        </div>
                                        <span v-else> @{{ data.data?.trade_coin }} </span>
                                    </template>
                                </p-column>

                                <p-column field="price" header="{{__('Price')}}">
                                    <template #body="data">
                                        <span> @{{ Currency(data.data?.price) }} </span>
                                    </template>
                                </p-column>

                                <p-column field="amount" header="{{__('Amount')}}">
                                    <template #body="data">
                                        <span> @{{ Currency(data.data?.amount) }} </span>
                                    </template>
                                </p-column>
                                <template v-if="historySelectedTab == 0">
                                    <p-column field="exchanged" header="{{__('Filled')}}"></p-column>
                                    <p-column field="open_amount" header="{{__('Open Amount')}}">
                                        <template #body="data">
                                            <span> @{{ Currency(data.data?.open_amount) }} </span>
                                        </template>
                                    </p-column>
                                </template>

                                <p-column field="total" header="{{__('Total')}}">
                                    <template #body="data">
                                        <span> @{{ Currency(data.data?.total) }} </span>
                                    </template>
                                </p-column>
                                <p-column field="order_type" header="{{__('Order Type')}}">
                                    <template #body="data">
                                        <span :class="data.data?.order_type == 'buy' ? 'green':'red'"> @{{ (data.data?.order_type) }} </span>
                                    </template>
                                </p-column>

                                <template>
                                    <p-column field="date" header="{{__('Date')}}">
                                        <template #body="data">
                                            <span> @{{ (data.data?.date) }} </span>
                                        </template>
                                    </p-column>

                                </template>
                                <template v-if="historySelectedTab == 0">
                                    <p-column field="date" header="{{__('Cancel')}}">
                                        <template #body="data">
                                            <p-button label="Cancle" class="bg-red" @click="CancleOrder(data.data.order_id)"
                                                      :loading="loading"/>
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
                            <span class="f-16 fw-b">{{__('Spot')}}</span>
                            <div class="controller a-center gap-05">
                                <i class="f-15 cp pi pi-ellipsis-v" style="align-self: center" @click="toggleMenu"
                                   aria-haspopup="true" aria-controls="overlay_menu"></i>
                                <p-menu id="overlay_menu" ref="menu" :model="moreItems" :popup="true"></p-menu>
                                <a href="{{route('profile.index')}}">
                                    <div class="profile-controller cp">
                                        <i class="f-15 pi pi-user"></i>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="controller px-2 flex-row trade-switch-btn">
                            <div class="flex-1">
                                <p-button @click="()=> {
                                    isBuy = true;
                                    clearForm();
                                }" label="{{__('Buy')}}" class="w-100" :class="isBuy && 'bg-green'"></p-button>
                            </div>
                            <div class="flex-1">
                                <p-button @click="()=> {
                                    isBuy = false;
                                    clearForm();
                                }" label="{{__('Sell')}}" class="w-100" :class="!isBuy && 'bg-red'"></p-button>
                            </div>
                        </div>
                        <div class="controller gray">
                            <span class="cp fw-b" :class="tradeType == 1 && 'gold'" @click="()=> {
                                tradeType = 1;
                                clearForm();
                            }">{{__('Limit')}}</span>
                            <span class="cp fw-b" :class="tradeType == 2 && 'gold'" @click="()=> {
                                tradeType = 2;
                                clearForm();
                            }">{{__('Market')}}</span>
                            <span class="cp fw-b" :class="tradeType == 3 && 'gold'" @click="()=> {
                                tradeType = 3;
                                clearForm();
                            }">
                                {{__('Stop Limit')}}
                            </span>
                        </div>
                        <div class="child gap-08">
                            <div class="controller flex-row between ">
                                <span class="gray">
                                    {{__('Available Balance')}}
                                </span>
                                <span class="f-13"> @{{userBalance?.base_coin_balance ? Currency(isBuy ? userBalance?.base_coin_balance : userBalance?.trade_coin_balance) : '--'}} @{{(!selected?.trade_coin || isBuy) ?  selected?.base_coin : selected?.trade_coin ?? selected?.trade_coin}} </span>
                            </div>
                            <div class="p-inputgroup" v-if="tradeType == 3">
                                <p-inputnumber :disabled="!selected" v-model="stopPrice" :max-fraction-digits="8"
                                               placeholder="{{__('Stop Price')}}"></p-inputnumber>
                            </div>
                            <div class="p-inputgroup" v-if="tradeType == 1 || tradeType == 3">
                                <p-inputnumber :disabled="!selected" v-model="orderPrice" :max-fraction-digits="8"
                                               placeholder="{{__('Order Price')}}" @input="($event) => {
                                    orderPrice = $event.value;
                                    calc();
                                }"/>
                                <span class="p-inputgroup-addon " style="min-width: fit-content;">
                                    <span class="f-13 fw-b "><span> </span> <span>@{{selected?.base_coin ?? oldBaseCoin}}</span></span>
                                </span>
                            </div>
                            <div class="p-inputgroup" v-else>
                                <p-inputnumber disabled v-model="computedWsPrice" :max-fraction-digits="8"
                                               placeholder="{{__('Order Price')}}">
                                </p-inputnumber>
                            </div>
                            <div class="p-inputgroup">
                                <p-inputnumber :disabled="!selected" v-model="quantity" :max-fraction-digits="8"
                                               placeholder="{{__('Quantity')}}" @input="($event) => {
                                    quantity = $event.value;
                                    calc();
                                }"></p-inputnumber>
                                <span class="p-inputgroup-addon">
                                    <span class="f-13 fw-b"> @{{selected?.trade_coin ?? oldTradeCoin}}</span>
                                </span>
                            </div>

                        </div>
                        <div class="child mt-2">
                            <div class="slider-controller ">
                                <vue-slider
                                        :class="`x-slider`"
                                        v-model="volume"
                                        :marks="marks"
                                        :tooltip="'active'"
                                        :interval="5"
                                        :hide-label="true"
                                        :disabled="!selected"
                                        @change="(value) => calcSlider(value)"
                                ></vue-slider>
                            </div>
                            <div class="controller flex-row between gray mt-2 f-13 pl-2">
                                @if(language(App()->getLocale())['direction'] == 'rtl')
                                    <span>100%</span><span>0</span>
                                @else
                                    <span>0</span><span>100%</span>
                                @endif
                            </div>
                        </div>
                        <div class="child w-100">
                            <div class="p-inputgroup">
                                <p-inputnumber disabled v-model="orderValue" placeholder="{{__('Order Value')}}"></p-inputnumber>
                                <span class="p-inputgroup-addon">
                                    <span class="f-13 fw-b">@{{selected?.base_coin ?? oldBaseCoin}}</span>
                                </span>
                            </div>
                        </div>

                        @guest
                            <p-button class="trade-submit-btn">
                                <div class="controller flex-row both-center w-100 f-16">
                                    <span>{{ __('Please') }}</span>
                                    <a href="{{ route('register.index') }}"><span class="gold">{{ __('Register') }}</span></a>
                                    <span>{{ __('or') }}</span>
                                    <a href="{{ route('login') }}"><span class="gold">{{ __('Log In') }}</span></a>
                                </div>
                            </p-button>
                        @endguest
                        @auth
                            <p-button :loading="loading" @click="onSubmit()" :class="isBuy ? 'bg-green':'bg-red'">
                                <div class="controller flex-row both-center w-100 f-16">
                                    <span v-if="isBuy"> {{__('Buy')}} </span>
                                    <span v-else> {{__('Sell')}} </span>
                                </div>
                            </p-button>
                        @endauth
                        <div class="bg-line-h mt-3"></div>
                        <div class="controller flex-row between w-100">
                            <div class="flex-1 px-1">
                                <div class="controller py-1 px-2 w-100 normal-radius gradient-left-green  between">
                                    <div class="child center">
                                        <span class="fw-b f-14">
                                           {{__('Avrage Asks')}}
                                        </span>
                                        <span class="green fw-b f-13">@{{Currency(calcAmount?.asks)}}</span>
                                    </div>

                                </div>
                            </div>
                            <div class="flex-1 px-1">
                                <div class="controller py-1 px-2 w-100 normal-radius gradient-left-red  between">
                                    <div class="child center">
                                        <span class="fw-b f-14">
                                           {{__('Avrage Bids')}}
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

@endsection
@section('script')
    @include('exchange._vueInit')
@endsection