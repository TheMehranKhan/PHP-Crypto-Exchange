<script src="{{asset('plugins/datatables/datatables.min.js')}}"></script>
<script src="{{asset('plugins/datatables/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/datatables/table-datatables-responsive.min.js')}}"></script>
<script src="https://cdn.jsdelivr.net/npm/@flasher/flasher@1.2.4/dist/flasher.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
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
    var stakeForm = new Vue({
        el: '#stake',
        props: {
            currencies: Object,
            defaultBasePair: String,
            defaultQuotePair: String
        },
        data: {
            coin: JSON.parse(`{{json_encode($coin)}}`.replace(/&quot;/g, '"')),
            stakes: JSON.parse(`{{json_encode($stake)}}`.replace(/&quot;/g, '"')),
            index: 0,
            selectedPeriod: null,
            endDate: null,
            estimateEarning: 0,
            processing: false,
            isLoading: false,
            processing_balance: false,
            placingOrder: false,
            placedOrder: false,
            form: {
                stake_amount: null,
                stake_id: null,
            },
            error: null,
            balance: '0.00',
            marketError: false,
            user: JSON.stringify(`{{json_encode(Auth::user())}}`.replace(/&quot;/g, '"')),
        },
        computed: {
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
                // }
                },
            },
            mounted() {
                this.getBalance(this.coin.symbol)
                this.selectedPeriod = this.stakes[this.index].stake_month
                let date = moment().add(this.selectedPeriod, 'M');
                this.endDate = date.format('MMMM Do YYYY');
            },
            methods: {
                changePeriod(index) {
                    this.clearInput()
                    this.index = index
                    this.selectedPeriod = this.stakes[this.index].stake_month
                    let date = moment().add(this.selectedPeriod, 'M');
                    this.endDate = date.format('MMMM Do YYYY');
                },
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
                submitExchange() {

                    this.isLoading = true;

                    if (this.user === null) return;

                    this.placingOrder = true;

                    let token = document.head.querySelector('meta[name="csrf-token"]');

                    if (token) {
                        window.axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
                    } else {
                        console.error('CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token');
                    }

                    let stake = this.stakes[this.index]
                    console.log('iddddd',stake.id)
                    setTimeout(() => {
                        let data = {
                            stake_package: stake.id,
                            amount: bcmul(this.form.stake_amount, 1, 8),
                            stake_policy: 1,
                        };

                        axios.post(`{{route('user.wallets.stakes.store', $coin->symbol)}}`, data).then((response) => {
                            stakeForm.loading = true;
                            this.placingOrder = false;
                            this.placedOrder = true;
                            this.clearInput()
                            if(response.data.success){
                                flasher.success(response.data.message);
                            } else {
                                flasher.error(response.data.message);
                            }
                            this.isLoading = false;
                        }).catch(error => {
                            this.placingOrder = false;
                            this.placedOrder = false;
                            this.clearInput()
                            flasher.error(error.response.data.message);
                            this.isLoading = false;

                        });

                    }, 1000);

                },
                handleInput($event) {

                    let keyCode = ($event.keyCode ? $event.keyCode : $event.which);

                    if ((keyCode < 48 || keyCode > 57) && (keyCode !== 46 || this.form.stake_amount.toString().indexOf('.') != -1)) {
                        $event.preventDefault();
                    }

                    let precision = 8;

                    // restrict to 2 decimal places
                    if (this.form.stake_amount != null && this.form.stake_amount.toString().indexOf(".") > -1 && (this.form.stake_amount.toString().split('.')[1].length >= 99)) {
                        $event.preventDefault();
                    }
                },
                clearInput($event) {
                    this.form.stake_amount = null;
                },
                startNewTrade() {
                    this.placedOrder = false;
                },
            },
            watch: {
                'form.stake_amount'(newVal) {
                    if (!newVal) {
                        return
                    }
                    if (newVal.toString().includes('.')) {
                        this.form.stake_amount = newVal.split('.')[0] + '.' + newVal.split('.')[1].slice(0, 8)
                    }
                    let stake = this.stakes[this.index]
                    if(stake.stake_earning_type === 'fixed'){
                        this.estimateEarning = stake.stake_earning
                    } else {
                        this.estimateEarning = newVal * (stake.stake_earning / 100)
                    }

                },
            }
        })
</script>