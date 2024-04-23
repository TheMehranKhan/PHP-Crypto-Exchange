<?php

use App\Http\Controllers\Api\Guest\ForgetPasswordController;
use App\Http\Controllers\Api\Guest\LoginController;
use App\Http\Controllers\Api\Guest\RegisterController;
use App\Http\Controllers\Api\BankAccount\UserBankAccountController;
use App\Http\Controllers\Api\Deposit\UserDepositController;
use App\Http\Controllers\Api\KYC\UserKycController;
use App\Http\Controllers\Api\Orders\CancelOrderController;
use App\Http\Controllers\Api\Orders\CreateOrderController;
use App\Http\Controllers\Api\Orders\UserOrderController;
use App\Http\Controllers\Api\PaymentMethods\PaymentMethodController;
use App\Http\Controllers\Api\Preference\PreferenceController;
use App\Http\Controllers\Api\Profile\ChangePasswordController;
use App\Http\Controllers\Api\Profile\ProfileController;
use App\Http\Controllers\Api\Profile\UpdateAvatarController;
use App\Http\Controllers\Api\Referral\ReferralEarningController;
use App\Http\Controllers\Api\Referral\ReferralLinkController;
use App\Http\Controllers\Api\Referral\UserReferralController;
use App\Http\Controllers\Api\Ticker\PublicApiController;
use App\Http\Controllers\Api\Ticket\UserTicketController;
use App\Http\Controllers\Api\TradeHistory\UserTradeHistoryController;
use App\Http\Controllers\Api\Verification\VerificationController;
use App\Http\Controllers\Api\Wallet\UserWalletController;
use App\Http\Controllers\Api\Webhook\BitcoinIpnController;
use App\Http\Controllers\Api\Webhook\CoinpaymentsIpnController;
use App\Http\Controllers\Api\Webhook\ThirdpartyController;
use App\Http\Controllers\Api\Webhook\TrxIpnController;
use App\Http\Controllers\Api\Webhook\TrxWalletGenarateController;
use App\Http\Controllers\Api\Withdrawal\UserWithdrawalController;
use App\Http\Controllers\Api\Webhook\IDAnalyzerIpnController;
use App\Http\Controllers\Api\Page\PageController;
use App\Http\Controllers\Api\Profile\MobileVerifyController;
use Illuminate\Support\Facades\Route;

Route::any('/ipn/coinpayments', CoinpaymentsIpnController::class);
Route::any('/ipn/bitcoin/{currency}', BitcoinIpnController::class);
Route::any('/ipn/trx/{currency}', TrxIpnController::class);
Route::get('/wallet/trx/generate', TrxWalletGenarateController::class);
Route::any('/ipn/idanalyzer', IDAnalyzerIpnController::class)
    ->name('kyc-verifications.callback');
Route::post('/thirdparty/order-status', ThirdpartyController::class);
Route::get('public', PublicApiController::class);
Route::get('coins/{coin}/payment-methods', PaymentMethodController::class);
Route::post('register', RegisterController::class);
Route::post('login', LoginController::class);
Route::post('forget-password', [ForgetPasswordController::class, 'index']);
Route::post('forget-password/set-password', [ForgetPasswordController::class, 'update']);
Route::post('verification/email', [VerificationController::class, 'send']);
Route::post('verification/verify-email-code', [VerificationController::class, 'verify']);
Route::any('payment/{walletDeposit}', [UserDepositController::class, 'payment']);
Route::get('page/{page:slug}', [PageController::class, 'page']);


Route::group(['middleware' => ['auth:sanctum']], function () {
    // referral link
    Route::get('user/referral/get-link', ReferralLinkController::class);
    Route::get('user/referral/earnings', ReferralEarningController::class);
    Route::get('user/referral/users', [UserReferralController::class, 'index']);
    Route::get('user/referral/users/{user}/earnings', [UserReferralController::class, 'earnedThroughUser']);
    // user wallets
    Route::get('user/wallets', UserWalletController::class);

    // user wallet
    Route::get('user/wallets/{symbol}', [UserWalletController::class, 'getWallet']);

    // user orders
    Route::get('user/orders', [UserOrderController::class, 'index']);
    Route::get('user/orders/{coinPair}/open', [UserOrderController::class, 'openOrders']);
    Route::post('user/orders/place', [CreateOrderController::class, 'store']);
    Route::delete('user/orders/{order}/destroy', [CancelOrderController::class, 'destroy']);
    //user trade history
    Route::get('user/trade-history', UserTradeHistoryController::class);
    //Deposit
    Route::get('user/wallets/{wallet}/deposits', [UserDepositController::class, 'index']);
    Route::post('user/wallets/{wallet}/deposits/store', [UserDepositController::class, 'store']);
    Route::get('user/wallets/{wallet}/get-deposit-address', [UserDepositController::class, 'getDepositAddress']);
    Route::post('user/wallets/{wallet}/deposits/{deposit}/upload-bank-receipt', [UserDepositController::class, 'uploadReceipt']);
    Route::get('user/all/deposits', [UserDepositController::class, 'getAll']);
    // user withdrawals
    Route::get('user/wallets/{wallet}/withdrawals', [UserWithdrawalController::class, 'index']);
    Route::post('user/wallets/{wallet}/withdrawals/store', [UserWithdrawalController::class, 'store']);
    Route::delete('user/wallets/{wallet}/withdrawals/{withdrawal}/destroy', [UserWithdrawalController::class, 'destroy']);
    //Route::get('user/bank-accounts', UserBankAccountController::class);
    Route::get('user/all/withdrawals', [UserWithdrawalController::class, 'getAll']);

    //Bank Accounts
    Route::resource('user/bank-accounts', UserBankAccountController::class)->only(['index', 'store', 'destroy']);
    Route::post('user/bank-accounts/update', [UserBankAccountController::class, 'update']);
    Route::delete('user/bank-accounts', [UserBankAccountController::class, 'destroy']);

    //Ticket Management
    Route::resource('user/tickets', UserTicketController::class)
        ->only(['index', 'store', 'show']);
    Route::put('user/tickets/{ticket}/close', [UserTicketController::class, 'close']);
    Route::post('user/tickets/{ticket}/comment', [UserTicketController::class, 'comment']);
    Route::get('user/ticket/{ticket}/download-attachment/{fileName}', [UserTicketController::class, 'download']);

    // kyc
    Route::resource('user/kyc-verifications', UserKycController::class)->only(['index', 'store']);

    //change avatar
    Route::post('user/profile/avatar/update', UpdateAvatarController::class);
    // change password
    Route::put('user/password/update', ChangePasswordController::class);
    // profile
    Route::resource('user/profile', ProfileController::class)
        ->only('index', 'show', 'update');
    // preference
    Route::resource('user/preference', PreferenceController::class)
        ->only('show', 'update');

    // verify mobile
    Route::resource('user/phone_verify', MobileVerifyController::class)->only('index', 'store', 'update');;

});
