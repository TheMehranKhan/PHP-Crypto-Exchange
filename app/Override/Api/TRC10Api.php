<?php

namespace App\Override\Api;

use App\Models\Coin\Coin;
use App\Models\Wallet\Wallet;
use App\Override\Logger;
use Exception;
use GuzzleHttp\Psr7\Response as GuzzleResponse;
use IEXBase\TronAPI\Provider\HttpProvider;
use IEXBase\TronAPI\Tron;
use Illuminate\Http\Client\Response;
use Illuminate\Support\Facades\Http;

class TRC10Api
{
    public $tron;
    private $currency;
    private $apikey;
    private $coin;

    public function __construct($currency)
    {
        $this->currency = $currency;
        $this->loadConfiguration();
    }

    private function loadConfiguration(): void
    {
        $currency = strtolower($this->currency);
        $this->apikey = settings("tron_apikey") ?? "";

        $headers = [
            'Content-Type' => 'application/json',
            'TRON-PRO-API-KEY' => $this->apikey,
        ];
        $fullNode = new HttpProvider('https://api.trongrid.io', 3000, false, false, $headers);
        $solidityNode = new HttpProvider('https://api.trongrid.io', 3000, false, false, $headers);
        $eventServer = new HttpProvider('https://api.trongrid.io', 3000, false, false, $headers);
        try {
            $this->tron = new Tron($fullNode, $solidityNode, $eventServer);
        } catch (TronException $e) {
            dd($e->getMessage());
        }
        $this->coin = Coin::where('symbol', $this->currency)->with('systemWallet')->first();
        if (empty($this->coin)) {
            throw new Exception('Coin not found!');
        }
    }

    public function generateAddress(): array
    {
        try {
            $response = $this->tron->createAccount();
            if ($response) {
                return [
                    'error' => 'ok',
                    'result' => [
                        'address' => $response->getAddress(true),
                        'privateKey' => $response->getPrivateKey(),
                        'publicKey' => $response->getPublicKey(),
                    ],
                ];
            }
        } catch (Exception $exception) {
            Logger::error($exception, "[FAILED][BitcoinForkedApi][generateAddress]");
        }
        return ['error' => 'Failed to generate address.'];
    }

    private function call(string $method, array $params = []): Response
    {
        try {
            $response = Http::timeout(10)
                ->withBasicAuth($this->user, $this->password)
                ->accept('application/json')
                ->contentType('application/json-rpc')
                ->post($this->getUrl(), [
                    'id' => 1,
                    'jsonrpc' => '2.0',
                    'method' => $method,
                    'params' => $params
                ]);
        } catch (Exception $exception) {
            return new Response(new GuzzleResponse($exception->getCode()));
        }
        return $response;
    }

    private function getUrl(): string
    {
        return $this->scheme . "://" . $this->host . ":" . $this->port;
    }

    public function sendToAddress(string $to, float $amount, string $from = null, string $privateKey = null): array
    {
        try {
            $from = $from ?: $this->coin->systemWallet->address;
            $privateKey = $privateKey ?: $this->coin->systemWallet->private_key;
            $this->tron->setPrivateKey($privateKey);
            $this->tron->setAddress($from);
            $coin = Coin::where('symbol', $this->currency)->first();
            $response = $this->tron->sendTokenTransaction($to, $amount, $coin->contract_address);

            if ($response) {
                return [
                    RESPONSE_STATUS_KEY => true,
                    RESPONSE_DATA => [
                        'status' => STATUS_COMPLETED,
                        'txn_id' => $response['txid'],
                    ]
                ];
            }
        } catch (Exception $exception) {
            Logger::error($exception, "[FAILED][TronApi][sendToAddress]");
        }
        return [
            RESPONSE_STATUS_KEY => false
        ];
    }

    public function getBalance(string $wallet = ""): float
    {
        try {
            $coin = Coin::where('symbol', $this->currency)->first();
            $response = $this->tron->getTokenBalance($coin->contract_address, $wallet, true);;
            if ($response) {
                return $response;
            }
        } catch (Exception $exception) {
            Logger::error($exception, "[FAILED][TronApi][getBalance]");
        }
        return 0;
    }

    public function validateAddress(string $address): bool
    {
        try {
            $response = $this->tron->validateAddress($address);
            if ($response) {
                return $response['result'];
            }
        } catch (Exception $exception) {
            Logger::error($exception, "[FAILED][BitcoinForkedApi][validateAddress]");
        }
        return false;
    }

    public function validateIpn(string $txnId)
    {
        return true;
    }

    public function getTransaction(string $txnId): array
    {
        try {
            $response = $this->tron->getTransaction($txnId);
            $response->throw();
            if ($response->successful()) {
                return [
                    'error' => 'ok',
                    'result' => $response['result']
                ];
            }
        } catch (Exception $exception) {
            Logger::error($exception, "[FAILED][TronApi][getTransaction]");
        }
        return ['error' => 'No transactions found.'];
    }

    public function getStatus()
    {
        try {
            $response = $this->tron->isConnected();
            if ($response->successful()) {
                $result = [
                    'status' => is_null($response['error']),
                    'version' => $response['result']
                ];
            }

            $response = $this->call("getblockchaininfo");
            $response->throw();
            if ($response->successful() && isset($response['result']['chain'])) {
                $result['network'] = ucfirst($response['result']['chain']);
            }
            return $result;

        } catch (Exception $exception) {
            dd($exception->getMessage());
            Logger::error($exception, "[FAILED][BitcoinForkedApi][getStatus]");
        }
        return [
            'status' => false,
            'version' => '',
            'network' => '',
        ];
    }
}
