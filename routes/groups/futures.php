<?php

use App\Http\Controllers\Futures\CoinMarketController;
use App\Http\Controllers\Futures\FuturesDashboardController;
use App\Http\Controllers\Futures\MyOpenOrderController;
use App\Http\Controllers\Futures\OrderController;
use App\Http\Controllers\Futures\UserTradesController;
use App\Http\Controllers\Futures\TradingHistoryController;
use App\Http\Controllers\Futures\WalletSummaryController;

Route::get('get-coin-market/{baseCoin}', [CoinMarketController::class, 'getCoinMarket'])
    ->name('futures.get-coin-market');

Route::get('get-orders', OrderController::class)
    ->name('futures.get-orders');

Route::get('get-trade-histories', TradingHistoryController::class)
    ->name('futures.get-trade-histories');

Route::group(['middleware' => ['auth', 'permission']], function () {
    Route::get('get-my-open-orders', MyOpenOrderController::class)
        ->name('futures.get-my-open-orders');
    Route::get('get-my-trades', UserTradesController::class)
        ->name('futures.get-my-trades');
    Route::get('get-wallet-summary', WalletSummaryController::class)
        ->name('futures.get-wallet-summary');
});
Route::get('/{pair?}', [FuturesDashboardController::class, 'index'])
    ->name('futures.index')->middleware('menuable');
