<?php

namespace App\Override\Api;

use App\Override\Logger;
use Exception;
use GuzzleHttp\Psr7\Response as GuzzleResponse;
use Illuminate\Http\Client\Response;
use Illuminate\Support\Facades\Http;

class VandarApi
{
    private $currency;

    public function __construct($currency)
    {
        $this->currency = $currency;
    }
}
