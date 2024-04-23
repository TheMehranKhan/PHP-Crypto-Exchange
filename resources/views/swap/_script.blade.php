<script src="{{asset('plugins/datatables/datatables.min.js')}}"></script>
<script src="{{asset('plugins/datatables/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/datatables/table-datatables-responsive.min.js')}}"></script>
<script src="https://cdn.jsdelivr.net/npm/@flasher/flasher@1.2.4/dist/flasher.min.js"></script>
<script>
    // import Template from '{Template}/Web/Pages/Market/Swap.template'
    // import AppLayout from '@/Layouts/AppLayout'
    // import TableFilter from "@/Mixins/Filter/TableFilter";
    // import IconFilter from "@/Components/Table/IconFilter";
    // import {mapGetters} from "vuex";
    // import {math_formatter, math_percentage} from "@/Functions/Math";
    // let numeral = require('numeral');
    // var $ = require( "jquery" );

    "use strict";
    var swapForm = new Vue({
        el: '#swapForm',
        props: {
            currencies: Object,
            defaultBasePair: String,
            defaultQuotePair: String
        },
        data: {
            tickers: JSON.parse(`{{json_encode($tickers)}}`.replace(/&quot;/g, '"')),
            coins: JSON.parse(`{{json_encode($coins)}}`.replace(/&quot;/g, '"')),
            reversed: false,
            processing: false,
            isLoading: false,
            processing_balance: false,
            placingOrder: false,
            placedOrder: false,
            form: {
                quote_amount: null,
                base_amount: null,
                market_id: null,
            },
            basePair: {},
            quotePair: {},
            exchangeRate: null,
            lastPrice: null,
            baseRate: null,
            selectedMarket: null,
            selectedMarketBase: null,
            error: null,
            balance: '0.00',
            exchangeState: false,
            fee: [],
            vip: 0,
            fee_rate3: 0,
            quoteMarkets1: [],
            price: 0,
            marketError: false,
            user: JSON.parse(`{{json_encode(Auth::user())}}`.replace(/&quot;/g, '"')),
            firstCoinSearch: '',
            secondCoinSearch: ''
        },
        computed: {
            firstCoinList() {
                return this.coins.filter(coin => {
                    return coin.symbol.toLowerCase().includes(this.firstCoinSearch.toLowerCase())
                })
            },
            secondCoinList() {
                return this.coins.filter(coin => {
                    return coin.symbol.toLowerCase().includes(this.secondCoinSearch.toLowerCase())
                })
            },
            baseMarkets: function() {
                // return _.filter(this.currencies, (market) => {
                //     console.log("asdas", market)
                //     return market;
                // });
            },
            // quoteMarkets: function () {
            //     return _.filter(this.quoteMarkets1, (market) => {
            //         return market.id != this.basePair;
            //     });
            // },
            fee_percentage: function() {
                // if(!_.isEmpty(this.fee)) {
                //     if(this.selectedMarket=="USDTIRT"){
                //         this.fee_rate3=0.45+this.fee.fee[this.vip];
                //     }
                //     else{
                //         this.fee_rate3=1.05+this.fee.fee[this.vip];
                //     }
                //     if(!this.form.base_amount) return 0;
                //     let quote_amount=parseFloat(this.form.base_amount) * parseFloat(this.exchangeRate);
                //     if(quote_amount==0) return 0;
                //     return math_percentage(quote_amount,this.fee_rate3);
                // }
                // else{
                return 0;
                // }{!! json_encode($tickers) !!}
                },
            },
            mounted() {
                var base = this.coins.filter((coin) => {
                    return coin.symbol === this.tickers[0].base_coin;
                })
                this.basePair = base[0]
                this.selectedMarketBase = base[0].symbol
                this.selectedMarket = this.tickers[0].symbol
                this.exchangeRate = this.tickers[0].last
                console.log(this.tickers, this.selectedMarket, this.exchangeRate, 'sdflkds');
                var quote = this.coins.filter((coin) => {
                    return coin.symbol === this.tickers[0].trade_coin;
                })
                this.quotePair = quote[0]
                this.getBalance(base[0].symbol)
                this.lastPrice = this.exchangeRate;
                this.baseRate = this.exchangeRate;
            },
            methods: {
                changeCoin() {
                    this.balance = '0.00';
                    this.getBalance(this.basePair.symbol)
                    var baseSymbol = this.basePair.symbol + '_' + this.quotePair.symbol
                    var baseFilter = this.tickers.filter((market) => {
                        return market.symbol === baseSymbol;
                    })
                    var quoteSymbol = this.quotePair.symbol + '_' + this.basePair.symbol
                    var quoteFilter = this.tickers.filter((market) => {
                        return market.symbol === quoteSymbol;
                    })

                    if (baseFilter.length > 0) {
                        this.selectedMarket = baseFilter[0].symbol
                        this.exchangeRate = baseFilter[0].last
                        this.selectedMarketBase = baseFilter[0].base_coin
                        this.baseRate = baseFilter[0].last;
                        this.marketError = false
                    } else if (quoteFilter.length > 0) {
                        this.selectedMarket = quoteFilter[0].symbol
                        this.exchangeRate = 1 / quoteFilter[0].last
                        this.selectedMarketBase = quoteFilter[0].base_coin
                        this.baseRate = quoteFilter[0].last;
                        this.marketError = false
                    } else {
                        this.marketError = true
                        this.exchangeRate = 'N/A'

                    }
                },
                changeType() {
                    this.clearInput()
                    if (this.selectedMarketBase == this.basePair.symbol) {
                        var symbol = this.basePair.symbol + '_' + this.quotePair.symbol
                        var filter = this.tickers.filter((market) => {
                            return market.symbol === symbol;
                        })
                        if (filter.length > 0) {
                            this.exchangeRate = 1 / filter[0].last
                            this.baseRate = filter[0].last;
                        }
                    } else {
                        var symbol = this.quotePair.symbol + '_' + this.basePair.symbol
                        var filter = this.tickers.filter((market) => {
                            return market.symbol === symbol;
                        })
                        if (filter.length > 0) {
                            this.exchangeRate = filter[0].last
                            this.baseRate = filter[0].last;
                        }
                    }
                    var baseCoin = this.basePair;
                    var quoteCoin = this.quotePair;
                    this.basePair = quoteCoin;
                    this.quotePair = baseCoin;
                    this.changeCoin()
                    this.getBalance(this.basePair.symbol)
                },
                // decimal_format(value) {
                //
                //     let  formatted = numeral(value).format('000,000.00000000');
                //
                //
                //     return formatted;
                // },
                getBalance(symbol) {

                    if (this.processing_balance) return;
                    this.processing_balance = true;

                    if (this.user != null) {
                        axios.post(`{{route('user.balance')}}`, {
                            'user_id': this.user.id,
                            'symbol': symbol
                        }).then((res) => {

                            this.processing_balance = false;

                            if (res.data && res.data != null) {
                                // this.balance = parseFloat(res.data.balance).toFixed(8);
                                this.balance = parseFloat(res.data).toFixed(8);
                                return;
                            } else {
                                this.balance = '0.00';
                            }
                            // this.error = res.data.message;
                        }).catch((error) => {
                            this.processing_balance = false;
                        });
                    } else {
                        this.balance = '0.00';
                    }

                },
                injectBalance() {
                    this.form.base_amount = this.balance;
                },
                submitExchange() {

                    this.isLoading = true;

                    if (this.user === null) return;

                    // if(!this.selectedMarket || this.placingOrder) return;

                    this.placingOrder = true;

                    let action = this.selectedMarketBase == this.basePair.symbol ? 'sell' : 'buy';

                    let token = document.head.querySelector('meta[name="csrf-token"]');

                    if (token) {
                        window.axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
                    } else {
                        console.error('CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token');
                    }

                    setTimeout(() => {

                        this.exchangeState = 'searching';

                        let amount = (action == 'sell') ? bcmul(this.form.base_amount, 1, 8) : bcmul(this.form.quote_amount, 1, 8)

                        let price = (action == 'sell') ? bcmul(this.exchangeRate,1,8) : bcmul(this.baseRate,1,8)

                        let data = {
                            order_type: action,
                            category: 'market',
                            trade_pair: this.selectedMarket,
                            price: price,
                            amount: bcmul(amount,1, 8),
                            total: bcmul(amount * price, 1, 8),
                            swap: true,
                        };


                        axios.post(`{{route('user.order.store')}}`, data).then((response) => {
                            swapForm.loading = true;
                            this.placingOrder = false;
                            this.exchangeState = false;
                            this.placedOrder = true;
                            this.changeCoin()
                            this.clearInput()
                            if(response.data.success){
                                flasher.success(response.data.message);
                            } else {
                                flasher.error(response.data.message);
                            }
                            this.isLoading = false;
                        }).catch(error => {
                            this.placingOrder = false;
                            this.exchangeState = false;
                            this.placedOrder = false;
                            this.clearInput()
                            flasher.error(error.response.data.message);
                            this.isLoading = false;

                        });

                    }, 1000);

                },
                handleInput($event) {

                    let keyCode = ($event.keyCode ? $event.keyCode : $event.which);

                    if ((keyCode < 48 || keyCode > 57) && (keyCode !== 46 || this.form.base_amount.toString().indexOf('.') != -1)) {
                        $event.preventDefault();
                    }

                    let precision = 8;

                    // restrict to 2 decimal places
                    if (this.form.base_amount != null && this.form.base_amount.toString().indexOf(".") > -1 && (this.form.base_amount.toString().split('.')[1].length >= 99)) {
                        $event.preventDefault();
                    }
                },
                clearInput($event) {
                    this.form.base_amount = 0.00;
                    this.form.quote_amount = 0.00;
                },
                startNewTrade() {
                    this.placedOrder = false;
                },
            },
            watch: {
                'form.base_amount'(newVal) {
                    if (!newVal) {
                        return
                    }
                    if (newVal.toString().includes('.')) {
                        this.form.base_amount = newVal.split('.')[0] + '.' + newVal.split('.')[1].slice(0, 8)
                    }

                    if (this.selectedMarketBase == this.basePair.symbol) {
                        console.log('111', this.selectedMarketBase)
                        var symbol = this.basePair.symbol + '_' + this.quotePair.symbol
                        var filter = this.tickers.filter((market) => {
                            return market.symbol === symbol;
                        })
                        if (filter.length > 0) {
                            this.form.quote_amount = this.form.base_amount * filter[0].last;
                        }
                    } else {

                        var symbol = this.quotePair.symbol + '_' + this.basePair.symbol
                        var filter = this.tickers.filter((market) => {
                            return market.symbol === symbol;
                        })
                        if (filter.length > 0) {
                            this.form.quote_amount = this.form.base_amount * (1 / filter[0].last);
                        }
                    }

                },
                'form.quote_amount'(newVal) {
                    if (!newVal) {
                        return
                    }
                    if (newVal.toString().includes('.')) {
                        this.form.base_amount = newVal.split('.')[0] + '.' + newVal.split('.')[1].slice(0, 8)
                    }
                    if (this.selectedMarketBase == this.basePair.symbol) {
                        var symbol = this.basePair.symbol + '_' + this.quotePair.symbol
                        var filter = this.tickers.filter((market) => {
                            return market.symbol === symbol;
                        })
                        if (filter.length > 0) {
                            this.form.base_amount = this.form.quote_amount / filter[0].last;
                        }
                    } else {
                        var symbol = this.quotePair.symbol + '_' + this.basePair.symbol
                        var filter = this.tickers.filter((market) => {
                            return market.symbol === symbol;
                        })
                        if (filter.length > 0) {
                            this.form.base_amount = this.form.quote_amount * filter[0].last;
                        }
                    }

                },

            }
        })
</script>