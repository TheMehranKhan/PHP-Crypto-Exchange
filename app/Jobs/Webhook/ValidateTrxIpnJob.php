<?php

namespace App\Jobs\Webhook;

use App\Jobs\Deposit\DepositProcessJob;
use App\Jobs\OmniLayer\OmniLayerTransactionJob;
use App\Models\Coin\Coin;
use App\Override\Api\TRC20Api;
use App\Override\Api\TronApi;
use App\Override\Logger;
use Exception;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Redis;

class ValidateTrxIpnJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $data;
    public $currency;
    public $coin;

    public function __construct(string $currency, array $data)
    {
        $this->data = $data;
        $this->currency = $currency;
    }

    public function handle()
    {
        if ($this->currency === 'trc20'){
            $api = new TRC20Api();
            $contract = $this->data['contract'];
            $symbol = $api->getSymbolByContract($contract);
            $this->currency = $symbol;
        }
        $coin = Coin::query()
            ->where('symbol', $this->currency)
            ->first();

        $this->coin = $coin;
        if (empty($coin)) {
            return;
        }



        //Get API
        $api = $coin->getAssociatedApi();
        $transactions = $api->validateIpn($this->data['txn_id']);
        if (!$transactions) {
            return;
        }
        //Validate IPN and process deposit one by one in queue
        switch ($coin->api['selected_apis']) {
            case API_TRON:
                $this->depositTrx($transactions, $coin, $api);
                break;
            case API_TRC20:
                $this->depositTrc20($transactions, $coin, $api);
                break;
        }
    }

    public function failed(Exception $exception)
    {
        Logger::error($exception, "[FAILED][ValidateTrxIpnJob]");
    }

    private function depositTrx($transactions, $coin, $api)
    {
        $status = $transactions['status'] ? STATUS_COMPLETED : STATUS_PENDING;

        foreach ($transactions['result'] as $transaction) {
            $amount = sprintf("%." . $coin->decimal_place . "f", $api->fromTron($transaction['amount']));

            if($amount < 1){
                return;
            }

            $depositData = [
                'address' => $api->fromHex($transaction['to_address']),
                'amount' => sprintf("%." . $coin->decimal_place . "f", $api->fromTron($transaction['amount'])),
                'txn_id' => $transaction['txid'],
                'symbol' => $this->currency,
                'status' => $status,
                'type' => TRANSACTION_DEPOSIT,
                'api' => API_TRON,
            ];

            DepositProcessJob::dispatch($depositData);
        }
    }

    private function depositTrc20($transactions, $coin, $api)
    {
        $status = STATUS_COMPLETED;
        $contract_address = $api->fromHex($transactions['result']['contract_address']);
        $txid = $transactions['result']['id'];
        $address = $this->data['address'];

        $transaction = $this->getTrc20Info($txid, $address, $contract_address);
        $hex = intval('1e'.$coin->decimal_place);
        $value = (float) bcdiv((string)$transaction['value'], (string)$hex, $coin->decimal_place);
        $amount = sprintf("%." . $coin->decimal_place . "f", $value);
        $depositData = [
            'address' => $this->data['address'],
            'amount' => $amount,
            'txn_id' => $transaction['transaction_id'],
            'symbol' => $this->currency,
            'status' => $status,
            'type' => TRANSACTION_DEPOSIT,
            'api' => API_TRC20,
        ];

        DepositProcessJob::dispatch($depositData);
    }

    private function getTrc20Info($txid, $address, $contract)
    {
        $response = Http::get("https://api.trongrid.io/v1/accounts/$address/transactions/trc20?limit=100&contract_address=$contract")
            ->json();
        $response = collect($response['data']);
        $response = $response->where('transaction_id', $txid)->first();
        if ($response) {
            return $response;
        }
        return 0;
    }
}

