<?php

use App\Http\Controllers\Deposit\UserDepositController;
use App\Http\Controllers\GoogleTwoFactor\VerifyGoogle2faController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\Market\MarketController;
use App\Http\Controllers\Page\PageController;
use App\Http\Controllers\Post\BlogController;
use App\Http\Controllers\Post\PostCategoryController;
use App\Http\Controllers\TestController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Core\FeeController;
use App\Http\Controllers\Swap\SwapController;
use App\Http\Controllers\Stake\StakeController;

//Test
Route::get('test', [TestController::class, 'test'])
    ->name('test');
Route::get('/', HomeController::class)
    ->name('home');
Route::post('google-2fa/verify', [VerifyGoogle2faController::class, 'verify'])
    ->name('profile.google-2fa.verify');

//Market
Route::get('/markets', [MarketController::class, 'index'])
    ->name('markets');

//Swap
Route::get('/swap', [SwapController::class, 'index'])
    ->name('swap');

//Stake
Route::get('/stake', [StakeController::class, 'index'])
    ->name('stake');

Route::get('/stake/{coin}', [StakeController::class, 'show'])
    ->name('stake.show');

//Fee
Route::get('fees', [FeeController::class, 'index'])->name('fee.index');

//Blog
Route::get('blog', [BlogController::class, 'index'])->name('blog.index');
Route::get('blog/category/{postCategory}', [PostCategoryController::class, 'index'])->name('blog.category');
Route::get('blog/post/category/{postCategory}', [BlogController::class, 'categoryPosts'])->name('blog.categoryPosts');
Route::get('blog/post/{slug}', [BlogController::class, 'show'])->name('blog.show');

//Dynamic Page (Don't place any route after this page route)
Route::get('/{page:slug}', PageController::class)->name('page');
Route::any('payement/callBack/{wallet}', [UserDepositController::class, 'callback'])->name('payment.callback');

