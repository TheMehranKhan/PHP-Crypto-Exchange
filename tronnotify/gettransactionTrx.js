const TronGrid = require('trongrid');
const TronWeb = require('tronweb');
const Redis = require("ioredis");
const axios = require('axios').default;

const redisPrefix = "trademen_database_"

const redis = new Redis({
    keyPrefix: redisPrefix
});
const LINK = "https://api.trongrid.io/";
const SITEURL = "https://trademen.codemen.me.com/api/ipn/";
const PV = "a7a1445c-7e79-489f-9853-dd3fef458ea5";
const tronWeb = new TronWeb({
    fullHost: LINK
})
const tronGrid = new TronGrid(tronWeb)

tronGrid.setExperimental(PV);

function sleep(ms) {
    return new Promise((resolve) => {
        setTimeout(resolve, ms);
    });
}

async function getTRXTransactions() {
    try {
        var addr = await redis.get("tronAddresses")
        var addresses
        if (addr) {
            addresses = addr.split(',')
        }

        if (addresses) {
            var i = 0;
            for (i; addresses.length > i; i++) {
                var address = addresses[i]

                if (typeof address !== 'undefined' && typeof address !== '') {
                    //console.log('address'+address )
                    const options = {
                        only_to: true,
                        only_confirmed: true,
                        limit: 20,
                        order_by: 'timestamp,desc',
                        // min_timestamp: Date.now() - 6000 // from a minute ago to go on
                    };

                    var transactions = await tronGrid.account.getTransactions(address, options);
                    //console.log("Session: %j", transactions)
                    if (typeof transactions.data !== 'undefined') {
                        var transaction = transactions.data
                        // await redis.del('transactions_' + address.address)
                        // var dataTransactions = await redis.get('transactions_' + address)

                        if (typeof transaction !== 'undefined') {
                            for (var b = 0; transaction.length > b; b++) {
                                //console.log(transactions[b].raw_data.contract[0])
                                if (typeof transaction[b].raw_data.contract[0].parameter.value.contract_address == 'undefined') {
                                    //console.log('ajab')
                                    //const txn = transaction[b].txID
                                    const txn = transaction[b].txID
                                    console.log(`${SITEURL}trx/trx?txn_id=${txn}`)
                                    axios.get(`${SITEURL}trx/trx?txn_id=${txn}`, {timeout: 30000});

                                }
                            }
                        }
                    }
                }
            }
        }
    } catch (err) {
        //console.log(err.message)
    }
}

async function getTRC20Transactions() {
    try {
        var cont = await redis.get("tronContracts")
        var contracts
        if (cont) {
            contracts = cont.split(',')
        } else {
            console.log('empty contract')
            return;
        }

        var addr = await redis.get("tronAddresses")
        var addresses
        if (addr) {
            addresses = addr.split(',')
        } else {
            console.log('empty address')
            return;
        }
            var i = 0;
            for (i; addresses.length > i; i++) {
                var address = addresses[i]

                if (typeof address !== 'undefined' && typeof address !== '') {
                    for (var b = 0; b < contracts.length; b++) {
                        let CONTRACT = contracts[b]; // USDT
                        let ACCOUNT = address;
                        // tronWeb.setAddress(ACCOUNT);
                        try {
                            var transactions = await axios.get(`${LINK}/v1/accounts/${ACCOUNT}/transactions/trc20?limit=5&contract_address=${CONTRACT}`)
                            if (transactions['data'].data.length > 0 ){
                                //console.log('trans %j:',transactions['data'].data)
                                for (var i = 0; i < transactions['data'].data.length; i++) {
                                    if (typeof transactions['data'].data[i] !== 'undefined') {
                                        var txId = transactions['data'].data[i]['transaction_id']
                                        axios.get(`${SITEURL}trx/trc20?txn_id=${txId}&address=${ACCOUNT}&contract=${CONTRACT}`, {timeout: 30000});
                                        console.log((`${SITEURL}trx/trc20?txn_id=${txId}&address=${ACCOUNT}&contract=${CONTRACT}`))
                                    }
                                }
                                await sleep(i * 8000);
                            }
                        } catch (error) {
                            // console.log("error:", error)
                        }
                    }
                }
            }
    } catch (err) {
        //console.log(err.message)
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

setInterval(() => {
    getTRXTransactions();
    getTRC20Transactions();
}, 5000);