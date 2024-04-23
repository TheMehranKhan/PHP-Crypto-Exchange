<script type="module">
    const {createApp, ref, reactive, onMounted, toRefs, onUnmounted, computed} = Vue;
    const {FilterMatchMode, FilterOperator} = primevue.api;
    const {useToast} = primevue.usetoast;

    const App = {
        setup() {
            const toast = useToast();
            const chartContainer = ref();
            const state = reactive({
                isSentList: false,
                chartSelectedTab: 0,
                orderBookSelectedTab: 0,
                historySelectedTab: 0,
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
                    global: {value: null, matchMode: FilterMatchMode.CONTAINS},
                },
                userBalance: null,
                quantity: null,
                levrage: 1,
                stopPrice: null,
                loading: false,
                futuresType: 'Cross',
                positions: [],
                showClosePositionDialog: false,
                recountTrade: [],
                coinex: {},
                tvIsEnabeld: true,
                sidebar: false,
                closePostionDetails: {
                    size: 1,
                    id: ''
                },
                calcAmount: {
                    bids: 0,
                    asks: 0
                },
                editPosition: {
                    dialog: false,
                    tp: null,
                    sl: null,
                    id: null,
                    data: null
                },
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
            const leverageList = [
                {label: '1X', value: 1},
                {label: '5X', value: 5},
                {label: '10X', value: 10},
                {label: '15X', value: 15},
                {label: '25X', value: 25},
                {label: '50X', value: 50},
                {label: '75X', value: 75},
                {label: '100X', value: 100},
            ]
            const SpotCoinsTabs = ['USDT', 'BTC', 'USDC', 'DAI', 'EUR'];
            const SpotCoinsSubTabs = ['All', 'Fan Token', 'Leverage Tokens', 'Margin Trading'];

            const marks = [0, 25, 50, 75, 100];
            const chartdiv = ref();

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
            const indexOfSelectedParam = window.location.pathname.split('/').indexOf('futures') + 1
            let Ss = indexOfSelectedParam === 2 ? `{{request()->segment(2)}}` : `{{request()->segment(3)}}`
            if (!Ss || Ss == "") {
                Ss = "BTC";
            } else {
                Ss = Ss.replace("_USDT", "");
            }
            const getOldSymbol = Ss;
            var marketWsService = null;
            const setMarketPrice = () => {

                state.wsAssets.loading = true;
                var userid = document.getElementById("userid")?.innerHTML;
                marketWsService = new WebSocket(`wss://trademen.codemen.me:1011/`);


                marketWsService.onmessage = function (ev) {
                    if (state.isSentList == false) {
                        marketWsService.send(JSON.stringify({
                            event: "list",
                            token: userid
                        }));
                        state.isSentList = true;
                    }
                    if (ev && ev.data) {
                        if (checkJson(String(ev.data))) {
                            var dataReceive = JSON.parse(ev.data);
                            if (!dataReceive.event) {
                            } else {
                                if (dataReceive.event == "trade") {
                                    // console.log(dataReceive );
                                    GetMyOrders();
                                    state.loading = false;
                                    if (dataReceive.isok == false) {
                                        toast.add({
                                            severity: 'error',
                                            summary: 'Error',
                                            detail: dataReceive.msg,
                                            life: 3000
                                        });
                                    } else {
                                        toast.add({
                                            severity: 'success',
                                            summary: 'Success',
                                            detail: dataReceive.msg,
                                            life: 3000
                                        });
                                    }
                                } else if (dataReceive.event == "list") {
                                    console.log('dataReceive.list', dataReceive.list);
                                    state.positions = [...dataReceive.list];
                                }
                            }
                            const wsData = JSON.parse(ev.data).codemen;
                            if (!(!wsData || Object.keys(wsData).length === 0)) {
                                if (wsData) {
                                    const marketPrice = JSON.parse(ev.data)?.coinex ?? {};

                                    state.coinex = JSON.parse(ev.data)?.coinex;

                                    const indexOfSelectedParam = window.location.pathname.split('/').indexOf('futures') + 1
                                    let selectedParams = indexOfSelectedParam === 2 ? `{{request()->segment(2)}}` : `{{request()->segment(3)}}`
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

                                    state.wsAssets.loading = false;
                                    state.wsAssets.data = wsData;

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
                                            _item.circulation = _selectedWs.circulation;
                                            _item.circulation_usd_rank = _selectedWs.circulation_usd_rank;
                                            _item.volume_usd = _selectedWs.volume_usd;
                                            _item.change_rate_30d = _selectedWs.change_rate_30d;
                                        }

                                        return _item;
                                    });

                                    state.selected = state.wsAssets.marketList.find((_item) => _item.trade_coin == state.selected?.trade_coin ?? getOldSymbol)


                                    const finded = state.wsAssets.marketList.find((item) => item.trade_coin == getOldSymbol);
                                    if (!state.selected) state.selected = finded;
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
            const walletInterval = ref();
            const initUserWalletSummary = () => {
                GetBalance();
                if (walletInterval.value) {
                    clearInterval(walletInterval.value);
                }
                state.userBalance = null;
                walletInterval.value = setInterval(() => {
                    GetBalance();
                }, 5000);
            }

            const GetBalance = () => {
                @auth
                axios({
                    method: 'get',
                    url: "{{ route('exchange.get-wallet-summary') }}",
                    params: {
                        coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_USDT' : getOldSymbol + "_USDT"
                    }
                }).then((response) => {
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

            const GetDepthData = () => {
                try {
                    const url = `wss://trademen.codemen.me:1011/?market=${state.selected?.trade_coin ? state.selected?.trade_coin + 'USDT' : getOldSymbol + 'USDT'}`
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

                                        orderBook.ask.sort((a, b) => Number(b[2]) - Number(a[2]));
                                        state.calcAmount.asks = (askTotal / orderBook.ask.length).toFixed(6);
                                        state.calcAmount.bids = (bidTotal / orderBook.bid.length).toFixed(6);

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
                    const url = `wss://trademen.codemen.me:1011/?market=${state.selected?.trade_coin ? state.selected?.trade_coin + 'USDT' : getOldSymbol + 'USDT'}`
                    // console.log(url);
                    wsController.value = new WebSocket(url);
                    wsController.value.onmessage = function (ev) {
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

                                        const averagePrice = (askAverage + bidAverage) / (orderBook.ask.length + orderBook.bid.length)

                                        //end ask
                                        const {ask, bid} = orderBook;

                                        state.averagePrice = Number(averagePrice).toFixed(8);
                                        state.orderBooks = orderBook;
                                        try {
                                            ChangeTitle()
                                        } catch {
                                        }
                                    }
                                }
                            }
                        }
                    };
                } catch (error) {

                }


            }
            const initTv = () => {
                new TradingView.widget(
                    {
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
                    }
                );
            }

            const onRowSelect = (event) => {
                console.log(event.data);
                state.selected = event.data;
                // toast.add({severity:'success', summary: 'Success Message', detail:'Message Content', life: 3000});
                // toast.add({severity:'error', summary: 'Error Message', detail:'Message Content', life: 3000});
                const _finded = state.coinex[event.data.trade_coin] ?? null;
                if (!!_finded != state.tvIsEnabeld) {
                    state.tvIsEnabeld = !!_finded;
                    state.chartSelectedTab = 0;
                }
                const stateurl = {'user': 'guest'};
                let mainCurrentPathName = currentPathName.value.substring(0, currentPathName.value.indexOf('futures') + 'futures'.length);
                window.history.pushState(stateurl, '', `${mainCurrentPathName}/${event.data.trade_coin}_USDT`);

                op.value.hide();
                if (!!wsController.value) {
                    wsController.value.close();
                    wsController.value = null;
                    wsDepthControl.value.close();
                    wsDepthControl.value = null;
                    initUserWalletSummary();
                    clearForm();
                    MyOpenOrders();
                    MyTradesHistories();
                    chartContainer.value = null;
                    state.showCandelChart = false;
                    localStorage.setItem('symbol', state.selected.trade_coin)
                    setTimeout(() => {
                        state.showCandelChart = true;
                        initLiveChart();
                    }, 1500);
                    setTimeout(() => {
                        recentTrade();
                        getOrders();
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
                return state.wsAssets?.data.find((item) => item.trade_coin == state.selected?.trade_coin ?? getOldSymbol)?.latest_price ?? 0;
            })
            const getWsPrice = () => {
                return state.wsAssets?.data.find((item) => item.trade_coin == state.selected?.trade_coin ?? getOldSymbol)?.latest_price ?? 0;
            }

            const calc = () => {

                const {tradeType, orderPrice, quantity, isBuy, userBalance, selected, levrage} = state;

                const price = (tradeType == 1 || tradeType == 3) ? orderPrice : getWsPrice();
                const amount = quantity;
                if (!!userBalance) {
                    const balance = isBuy ? Number(userBalance?.base_coin_balance) : Number(userBalance?.trade_coin_balance) * Number(selected?.latest_price ?? 0);
                    // const final = isBuy ? amount * price : price / amount;
                    const final = (selected.trade_coin == 'IRT' ? amount : amount * price) / levrage;
                    console.log('price', price);
                    console.log('amount', amount);
                    console.log('final', final);
                    console.log('userBalance', userBalance);
                    state.orderValue = final;

                    const val = (((selected.trade_coin == 'IRT' ? amount : amount * price) / balance) * 100) / levrage;
                    state.volume = Math.round(val);
                    console.log('val', val)
                    // calcSlider(val);

                }
            }


            const clearForm = () => {
                state.quantity = null;
                state.orderPrice = null;
                state.orderValue = null;
                state.volume = 0;
            }

            const calcSlider = (value) => {

                const {tradeType, quantity, orderPrice, levrage, userBalance, isBuy, selected} = state;
                const price = (tradeType == 1 || tradeType == 3) ? orderPrice : getWsPrice();
                if (Number(price) > 0 && value > 0 && !!userBalance && selected?.latest_price) {
                    const balance = isBuy ? userBalance?.base_coin_balance : Number(userBalance?.trade_coin_balance) * Number(selected?.latest_price ?? 0);

                    const balanceUSDT = Number(balance);
                    const PriceusedUSDT = (balanceUSDT * value) / 100;

                    const AmountOfCrypto = (selected.trade_coin == 'IRT' ? PriceusedUSDT : PriceusedUSDT / price) * levrage;

                    if (balanceUSDT) {
                        state.quantity = AmountOfCrypto;
                        state.orderValue = (selected.trade_coin == 'IRT' ? AmountOfCrypto : AmountOfCrypto * price) / levrage;
                    } else clearForm()
                } else {
                    toast.removeAllGroups();
                    setTimeout(() => {
                        toast.removeAllGroups();
                        if (!state?.userBalance) {
                            toast.add({severity: 'error', summary: 'Error', detail: 'Please Login First', life: 3000});
                        }
                        clearForm();
                    }, 500);
                }
            }

            const getToken = () => {
                const value = `; ${document.cookie}`;
                const parts = value.split(`; XSRF-TOKEN=`);
                if (parts.length === 2) return parts.pop().split(';').shift();
            }

            const onSubmit = () => {
                CreateOrder()
                return
                console.log("Run On Submit Func", state);
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
                    if (userBalance?.base_coin_balance < orderValue) {
                        return toast.add({
                            severity: 'error',
                            summary: 'Balance Error',
                            detail: 'Balance Not Enogh',
                            life: 3000
                        });
                    }
                } else {
                    if (userBalance?.trade_coin_balance < quantity) {
                        return toast.add({
                            severity: 'error',
                            summary: 'Balance Error',
                            detail: 'Balance Not Enogh',
                            life: 3000
                        });
                    }
                }
                console.log("Run On Submit Func 11");

                CreateOrder(Number(orderPrice).toFixed(8), Number(quantity).toFixed(8), Number(orderValue).toFixed(8), _category, _order_type, selected.trade_pair, stopPrice)
                console.log("Run On Submit Func 22");

            }

            const CreateOrder = async () => {
                var isauth = document.getElementById("auth")?.innerHTML;
                if (isauth == "ok") {
                    var userid = document.getElementById("userid")?.innerHTML;
                    const {
                        stopPrice,
                        quantity,
                        futuresType,
                        orderPrice,
                        levrage,
                        orderValue,
                        tradeType,
                        isBuy,
                        selected,
                        userBalance
                    } = state;
                    const _category = ['limit', 'market', 'stop_limit'][tradeType - 1];
                    console.log('orderValue', orderValue);
                    state.loading = true;
                    var payload = {
                        event: 'futuretrade',
                        side: isBuy ? 'buy' : 'sell',
                        type: _category,
                        size: orderValue,
                        price: _category == "market" ? undefined : orderPrice,
                        ismarket: _category == "market",
                        leverage: levrage,
                        token: userid,
                        cross: futuresType == 'Cross' ? true : false,
                        symbol: state.selected?.trade_coin ? state.selected?.trade_coin + '_USDT' : getOldSymbol + "_USDT",
                        stop: stopPrice || null
                    };
                    console.log('payload', payload)
                    marketWsService.send(JSON.stringify(payload));
                    state.loading = false;
                    // clearForm();
                    // GetTradesHistoryMy();
                    // toast.add({severity:'success', summary: 'Order is Set', detail:"", life: 3000});
                }

            }

            // const CreateOrder = async (price, amount, total, category, order_type, trade_pair, stop) => {
            //     var isauth = document.getElementById("auth")?.innerHTML;
            //     if (isauth == "ok") {
            //         state.loading = true;
            //         var userid = document.getElementById("userid")?.innerHTML;
            //         console.log(price, amount);
            //
            //         var payload = {};
            //         payload.event = 'futuretrade';
            //         payload.leverage = state?.levrage || '1'
            //         if (category == "market") {
            //             payload.total = total;
            //             payload.trade_pair = trade_pair;
            //             payload.Symbol = trade_pair;
            //             payload.amount = amount;
            //             payload.type = category;
            //             payload.side = order_type;
            //             payload.token = userid;
            //             payload.size = total;
            //         } else if (category == "stop_limit") {
            //             payload.total = total;
            //             payload.stop = stop;
            //             payload.price = price;
            //             payload.amount = amount;
            //             payload.type = category;
            //             payload.trade_pair = trade_pair;
            //             payload.Symbol = trade_pair;
            //             payload.side = order_type;
            //             payload.token = userid;
            //             payload.size = total;
            //         } else if (category == "limit") {
            //             payload.price = price;
            //             payload.amount = amount
            //             payload.total = total;
            //             payload.type = category;
            //             payload.trade_pair = trade_pair;
            //             payload.Symbol = trade_pair;
            //             payload.side = order_type;
            //             payload.token = userid;
            //             payload.size = total;
            //         }
            //
            //         console.log('payloadd', JSON.stringify(payload))
            //         marketWsService.send(JSON.stringify(payload));
            //         state.loading = false;
            //         // clearForm();
            //         // GetTradesHistoryMy();
            //         // toast.add({severity:'success', summary: 'Order is Set', detail:"", life: 3000});
            //
            //
            //         // let res = await axios.post("https://trademen.codemen.me/user/orders/futuretrade", payload);
            //         // // console.log('new order ', res.data);
            //         // try {
            //         //     var data = res.data;
            //         //     console.log(data);
            //         //
            //         //     toast.add({
            //         //         severity: 'success',
            //         //         summary: 'Order Created',
            //         //         detail: data.message,
            //         //         life: 3000
            //         //     });
            //         //
            //         // } catch {
            //         //     toast.add({
            //         //         severity: 'error',
            //         //         summary: 'Server Error',
            //         //         detail: "",
            //         //         life: 3000
            //         //     });
            //         // } finally {
            //         //     state.loading = false; // in loading
            //         //     clearForm();
            //         //
            //         //     GetMyOrders();
            //         //
            //         // }
            //     }
            // }

            const CancleOrder = async (orderid) => {
                var ss = "{{ route('user.order.store') }}".replace("store", "");
                var url = ss + orderid + "/destroy";
                state.loading = true; // in loading
                let res = await axios.post(url, "_method=DELETE");
                if (res.success == true) {
                    toast.add({severity: 'success', summary: 'Order Cancled', detail: res.msg, life: 3000});
                } else {
                    toast.add({severity: 'error', summary: 'Order Cancled', detail: res.msg, life: 3000});
                }
                state.loading = false; // in loading
                GetMyOrders();
            }
            const historyInterval = ref();

            const MyTradesHistories = () => {
                GetTradesHistoryMy();
                if (historyInterval.value) {
                    clearInterval(historyInterval.value);
                }
                historyInterval.value = setInterval(() => {
                    GetTradesHistoryMy();
                }, 50000);
            }

            const GetTradesHistoryMy = () => {
                var isauth = document.getElementById("auth")?.innerHTML;
                if (isauth == "ok") {
                    var url = "{{ route('exchange.get-my-trades') }}";
                    axios({
                        method: 'get',
                        url: url,
                        params: {
                            coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_USDT' : getOldSymbol + "_USDT"
                        }
                    }).then((response) => {
                        state.history = response.data;
                    });
                }
            }

            const openOrderInterval = ref();
            const MyOpenOrders = () => {
                GetMyOrders();
                if (openOrderInterval.value) {
                    clearInterval(openOrderInterval.value);
                }
                openOrderInterval.value = setInterval(() => {
                    GetMyOrders();
                }, 5000);

            }

            const GetMyOrders = () => {
                var isauth = document.getElementById("auth")?.innerHTML;
                if (isauth == "ok") {
                    var url = "{{ route('exchange.get-my-open-orders') }}";
                    axios({
                        method: 'get',
                        url: url,
                        params: {
                            coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_USDT' : getOldSymbol + "_USDT"
                        }
                    }).then((response) => {
                        state.openOrders = response.data;
                    });
                }
            }


            const initLiveChart = () => {
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

                        console.log('item', _itemdata)
                        const bar = nextBar(_itemdata);
                        candleSeries.update(bar);
                        volumeSeries.update(bar);
                        _candelList.push(_itemdata);
                    });
                    console.log('_candeldata', _candelList);

                    resize();

                    window.addEventListener("resize", resize, false);

                    function resize() {
                        chart.applyOptions({width: chartContainer.value.clientWidth, height: 552});

                        setTimeout(() => chart.timeScale().fitContent(), 0);
                    }

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
            };


            const onClosePosition = () => {
                const {id, size} = state.closePostionDetails;
                var userid = document.getElementById("userid")?.innerHTML;
                if (size == 0) return toast.add({
                    severity: 'error',
                    summary: 'error',
                    detail: 'Close Percent Must be greater than 0',
                    life: 3000
                });
                const payload = {
                    event: 'futureclose',
                    id,
                    size,
                    token: userid
                };
                state.showClosePositionDialog = false;
                marketWsService.send(JSON.stringify(payload));
                toast.add({severity: 'success', summary: 'Success', detail: 'Order was Closed', life: 3000});
            };

            const setTpSl = () => {
                const {sl, id, tp} = state.editPosition;
                state.editPosition.dialog = false;
                const payload = {
                    event: 'tpsl',
                    tp,
                    sl,
                    id,
                    token: getToken()
                };
                marketWsService.send(JSON.stringify(payload))
            }

            const buyFloatingBalance = computed(() => {
                let _counter = 0;
                state.positions.forEach((item) => {
                    _counter += Number(item.size);
                });
                return Number(_counter.toFixed(8));
            });


            const ChangeTitle = () => {
                var price = state.averagePrice;
                if (!state.averagePrice) {
                    price = 0;
                }
                document.title = `${state.selected?.trade_coin ? state.selected?.trade_coin : getOldSymbol}` + " : " + price + " USDT";
            }
            const recentTrade = () => {
                var url = "https://trademen.codemen.me/exchange/get-trade-histories";
                axios({
                    method: 'get',
                    url: url,
                    params: {
                        coin_pair: state.selected?.trade_coin ? state.selected?.trade_coin + '_USDT' : getOldSymbol + "_USDT",
                        _: new Date().getTime()
                    }

                }).then((response) => {
                    console.log('history ', response);
                    state.recountTrade = response?.data ?? [];
                }).catch((err) => {
                    console.log('err', err);
                });
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
                initDephChart();
                initTv();
                MyOpenOrders();
                MyTradesHistories();
                initUserWalletSummary();
                initLiveChart();
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
                leverageList,
                onClosePosition,
                setTpSl,
                buyFloatingBalance,
                getOldSymbol
            };
        },
        components: {
            "p-button": primevue.button,
            "p-inputnumber": primevue.inputnumber,
            "p-dropdown": primevue.dropdown,
            "p-datatable": primevue.datatable,
            "p-column": primevue.column,
            "p-overlaypanel": primevue.overlaypanel,
            "p-checkbox": primevue.checkbox,
            "p-skeleton": primevue.skeleton,
            "p-inputtext": primevue.inputtext,
            "p-progressspinner": primevue.progressspinner,
            "p-toast": primevue.toast,
            "p-menu": primevue.menu,
            "p-selectbutton": primevue.selectbutton,
            "p-dialog": primevue.dialog,
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