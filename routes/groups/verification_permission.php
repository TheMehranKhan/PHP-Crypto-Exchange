<?php

use App\Http\Controllers\Core\VerificationController;
use Illuminate\Support\Facades\Route;


Route::get('verification', [VerificationController::class, 'verify'])->name('account.verification');
Route::get('verification/email', [VerificationController::class, 'resendForm'])->name('verification.form');
Route::post('verification/email', [VerificationController::class, 'send'])->name('verification.send');

Route::get('phone_verify/{user}', [VerificationController::class, 'phone_verify'])->name('account.mobile.verification');
Route::get('verification/mobile/{user}', [VerificationController::class, 'resendMobileForm'])->name('mobile.verification.form');
Route::post('verification/mobile', [VerificationController::class, 'sendVerify'])->name('mobile.verification.send');
