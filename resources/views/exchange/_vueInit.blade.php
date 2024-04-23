<script type="module">
    const {createApp, ref, reactive, onMounted, toRefs, onUnmounted, computed} = Vue;
    const {FilterMatchMode, FilterOperator} = primevue.api;
    const {useToast} = primevue.usetoast;

    const App = {
        setup() {
            const toast = useToast();
            const chartContainer = ref();
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
                SpotCoinBaseSelected: "USDT",
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
                    global: {value: null, matchMode: FilterMatchMode.CONTAINS},
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
                binance: {},
                sidebar: false,
                tvIsEnabeld: true,
                moreItems: [
                    {
                        items: [{
                            label: '{{__('Open Orders')}}',
                            url: '{{ route('user.open.order') }}'
                        }, {
                            label: '{{__('Trade History')}}',
                            url: '{{ route('my-trade-history') }}'
                        }]
                    }]
            });
            const currentPathName = ref('');
            const menu = ref();
            const op = ref();
            const ChartTabs = [`{{__('TradingView')}}`, `{{__('Standard')}}`, `{{__('Depth')}}`]
            const orderBooksTabs = [`{{__('Order Book')}}`, `{{__('Recent Trade')}}`];
            const historyTabs = [`{{__('Open Orders')}}`, `{{__('Trade History')}}`];
            const historySubTabs = [`{{__('Limit And Market Orders')}}`, `{{__('Stop Limit Order')}}`];

            const SpotCoinsTabs = ['USDT', 'BTC', 'IRT'];
            const SpotCoinsSubTabs = ['All', 'Fan Token', 'Leverage Tokens', 'Margin Trading'];

            const marks = [0, 25, 50, 75, 100];
            const chartdiv = ref();

            const toggle = (event) => {
                op.value.toggle(event);
            };

            const setCoinPairs = (event) => {
                state.SpotCoinsTabSelected = event;
                state.SpotCoinBaseSelected = SpotCoinsTabs[event];
                getCoinPairs();
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
                    let dot = (.1).toLocaleString().substring(1, 1), n = arr[0], exp = +arr[1],
                        w = (n = n.replace(/^0+/, '')).replace(dot, ''),
                        pos = n.split(dot)[1] ? n.indexOf(dot) + exp : w.length + exp,
                        L = pos - w.length, s = "" + BigInt(w);
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
            const indexOfSelectedParam = window.location.pathname.split('/').indexOf('exchange') + 1
            let coinPair = indexOfSelectedParam === 2 ? `{{request()->segment(2)}}` : `{{request()->segment(3)}}`
            let tradeCoin = ""
            let baseCoin = ""
            if (!coinPair || coinPair == "") {
                tradeCoin = "BTC";
                baseCoin = "USDT";
            } else {
                const coinPairArr = coinPair.split('_');
                tradeCoin = coinPairArr[0];
                baseCoin = coinPairArr[1];
            }

            // const oldTradeCoin = computed(()=> {
            //     return (localStorage.getItem('spotSymbol') && localStorage.getItem('spotSymbol') != undefined && localStorage.getItem('spotSymbol') != null) ? localStorage.getItem('spotSymbol') : 'BTC';
            // })
            const oldTradeCoin = tradeCoin;
            const oldBaseCoin = baseCoin;
            const setMarketPrice = () => {

                state.wsAssets.loading = true;

                const wsService = new WebSocket(`wss://trademen.codemen.me:1011/`);
                wsService.onmessage = function (ev) {
                    if (ev && ev.data) {
                        if (checkJson(String(ev.data))) {
                            const wsData = JSON.parse(ev.data).codemen;
                            if (!(!wsData || Object.keys(wsData).length === 0)) {
                                if (wsData) {
                                    const marketPrice = JSON.parse(ev.data)?.binance ?? {};

                                    state.wsAssets.loading = false;
                                    state.wsAssets.data = wsData;
                                    state.binance = JSON.parse(ev.data)?.binance;


                                    console.log('useRoute()', window.location.pathname)
                                    const indexOfSelectedParam = window.location.pathname.split('/').indexOf('exchange') + 1
                                    let selectedParams = indexOfSelectedParam === 2 ? `{{request()->segment(2)}}` : `{{request()->segment(3)}}`
                                    if (!selectedParams || selectedParams == "") {
                                        selectedParams = "USDT";
                                    } else {
                                        const coinPairArr = selectedParams.split('_');
                                        selectedParams = coinPairArr[0];
                                    }

                                    // const _finded = state.coinex[state.selected.trade_coin] ?? null;

                                    if (state.selected) {
                                        const _finded = state.binance[state.selected.trade_coin+state.selected.base_coin] ?? null;
                                        if (!!_finded != state.tvIsEnabeld) {
                                            state.tvIsEnabeld = !!_finded;
                                            state.chartSelectedTab = 0;
                                        }
                                    }

                                    // if (state.selected) {
                                    //     if (Object.keys(marketPrice).length > 0) {
                                    //         state.tvIsEnabeld = true;
                                    //         state.chartSelectedTab = 0;
                                    //     } else {
                                    //         state.tvIsEnabeld = false;
                                    //         state.chartSelectedTab = 0;
                                    //     }
                                    //
                                    // }

                                    let _marketList = [...wsData];
                                    state.wsAssets.marketList = _marketList.map((_item) => {
                                        // const _selectedWs = Object.keys(marketPrice).length > 0 ? marketPrice : null;

                                        const _selectedWs = marketPrice[_item.trade_coin+_item.base_coin] ?? null;

                                        try {
                                            _item.trade_coin_icon = _item.trade_coin_icon.replace('default.png', `__${_item.trade_coin}.png`);
                                        } catch {
                                            _item.trade_coin_icon = "default.png";
                                        }
                                        if (_selectedWs) {
                                            _item.latest_price = Number(_selectedWs.last ?? 0).toFixed(8);
                                            _item.change = Number(_selectedWs.changePercent ?? 0).toFixed(2);
                                            _item.low_price = _selectedWs?.low ? _selectedWs?.low : null;
                                            _item.high_price = _selectedWs?.high ? _selectedWs?.high : null;
                                            _item.base_coin_volume = _selectedWs?.volume ? _selectedWs?.volume : null;
                                            _item.trade_coin_volume = _selectedWs?.quoteVolume ? _selectedWs?.quoteVolume : null;
                                        }

                                        return _item;
                                    })

                                    if (!state.selected) {
                                        // state.selected = state.wsAssets.marketList.find((_item)=> _item.trade_coin == state.selected?.trade_coin ?? 'BTC')
                                        const finded = state.wsAssets.marketList.find((item) => item.trade_coin == oldTradeCoin);
                                        state.selected = finded;
                                    } else {
                                        const coinPair = state.selected?.trade_coin ? state.selected?.trade_coin + state.selected?.base_coin : oldTradeCoin  + oldBaseCoin
                                        const _selectedWs = marketPrice[coinPair] ?? null;
                                        if (_selectedWs) {
                                            state.selected.latest_price = Number(_selectedWs.last ?? 0).toFixed(8);
                                            state.selected.change = Number(_selectedWs.changePercent ?? 0).toFixed(2);
                                            state.selected.low_price = _selectedWs?.low ? _selectedWs?.low : null;
                                            state.selected.high_price = _selectedWs?.high ? _selectedWs?.high : null;
                                            state.selected.base_coin_volume = _selectedWs?.volume ? _selectedWs?.volume : null;
                                            state.selected.trade_coin_volume = _selectedWs?.quoteVolume ? _selectedWs?.quoteVolume : null;
                                        }
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
                @auth
                axios({
                    method: 'get',
                    url: "{{ route('exchange.get-wallet-summary') }}",
                    params: {
                        coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_' + state.selected?.base_coin : oldTradeCoin + '_' + oldBaseCoin
                    }
                }).then((response) => {
                    console.log('Balance', response)
                    state.userBalance = response.data;
                });
                @else
                    state.userBalance = null;
                @endauth
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
                list.sort(function (a, b) {
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

                xAxis.get("renderer").labels.template.adapters.add("text", function (text, target) {
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
                document.title = `${state.selected?.trade_coin ? state.selected?.trade_coin : oldTradeCoin}` + " : " + price + " " + `${state.selected?.base_coin ? state.selected?.base_coin : oldBaseCoin}`;
            }
            const GetDepthData = () => {
                try {
                    const url = `wss://trademen.codemen.me:1011/?market=${state.selected?.trade_coin ? state.selected?.trade_coin +'_'+ state.selected?.base_coin : oldTradeCoin +'_'+ oldBaseCoin}`;
                    wsDepthControl.value = new WebSocket(url);
                    wsDepthControl.value.onmessage = function (ev) {
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
                } catch (error) {
                }

            }

            const getOrders = () => {

                state.orderBooks = null;
                state.averagePrice = null
                try {
                    let _candeldata = [];
                    var CoinPair = state.selected?.trade_coin ? state.selected?.trade_coin + '_' + state.selected?.base_coin : oldTradeCoin + "_" + oldBaseCoin;
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
                                background: {type: 'solid', color: '#141823'},
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

                        const candleSeries = chart.addCandlestickSeries({});

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
                        // console.log('_candeldata', _candelList);

                        resize();

                        window.addEventListener("resize", resize, false);

                        function resize() {
                            chart.applyOptions({width: chartContainer.value.clientWidth, height: 552});

                            setTimeout(() => chart.timeScale().fitContent(), 0);
                        }


                        const url = `wss://trademen.codemen.me:1011/?market=${state.selected?.trade_coin ? state.selected?.trade_coin + '_' + state.selected?.base_coin : oldTradeCoin +'_'+ oldBaseCoin}`
                        // console.log(url);
                        wsController.value = new WebSocket(url);
                        wsController.value.onmessage = function (ev) {
                            if (ev && ev.data) {
                                if (checkJson(String(ev.data))) {
                                    const wsData = JSON.parse(ev.data);
                                    // console.log('wsData',wsData)
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

                                            // delete orderBook.bid;

                                            // console.log('orderBook',orderBook)
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
                                            const {ask, bid} = orderBook;
                                            state.averagePrice = Number(averagePrice).toFixed(8);
                                            state.orderBooks = orderBook;
                                            try {
                                                ChangeTitle()
                                            } catch {
                                            }
                                            // 1675009500000 - "2023-01-29T16:25:00.000Z"
                                            // 1675008000000 - "2023-01-29T16:00:00.000Z"

                                            if (_candeldata.length > 0 && wsData.chart && wsData.chart?.price) {
                                                const _date = new Date(wsData.chart.updated).getTime();
                                                const lastIndex = _candeldata.length - 1;
                                                let lastData = {..._candeldata[lastIndex]};

                                                if (wsData.chart.price > lastData.high) {
                                                    lastData.high = wsData.chart.price;
                                                    _candeldata[lastIndex] = lastData;
                                                } else if (wsData.chart.price < lastData.low) {
                                                    lastData.low = wsData.chart.price;
                                                    _candeldata[lastIndex] = lastData;
                                                }
                                                ;
                                                lastData.value = wsData.chart.price;
                                                const minuts = new Date(_date - lastData.time).getMinutes();
                                                if (minuts >= 60) {
                                                    lastData.date = _date;
                                                    _candeldata[lastIndex].date = _date;
                                                }
                                                ;

                                                const bar = nextBar(lastData);
                                                candleSeries.update(bar);
                                                volumeSeries.update(bar);
                                            }
                                        }
                                    }
                                }
                            }
                        };

                        function nextBar({open, high, low, close, date, time, value}) { // web socket ro inja bayad bezani
                            if (!nextBar.date) nextBar.date = new Date(date);
                            if (!nextBar.bar) nextBar.bar = {open, high, low, close};

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
                new TradingView.widget(
                    {
                        "width": '100%',
                        "height": '590px',
                        "symbol": state.selected?.trade_coin ? state.selected?.trade_coin + state.selected?.base_coin : oldTradeCoin + oldBaseCoin,
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
                    }
                );
            }

            const onRowSelect = (event) => {

                // console.log(event.data);
                state.selected = event.data;
                state.pendingListCount = 0;

                localStorage.setItem('spotSymbol', event.data.trade_coin)

                const _finded = state.binance[event.data.trade_coin] ?? null;
                const stateurl = {'user': 'guest'};
                let mainCurrentPathName = currentPathName.value.substring(0, currentPathName.value.indexOf('exchange') + 'exchange'.length);
                window.history.pushState(stateurl, '', `${mainCurrentPathName}/${event.data.trade_coin}` + "_" + `${event.data.base_coin}`);
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
                } catch {
                }
            }

            const computedWsPrice = computed(() => {
                return state.wsAssets.data.find((item) => item.trade_coin == state.selected?.trade_coin ?? oldTradeCoin)?.latest_price ?? 0;
            })
            const getWsPrice = () => {
                return state.wsAssets.data.find((item) => item.trade_coin == state.selected?.trade_coin ?? oldTradeCoin)?.latest_price ?? 0;
            }

            const calc = () => {

                const {tradeType, orderPrice, quantity, isBuy, userBalance, selected} = state;

                const price = (tradeType == 1 || tradeType == 3) ? orderPrice : getWsPrice();
                const amount = quantity;
                // const final = state.isBuy ? amount * price : price / amount;
                const final = amount * price;
                // console.log('price', price);
                // console.log('amount', amount);
                // console.log('final', final);
                state.orderValue = final;


                const balance = isBuy ? userBalance.base_coin_balance : userBalance.trade_coin_balance;
                // console.log('balance', balance);
                const val = isBuy ? ((amount * price) / balance) * 100 : (amount * 100) / balance;

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

                const {tradeType, orderPrice, selected} = state;
                const price = (tradeType == 1 || tradeType == 3) ? orderPrice : getWsPrice();
                if (Number(price) > 0 && value > 0) {
                    if (state.isBuy) {
                        //  { base_coin_balance: "21.74355086", trade_coin_balance: "47.82006952" }
                        const balanceUSDT = Number(state.userBalance.base_coin_balance);
                        const PriceusedUSDT = (balanceUSDT * value) / 100;

                        const AmountOfCrypto = PriceusedUSDT / price;
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

                    state.orderValue = state.quantity * price;
                } else {
                    setTimeout(() => {
                        clearForm()
                    }, 500);
                }
            }


            const onSubmit = () => {
                const {stopPrice, quantity, orderPrice, orderValue, tradeType, isBuy, selected, userBalance} = state;

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
                CreateOrder(Number(orderPrice).toFixed(8), Number(quantity).toFixed(8), Number(orderValue).toFixed(8), _category, _order_type, selected.trade_pair, stopPrice)
            }

            const CreateOrder = async (price, amount, total, category, order_type, trade_pair, stop) => {
                // console.log(price, amount);
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
                    payload.amount = amount;
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
                            summary: `{{__('Success')}}`,
                            detail: data.message,
                            life: 3000
                        });
                        clearForm();
                        GetMyOrders();
                    } else {
                        toast.add({severity: 'error', summary: `{{__('Error')}}`, detail: data.message, life: 3000});
                    }
                } catch {
                    toast.add({severity: 'error', summary: `{{__('Error')}}`, detail: "", life: 3000});
                }


                state.loading = false; // in loading
                // MyOpenOrders()//
            }

            const CancleOrder = async (orderid) => {
                var ss = "{{ route('user.order.store') }}".replace("store", "");
                var url = ss + orderid + "/destroy";
                state.loading = true; // in loading
                axios.delete(url, {data: {provider: "nodejs"}}).then((res) => {
                    var datares = res.data;
                    if (datares.success) {
                        state.iscancle = true;
                        state.pendingListCount = 0;
                        state.openOrders = state.openOrders.filter((item) => item.order_id != orderid)
                        state.pendingListCount = state.openOrders.length;
                        toast.add({severity: 'success', summary: datares.message, detail: res?.msg, life: 3000});
                    } else {
                        toast.add({severity: 'error', summary: 'Error Network Response', detail: res?.msg, life: 3000});
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
                            coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_' + state.selected?.base_coin : oldTradeCoin + "_" + oldBaseCoin
                        }
                    }).then((response) => {
                        // console.log('response history', response.data)
                        state.history = response.data;
                    });
                }
            }

            const recentTrade = () => {
                var url = "{{url('exchange/get-trade-histories')}}";
                axios({
                    method: 'get',
                    url: url,
                    params: {
                        coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_' + state.selected?.base_coin : oldTradeCoin + "_" + oldBaseCoin,
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
                            coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_' + state.selected?.base_coin : oldTradeCoin + "_" + oldBaseCoin
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
                        // console.log('open orders', response.data)
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
                        coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_' + state.selected?.base_coin : oldTradeCoin + "_" + oldBaseCoin
                    }
                }).then((response) => {
                    // console.log(response.data);
                    state.markethistory = response.data;
                });
            }
            const MarketInterval = ref();

            const GetTradeHistoryMarket = () => {
                StartGetMarketHistory();
                MarketInterval.value = setInterval(() => {
                    StartGetMarketHistory();
                }, 5000);

            }


            const getCoinPairs = async () => {
                const marketWsService = new WebSocket(`wss://trademen.codemen.me:1011/`);
                marketWsService.onopen = function (event) {
                    console.log('connection is open!')
                    var payload = {
                        event: 'setCoinPair',
                        bseCoin: state.selected?.base_coin ? state.selected?.trade_coin : oldBaseCoin,
                        tradeType: 'spot'
                    };
                    marketWsService.send(JSON.stringify(payload))
                }


                // marketWsService.onmessage = function (event) {
                //     console.log('message event data looks like this: ', event.data)
                // }
                // state.loading = true;
                // var payload = {
                //     event: 'setCoinPair',
                //     bseCoin: state.SpotCoinBaseSelected
                // };
                // console.log('payload', payload)
                // marketWsService.send(JSON.stringify(payload));
                // state.loading = false;
                // clearForm();
                // GetTradesHistoryMy();
                // toast.add({severity:'success', summary: 'Order is Set', detail:"", life: 3000});

            }


            onUnmounted(() => {
                if (ligtChart) {
                    chart.remove();
                    ligtChart = null;
                }
            });

            onMounted(() => {
                currentPathName.value = window.location.pathname;
                getOrders();
                GetDepthData();
                setMarketPrice();
                getCoinPairs();
                initDephChart();
                initTv();
                MyOpenOrders();
                MyTradesHistories();
                initUserWalletSummary();
                GetTradeHistoryMarket();
                recentTrade();
                try {
                    ChangeTitle();
                } catch {
                }
            });

            return {
                ...toRefs(state),
                op,
                toggle,
                setCoinPairs,
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
                oldTradeCoin
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

    createApp(App)
        .use(primevue.config.default, {ripple: true})
        .use(primevue.toastservice)
        .mount("#app");

</script>