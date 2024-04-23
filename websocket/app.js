var https = require('https');
var fs = require('fs');
var WS = require('ws');

var ChartData = require('./chartdata');

var Certfile = "/usr/local/directadmin/data/users/trademenn/domains/trademen.codemen.me.cert";
var PrivateKey = "/usr/local/directadmin/data/users/trademenn/domains/trademen.codemen.me.key";

const server = https.createServer({
    cert: fs.readFileSync(Certfile),
    key: fs.readFileSync(PrivateKey)
});
const wss = new WS.WebSocketServer({server});
process.setMaxListeners(0);
var request = require('request');
var SymbolsCoinex = [];
var MarketSub = [];
var WSMarkets = {};
var SendPrice = {};
var NewPriceMarket = {codemen: [], binance: {}};

var marketArr = [];

var Kucoin = require('./kucoin');
Kucoin.SetChartData(ChartData);
wss.on('connection', function connection(ws, req) {
    var market = "";
    try {
        var URL = req.url.toString();
        market = URL.split("?")[1].split("=")[1];
    } catch {
        market = "";
    }
    if (typeof market == "undefined") {
        market = ""
    }
    market = market.toUpperCase();
    ws.id = makeid(70);
    marketArr = market.split('_')
    ws.market = market.replace("_", "");
    ws.baseCoin = marketArr[0];
    ws.tradeCoin = marketArr[1];
    ws.on('message', function message(data) {
        try {
            data = data.toString('utf8')
            data = JSON.parse(data);

            if(data.tradeType != "undefined" && data.tradeType != "spot"){
                Kucoin.UpdateOrders(data.token);


                if (data.event == "futuretrade") {
                    const {side, type, size, price, ismarket, leverage, token, cross, symbol, stop} = data;
                    // if(data.ismarket==true){
                    // Kucoin.CreateOrderMarket(data.type,data.symbol.replace("_BTC",""),data.leverage,data.size,function(isok,orderid,cid,msg){
                    Kucoin.CreateOrderMarket(side, type, size, price, ismarket, leverage, token, cross, symbol.replace("_BTC", ""), stop, function (isok, orderid, cid, msg) {
                        if (isok == true) {
                            // ChartData.SaveFuture(data.symbol.replace("_BTC",""),data.token,orderid,data.leverage,data.size,0,data.type,"market",cid,function(isok){
                            ChartData.SaveFuture(symbol.replace("_BTC", ""), token, orderid, leverage, size, price, side, type, cid, stop, function (isok) {
                                ws.send(JSON.stringify({
                                    event: "trade",
                                    isok: true,
                                    msg: msg
                                }));
                            })
                        } else {
                            if (orderid == "notsupport") {
                                ws.send(JSON.stringify({
                                    event: "trade",
                                    isok: false,
                                    msg: msg
                                }));
                            } else {
                                ws.send(JSON.stringify({
                                    event: "trade",
                                    isok: false,
                                    msg: msg
                                }));
                            }

                        }
                    })
                    // }

                } else if (data.event == "futureclose") {
                    Kucoin.ClosePositionMarket(data.id, data.token, function (isok) {
                        ws.send({
                            event: "closeorder",
                            isok: true
                        });
                    })
                } else if (data.event == "tpsl") {

                } else {
                    ws.userid = data.token;
                    setInterval(() => {
                        ChartData.GetFuturesOpen(data.token, async function (list) {
                            var data = {
                                event: "list",
                                list: list
                            }
                            ws.send(JSON.stringify(data));
                        })
                    }, 5000);
                }
            }
        } catch (e) {
            console.log(e);
        }
    });
    ws.on('close', async function () {
        if (ws.market == "" || !ws.market) {
            return delete SendPrice[ws.id];
        } else {
            delete WSMarkets[ws.market][ws.id];
            if (Object.keys(WSMarkets[ws.market]).length == 0) {
                delete WSMarkets[ws.market];
                var base = ws.baseCoin;
                var quote = ws.tradeCoin;
                const submarket = {
                    id: ws.market, // remote_id used by the exchange
                    base: base, // standardized base symbol for Bitcoin
                    quote: quote, // standardized quote symbol for Tether
                };
                Binanace.unsubscribeLevel2Snapshots(submarket);
            }
        }
    })
    if (ws.market == "") {
        SendPrice[ws.id] = ws;
        ws.send(JSON.stringify(NewPriceMarket));
    } else {
        if (Object.keys(WSMarkets).indexOf(ws.market) >= 0) {
            WSMarkets[ws.market][ws.id] = ws;
        } else {
            WSMarkets[ws.market] = {};
            WSMarkets[ws.market][ws.id] = ws;
            var base = ws.baseCoin;
            var quote = ws.tradeCoin;
            if (Object.keys(NewPriceMarket.codemen).length > 0) {
                const submarket = {
                    id: ws.market, // remote_id used by the exchange
                    base: base, // standardized base symbol for Bitcoin
                    quote: ws.tradeCoin, // standardized quote symbol for Tether
                };
                Binanace.subscribeLevel2Snapshots(submarket);
            } else {
                const submarket = {
                    id: ws.market, // remote_id used by the exchange
                    base: base, // standardized base symbol for Bitcoin
                    quote: ws.tradeCoin, // standardized quote symbol for Tether
                };
                GetOrdersBook(base + "_" + quote);
            }

        }
    }
});


var CCXWS = require("ccxws");
var CCXT = require('ccxt');

var Binanace = new CCXWS.BinanceClient();
var BinanceClient = new CCXT.binance();


////////Future

// var apikey = "63d3a4813d344a0001193980";
// var apisecrete = "06da5020-6376-4dea-8012-c14661fdd7e8"
// var Kucoin = new CCXT.kucoin ({
//     apiKey: apikey,
//     secret: apisecrete,
//     password:"Akrami#%?!23"
// });

// console.log(KucoinFutures.hasCreateMarketOrder);

var OrderBooks = {};

Binanace.on("error", err => console.error(err));
Binanace.on("trades", (trade, market) => console.log(trade, market));

Binanace.on("ticker", async (ticker, market) => {
    var symbol = ticker.quote + ticker.base
    ListAllPrices[symbol] = ticker;

    NewPriceMarket.binance = ListAllPrices;

    Object.keys(SendPrice).forEach(id => {
        var ws = SendPrice[id];
        ws.send(JSON.stringify(NewPriceMarket));
    })
})
Binanace.on("l2snapshot", async (snapshot, market) => {
    var Obj = {
        ask: [],
        bid: []
    }
    await snapshot.asks.forEach(async ask => {
        await Obj.ask.push([ask.price, ask.size]);
    });
    await snapshot.bids.forEach(async bid => {
        await Obj.bid.push([bid.price, bid.size]);
    });
    ChartData.GetLastOrder(market.quote, function (newobj) {
        try {
            Obj.chart = {
                date: newobj.created_at,
                updated: newobj.updated_at,
                price: newobj.price
            }
        } catch {
            Obj.chart = {
                date: null,
                updated: null,
                price: null
            }
        }

        OrderBooks[market.id] = Obj;
        try {
            var Websockets = WSMarkets[market.id];
            Object.keys(Websockets).forEach(id => {
                var ws = Websockets[id];
                ws.send(JSON.stringify(OrderBooks[market.id]));
            });
        } catch (e) {
            console.log(e.toString());
        }
    })
});


function makeid(length) {
    var result = '';
    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for (var i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}


var ListAllPrices = {};

function GetMarketList(){
    // let base = ws.tradeCoin ? ws.tradeCoin : 'USDT'
    var options = {
        method: 'GET',
        url: 'https://trademen.codemen.me/exchange/get-all-coin-market'
    };

    request(options, async function (error, response, body) {
        if (error) throw new Error(error);
        var Codemen = [];
        try {
            Codemen = JSON.parse(body).coin_pairs
        } catch {
            Codemen = [];
        }
        NewPriceMarket.codemen = Codemen;
    });
}

function GetPrices() {
    wss.on('connection', async function connection(ws, req) {
        if (Object.keys(NewPriceMarket.codemen).length > 0) {
            await NewPriceMarket.codemen.forEach(async item => {
                var symbol = item.trade_pair.replace("_", "")
                SymbolsCoinex.push(symbol);
                var submarket = {
                    id: symbol, // remote_id used by the exchange
                    base: item.base_coin, // standardized base symbol for Bitcoin
                    quote: item.trade_coin, // standardized quote symbol for Tether
                };
                Binanace.subscribeTicker(submarket);
            });

        }

    });
}

function GetIRTPrices() {
    wss.on('connection', async function connection(ws, req) {
        WSMarkets[ws.market] = {};
        WSMarkets[ws.market][ws.id] = ws;
        var base = ws.baseCoin;
        var quote = ws.tradeCoin;
        console.log('quote',quote)
        if (quote === "IRT" ) {
            GetOrdersBook(base + "_" + quote);
        }

    });
}
// let params = new URLSearchParams('exchange');
// console.log(params);

GetMarketList();
setInterval(() => {
    GetMarketList();
    GetIRTPrices();
    UpdateThirdpartyOrders();
}, 10000);

setInterval(() => {
    SetLastPrice();
}, 1000000);


GetPrices();


var IntervalsSendOrderBook = {};

function GetOrdersBook(Symbol) {
    // ChartData
    var SymbolForEarch = Symbol.replace("_", "");
    IntervalsSendOrderBook[Symbol] = setInterval(() => {
        ChartData.GetOrderBook(Symbol, function (data) {
            ChartData.GetLastOrder(Symbol, function (newobj) {
                try {
                    data.chart = {
                        date: newobj.created_at,
                        updated: newobj.updated_at,
                        price: newobj.price
                    }
                } catch {
                    data.chart = {
                        date: null,
                        updated: null,
                        price: null
                    }
                }
                OrderBooks[SymbolForEarch] = data;
                try {
                    var Websockets = WSMarkets[SymbolForEarch];
                    Object.keys(Websockets).forEach(id => {
                        var ws = Websockets[id];
                        ws.send(JSON.stringify(OrderBooks[SymbolForEarch]));
                    });
                } catch (e) {
                    console.log(e.toString());
                }
            })

        });
    }, 1000);
}

function SetLastPrice() {
    // ChartData
    NewPriceMarket.codemen.forEach(market => {
        try {
            var marketpair = market.trade_pair.replace('_', '')
            var lastPrice = NewPriceMarket.binance[marketpair].last
            ChartData.UpdateLastPrice(market.trade_pair,lastPrice)
            console.log('newelem',NewPriceMarket.binance[marketpair].last);
        } catch (e) {
            console.log(e.toString());
        }

    });
    // console.log('priceeeeeee',JSON.stringify(NewPriceMarket.binance.BTCUSDT.last))
}

async function UpdateThirdpartyOrders() {
    var link = {
        method: 'POST',
        url: 'https://trademen.codemen.me/api/thirdparty/order-status'
    };

    request(link, function (error, response, body) {
        if (error) throw new Error(error);
    });
}


server.listen(1011);