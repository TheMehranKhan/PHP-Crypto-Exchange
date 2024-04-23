<?php

namespace App\Http\Controllers\Futures;

use App\Http\Controllers\Controller;
use App\Services\CoinPair\GetDefaultCoinPair;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\View;
use Illuminate\Validation\UnauthorizedException;

class FuturesDashboardController extends Controller
{

    public function index($pair = null)
    {
        $data['title'] = __('Futures');
        $data['coinPair'] = app(GetDefaultCoinPair::class)->getCoinPair($pair);

        if( $data['coinPair'] ) {
            return view('futures.index', $data);
        }

        throw new UnauthorizedException('futures_exception', 404);
    }
}
