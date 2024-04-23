var mysql      = require('mysql2');

var status = "pending completed field";

var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'trademenn_dbusr',
    password : 'I6KhvKTl',
    database : 'trademenn_dbn'
});


connection.connect(function(err) {
    if (err) {
        console.error('error connecting: ' + err.stack);
        return;
    }
    GetOrderBook("USDT_IRT",function (re){});
    console.log('connected as id ' + connection.threadId);
});

function GetLastOrder(tradecoin,callback){
    connection.query(`SELECT * FROM orders WHERE trade_pair='${tradecoin}' AND status='completed' ORDER BY created_at DESC`
        , function (err, result, fields) {
            if (err) throw err;
            if(result.length==0){
                callback({});
            }else{
                callback(result[result.length-1]);
            }
        });
}


function GetOrderBook(tradecoin,callback) {
    connection.query(`SELECT * FROM exchanges WHERE trade_pair='${tradecoin}' AND order_type='buy' ORDER BY created_at DESC LIMIT 7`
        , async function (err, result, fields) {
            if (err) throw err;
            var Obj = {};
            var bid = [];
            await result.forEach(async orderbook=>{
                await bid.push([orderbook.price,orderbook.amount]);
            })
            connection.query(`SELECT * FROM exchanges WHERE trade_pair='${tradecoin}' AND order_type='sell' ORDER BY created_at DESC LIMIT 7`
                , async function (err, res, fields) {
                    if (err) throw err;
                    var ask = [];
                    await res.forEach(orderbook => {
                        ask.push([orderbook.price,orderbook.amount]);
                    });
                    Obj={
                        bid : bid,
                        ask : ask
                    }
                    callback(Obj)
                });
            console.log('Object',Obj)
        });
}

function SaveFuture(symbol,userid,orderid,leverage,size,price,type,typetrade,cid,stop,callback){
    if(typetrade=="market"){
        price = 0;
    }
    console.log('test sql' + symbol + userid + orderid + leverage + size + price + type + typetrade + cid + callback)
    connection.query(
        `INSERT INTO futures (id,symbol, orderid, user_id,leverage,typetrade,type,pnl,realizepnl,status,amount,liquid,cid,price,stop,stopPriceType,stopPrice) VALUES ('${orderid}','${symbol}', '${orderid}', '${userid}', ${leverage} ,'${typetrade}','${type}',0,0,'open','${size}',0,'${cid}','${price}','down','TP','${stop}'); `,
        async function (err, res, order, msg) {
            console.log(err, res, order);
            if (!err) {
                callback(true);
            } else {
                callback(false);
            }
        }
    );
}

function GetOrderById(id,userid,callback){
    connection.query(`SELECT * FROM futures WHERE orderid='${id}' AND user_id='${userid}'`,function(err,res,order){
        callback(res);
    });
}

function EditFuture(orderid,realisedCost,pnl,avgEntryPrice,posMargin,maintMargin,isopen,liquidity,userId){
    //console.log(orderid,realisedCost,pnl,avgEntryPrice,posMargin,maintMargin,isopen,liquidity)
    var status = "open";
    if (isopen==false){
        status = "close";
    }
    connection.query(`UPDATE futures SET realised_cost=${realisedCost},pnl=${pnl},avg_entry_price=${avgEntryPrice},pos_margin=${posMargin},maint_margin=${maintMargin}, status='${status}' ,liquid=${liquidity}  WHERE (orderid='${orderid}' AND user_id = '${userId}' AND status = 'open')`,function(er){
        //console.log("edit",er);
    });
}



function CloseFuture(orderid){
    var q = `UPDATE futures SET status='close' WHERE orderid='${orderid}';`;
    connection.query(q,function(er,re,s){
        console.log(er,re,s);
    });
}

function GetFuturesOpen(userid,callbcak){
    connection.query(`SELECT * FROM futures WHERE user_id='${userid}' AND status='open' ORDER BY created_at DESC`
        , async function (err, res, fields) {
            if (err) throw err;
            // console.log(res.length);
            var list = [];
            await res.forEach(order => {
                list.push({
                    symbol : order.symbol,
                    price : order.price,
                    realised_cost : order.realised_cost,
                    size : order.amount,
                    type : order.type,
                    leverage: order.leverage,
                    pnl : order.pnl,
                    realizepnl : order.realizepnl,
                    avg_entry_price : order.avg_entry_price,
                    pos_margin : order.pos_margin,
                    maint_margin : order.maint_margin,
                    id : order.orderid,
                    liquid : order.liquid
                });
            });
            callbcak(list)
        });
}

function GetFuturesClosed(userid,callbcak){
    connection.query(`SELECT * FROM futures WHERE user_id='${userid}' AND status='closed' ORDER BY created_at DESC`
        , async function (err, res, fields) {
            if (err) throw err;
            callbcak(fields)
        });
}

function UpdateLastPrice(symbol,price){
    connection.query(`UPDATE coin_pairs SET last_price=${price} WHERE name='${symbol}'`,function(er){
        // console.log("edit",er);
    });
}
// CloseFuture("63da92b383977c000168541e");

module.exports = {
    GetOrderBook:GetOrderBook,
    GetLastOrder:GetLastOrder,
    SaveFuture:SaveFuture   ,
    GetFuturesOpen:GetFuturesOpen,
    GetFuturesClosed:GetFuturesClosed,
    EditFuture:EditFuture,
    GetOrderById:GetOrderById,
    CloseFuture:CloseFuture,
    UpdateLastPrice:UpdateLastPrice
}