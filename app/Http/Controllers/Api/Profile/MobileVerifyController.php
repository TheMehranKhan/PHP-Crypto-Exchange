<?php

namespace App\Http\Controllers\Api\Profile;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\MobileRequest;
use App\Http\Requests\Api\MobileVerificationRequest;
use App\Services\Core\UserActivityService;
use App\Services\Core\VerificationService;
use Req;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;

class MobileVerifyController extends Controller
{
    public function store(MobileRequest $request): JsonResponse
    {
        $user = Auth::user();
        if (Auth::user()->is_mobile_verified == UNVERIFIED) {
            app(VerificationService::class)->_sendMobileVerificationCode($user, $request->mobile);
            return response()->json([
                RESPONSE_STATUS_KEY => true,
                RESPONSE_MESSAGE_KEY => __("Please insert the verification code that you received as SMS."),
                RESPONSE_DATA => $user
            ]);
        } else {
            return response()->json([
                RESPONSE_STATUS_KEY => true,
                RESPONSE_MESSAGE_KEY => __('Your mobile is already verified!'),
                RESPONSE_DATA => $user
            ]);
        }


    }

    public function update(MobileVerificationRequest $request): JsonResponse
    {
        $user = Auth::user();
        if($user->verify_code == $request->verification_code){
            $user->verify_code == NULL;
            $user->is_mobile_verified = ACTIVE;
            $user->save();
            return response()->json([
                RESPONSE_STATUS_KEY => true,
                RESPONSE_MESSAGE_KEY => __('Phone Number successfully verified.')
            ]);
        } else {
            return response()->json([
                RESPONSE_STATUS_KEY => false,
                RESPONSE_MESSAGE_KEY => __('Verification Code is not valid!')
            ]);
        }
    }
}
