var CCXT = require("ccxt");

// var APIkey = "63d8f3478d490500014c055c";
// var Secret = "94239e00-8dd2-48c6-a599-132852707088";
// var password = "1234567890"

var APIkey = "63d551633794d100016c92b8";
var Secret = "b42d9f53-a17b-4614-a3f9-05bde5c64ba4";
var password = "Akrami#%?!23";

var ChartData = {};
const api = require("kucoin-futures-node-api");
const { popScopeId } = require("../public/js/websocket/vuenext");
const config = {
    apiKey: APIkey,
    secretKey: Secret,
    passphrase: password,
    environment: "live",
};
var listOfContract = {};
const apiLive = new api();
apiLive.init(config);
apiLive.getAllContracts().then(async (res) => {
    await res.data.forEach((cont) => {
        listOfContract[cont.baseCurrency] = cont.symbol;
    });

    // console.log(listOfContract);
    // console.log(Object.keys(listOfContract).length);
});
// CreateOrderMarket("buy","BTCUSDTM",10,0.001,function(er){})

// apiLive.initSocket({topic: "position",symbols:['BNBUSDTM']}, (msg) => {
//     let data = JSON.parse(msg)
//     console.log(data)
// })

function SetChartData(chart) {
    ChartData = chart;
}

// setInterval(async () => {
//   var res = await apiLive.getAllPositions();
//   if (res.code == "200000") {
//     var lst = res.data;
//     console.log("update db", lst);
//     await lst.forEach(async (pos) => {
//       console.log("pos", pos);
//       ChartData.EditFuture(
//         pos.id,
//         pos.realisedCost,
//         pos.unrealisedPnlPcnt,
//         pos.avgEntryPrice,
//         pos.posMargin,
//         pos.maintMargin,
//         pos.isOpen,
//         pos.liquidationPrice
//       );
//     });
//   } else {
//   }
// }, 20000);
async function UpdateOrders(userId) {
    const res = await apiLive.getOrders();
    if (res.code == "200000") {
        //   console.log("getOrders");
        const activeOrders = res.data.items;
        //   console.log(activeOrders);
        for (const activeOrder of activeOrders) {
            const positionRes = await apiLive.getPosition({
                symbol: activeOrder.symbol,
            });
            //console.log(positionRes);
            if (positionRes.code == "200000") {
                const postion = positionRes.data;
                //   console.log("order:", activeOrder);
                //   console.log("postion:", postion);
                ChartData.EditFuture(
                    activeOrder.id,
                    postion.realisedCost,
                    postion.unrealisedPnlPcnt,
                    postion.avgEntryPrice,
                    postion.posMargin,
                    postion.maintMargin,
                    postion.isOpen,
                    postion.liquidationPrice,
                    userId
                );
            }
        }
    }
    setTimeout(() => {
        UpdateOrders(userId);
    }, 5000);
}

function CreateOrderMarket(
    side,
    type,
    size,
    price,
    ismarket,
    leverage,
    token,
    cross,
    symbol,
    stop,
    callback
) {
    if (Object.keys(listOfContract).indexOf(symbol) < 0) {
        return callback(false, "notsupport");
    }
    var id = makeid(20);
    console.log("created", {
        side,
        type,
        size,
        price,
        ismarket,
        leverage,
        token,
        cross,
        symbol,
        stop,
        callback,
    });
    if (type === "market") {
        apiLive
            .placeOrder({
                clientOid: id,
                side: side,
                symbol: listOfContract[symbol],
                type: type,
                leverage: leverage,
                crossMode: false,
                size: size,
            })
            .then((result) => {
                if (result.code == "200000") {
                    callback(true, result.data.orderId, id, result.msg);
                    console.log(true, result.data.orderId);
                    console.log("result", result);
                } else {
                    console.log("erresult", result.msg);
                    callback(false, "", "", result.msg);
                    console.log("erresult", result);
                }
            })
            .catch((err) => {
                // callback(false, "", "", sg);
                console.log(err, "");
            });
    } else if (type === "limit") {
        apiLive
            .placeOrder({
                clientOid: id,
                side: side,
                symbol: listOfContract[symbol],
                type: type,
                leverage: leverage,
                size: size,
                price: price,
            })
            .then((result) => {
                if (result.code == "200000") {
                    callback(true, result.data.orderId, id, result.msg);
                    console.log(true, result.data.orderId);
                    console.log("result", result);
                } else {
                    console.log("erresult", result.msg);
                    callback(false, "", "", result.msg);
                    console.log("erresult", result);
                }
            })
            .catch((err) => {
                // callback(false, "", "", sg);
                console.log(err, "");
            });
    } else if (type === "stop_limit") {
        apiLive
            .placeOrder({
                clientOid: id,
                side: side,
                symbol: listOfContract[symbol],
                type: "limit",
                stop: "down",
                stopPriceType: "TP",
                stopPrice: stop,
                leverage: leverage,
                size: size,
                price: price,
            })
            .then((result) => {
                if (result.code == "200000") {
                    callback(true, result.data.orderId, id, result.msg);
                    console.log(true, result.data.orderId);
                    console.log("result", result);
                } else {
                    console.log("erresult", result.msg);
                    callback(false, "", "", result.msg);
                    console.log("erresult", result);
                }
            })
            .catch((err) => {
                // callback(false, "", "", sg);
                console.log(err, "");
            });
    }
}

function ClosePositionMarket(orderid, userid, callback) {
    ChartData.GetOrderById(orderid, userid, function (order) {
        try {
            order = order[0];
        } catch {
            order = {};
        }

        apiLive.getMarkPrice(order.symbol + "USDTM").then((res) => {
            var price = 0;
            try {
                price = res.value;
            } catch {}
            apiLive
                .placeOrder({
                    clientOid: order.cid,
                    side: order.type,
                    symbol: order.symbol + "USDTM",
                    type: "market",
                    leverage: order.leverage,
                    size: (Number(order.amount) * order.leverage) / price,
                    closeOrder: true,
                })
                .then((result) => {
                    console.log(result);
                    if (result.code == "200000") {
                        ChartData.CloseFuture(order.orderid);
                        console.log(true, result.data.orderId);
                    } else {
                        console.log(false, "");
                    }
                })
                .catch((err) => {
                    console.log(false, "");
                });
        });
    });
}

async function GetStatusPosition(orderid, symbol, callback) {
    var list = {};
    var res = await apiLive.getAllPositions();
    var ress = await apiLive.getOrderById({
        oid: orderid,
    });
    var rr = await apiLive.getPosition({ symbol: symbol });
    // console.log("rr", rr);
    // console.log("res", res);
    // console.log("ress", ress);
    callback({
        id: rr.data.id,
        realised_cost: rr.data.realisedCost,
        pnl: rr.data.unrealisedPnlPcnt,
        avg_entry_price: rr.data.avgEntryPrice,
        pos_margin: rr.data.posMargin,
        maint_margin: rr.data.maintMargin,
        liq: rr.data.liquidationPrice,
    });
    return;
    // if(res.code=="200000"){
    //     var lst = res.data;
    //     await lst.forEach(async pos => {
    //         if(pos.id==ress.data.id){
    //             list = {
    //                 symbol : pos.symbol.replace("USDTM"),
    //                 price : pos.markPrice,
    //                 size : pos.markValue,
    //                 leverage : pos.realLeverage,
    //                 pnl : pos.realisedPnl,
    //                 liq : pos.liquidationPrice,
    //                 unrealizepnl : pos.unrealisedPnl,
    //                 realisedCost : pos.realisedCost,
    //                 avgEntryPrice : pos.avgEntryPrice,
    //                 posMargin : pos.posMargin,
    //                 maintMargin : pos.maintMargin,
    //                 tp : 0,
    //                 sl : 0,
    //                 id : orderid
    //             };
    //         }
    //     });
    //     callback(true,list);
    // }else{
    //     callback(true,[]);
    // }
}

// GetStatusPosition("BNBUSDTM","",function(){});

function makeid(length) {
    let result = "";
    const characters =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const charactersLength = characters.length;
    let counter = 0;
    while (counter < length) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
        counter += 1;
    }
    return result;
}

// var KucoinFutures = new CCXT.kucoinfutures({
//     apiKey: APIkey,
//     secret: Secret,
//     password:password
// });

// function GetBalance(callback){
//     KucoinFutures.fetchBalance().then(balances=>{
//         callback(balances);
//     })
// }

// KucoinFutures.createMarketBuyOrder("SHIB/USDT:")

// console.log(KucoinFutures.symbols);
// KucoinFutures.createMarketBuyOrder("SHIB/USDT:USDT",10,{"leverage":10}).then((data)=>{
//     console.log(data);
// })
// KucoinFutures.cancelAllOrders("SHIBUSDT").then(e=>{
//     console.log(e);
// })

// KucoinFutures.
// KucoinFutures.fetchPositions().then(er=>{
//     console.log(er);
// })

module.exports = {
    CreateOrderMarket: CreateOrderMarket,
    ClosePositionMarket: ClosePositionMarket,
    GetStatusPosition: GetStatusPosition,
    SetChartData: SetChartData,
    UpdateOrders: UpdateOrders,
};
