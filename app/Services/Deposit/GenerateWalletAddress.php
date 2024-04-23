<?php


namespace App\Services\Deposit;


use App\Models\Wallet\Wallet;

class GenerateWalletAddress
{
    public function generate($wallet)
    {
        $coinApiService = null;

        if (in_array($wallet->coin->api_service, array_keys(api_classes()))) {
            $className = 'App\\Services\\Api\\' . api_classes($wallet->coin->api_service);
            $coinApiService = new $className($wallet->symbol);
        }

        if (!is_null($coinApiService)) {
            $coinApiServiceResponse = $coinApiService->generateAddress();

            if (!empty($coinApiServiceResponse) && $coinApiServiceResponse['error'] == 'ok') {
                $address = $coinApiServiceResponse['result']['address'];
                $attributes = ['address' => $address];
                if (isset($coinApiServiceResponse['result']['passphrase']) && $coinApiServiceResponse['result']['passphrase']) {
                    $attributes['passphrase'] = $coinApiServiceResponse['result']['passphrase'];
                } elseif (isset($coinApiServiceResponse['result']['privateKey']) && $coinApiServiceResponse['result']['privateKey']) {
                    $attributes['privateKey'] = $coinApiServiceResponse['result']['privateKey'];
                } elseif (isset($coinApiServiceResponse['result']['publicKey']) && $coinApiServiceResponse['result']['publicKey']) {
                    $attributes['publicKey'] = $coinApiServiceResponse['result']['publicKey'];
                }

                if (Wallet::where('id', $wallet->id)->update($attributes)) {
                    return $address;
                }
            }
        }

        return __('Failed to create wallet address. Try Again.');
    }
}
