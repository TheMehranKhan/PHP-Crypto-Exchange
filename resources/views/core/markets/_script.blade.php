<script src="{{asset('plugins/datatables/datatables.min.js')}}"></script>
<script src="{{asset('plugins/datatables/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/datatables/table-datatables-responsive.min.js')}}"></script>
<script>
    "use strict";
    var livePrice = new Vue({
        el: '#livePrice',
        data: {
            tickers: [],
            loading: false
            // tickers: JSON.parse(`{{json_encode($tickers)}}`.replace(/&quot;/g, '"'))
        },
        created() {
            this.setMarketPrice()
            this.subscribeOrderBroadcast()
        },
        methods: {
            Currency(value) {
                if (typeof value === 'string') {
                    let temp = Number(value).toFixed(3)
                    let temp2 = temp.toString().split('.')
                    temp2[0] = temp2[0].replace(/\B(?=(\d{3})+(?!\d))/g, ',')
                    return `${temp2[0]}.${temp2[1]}`
                }
            },
            orderBroadcastChannel: function(symbol) {
                return "{{ config('broadcasting.prefix') }}" + 'order.' + symbol;
            },
            async loadTicker(data) {

                var response = await axios.get(`/api/public?command=returnTickerHome&tradePair=${data.trade_pair}`)
                var index = this.tickers.findIndex(item => item.symbol === data.trade_pair);
                if (typeof response.data[0].last_price !== 'undefined') {
                    this.setAnimation(this.tickers[index].last_price, response.data[0].last_price, data.trade_pair)
                    this.tickers[index] = response.data[0]
                    this.$forceUpdate()
                }

            },
            subscribeOrderBroadcast() {
                const currentInstance = this;
                this.tickers.forEach((ticker) => {
                    Echo.channel(currentInstance.orderBroadcastChannel(ticker.symbol))
                        .listen('.order.created', function(data) {
                            setTimeout(function() {
                                currentInstance.loadTicker(data)
                            }, 5000);
                        })
                })
            },
            setAnimation(oldPrice, livePrice, id) {
                var color = oldPrice < livePrice ? 'rgba(24,158,107,0.32)' : 'rgba(245,0,87,0.28)'
                document.getElementById(id).style.backgroundColor = color
                setTimeout(function() {
                    document.getElementById(id).style.backgroundColor = ''
                }, 1000);
            },
            setMarketPrice() {
                this.loading = true
                const self = this
                const link = `{{route('exchange.index')}}`;
                const wsService = new WebSocket(`wss://trademen.codemen.me:1011/`);
                wsService.onmessage = function(ev) {
                    if (ev && ev.data) {
                        if (/^[\],:{}\s]*$/.test(String(ev.data).replace(/\\["\\\/bfnrtu]/g, '@').replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
                            const wsData = JSON.parse(ev.data).codemen;
                            if (!(!wsData || Object.keys(wsData).length === 0)) {
                                if (wsData) {
                                    const marketPrice = JSON.parse(ev.data)?.binance ?? {};
                                    console.log('testttttt',marketPrice)
                                    self.loading = false
                                    let _marketList = [...wsData];
                                    self.tickers = _marketList.map((_item) => {

                                        console.log('testttttt',_item)
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
                                            _item.coin_pair = _selectedWs?.quote ? _selectedWs?.quote +'_'+ _selectedWs?.base : null;
                                            _item.marketLink = link + '/' + _item.coin_pair;
                                        }

                                        return _item;
                                    });
                                    console.log(self.tickers, 'all Data');
                                }
                            }

                        }
                    }
                }
            },
        }
    })

    $(".owl-carousel").owlCarousel({
        loop: false,
        margin: 10,
        nav: false,
        dots: false,
        itemElement: 'LI',
        stageElement: 'UL',
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 3
            },
            1000: {
                items: 4
            }
        }
    });
</script>