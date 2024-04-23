<?php

namespace App\Models\Deposit;

use App\Override\Eloquent\LaraframeModel as Model;

class GatewayTransaction extends Model
{
    protected $table = 'gateway_transactions';
}
