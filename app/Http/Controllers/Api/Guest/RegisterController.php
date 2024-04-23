<?php

namespace App\Http\Controllers\Api\Guest;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\UserRequest;
use App\Jobs\Wallet\GenerateUserWalletsJob;
use App\Services\Core\UserService;
use App\Services\Core\VerificationService;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Str;

class RegisterController extends Controller
{
    public function __invoke(UserRequest $request): JsonResponse
    {
        $parameters = $request->only(['first_name', 'last_name', 'email', 'mobile', 'birthday', 'username', 'password', 'referral_id']);
        $response = app(UserService::class)->generate($parameters);

        if (!Str::contains($request->get('mobile'), '+')) {
            return response()->json([RESPONSE_STATUS_KEY => false,"message" => __('Mobile must be enter with country code!')]);
        }

        if ($response[RESPONSE_STATUS_KEY]) {
            if (env('QUEUE_CONNECTION', 'sync') === 'sync') {
                GenerateUserWalletsJob::dispatchSync($response[RESPONSE_DATA]['user']);
            } else {
                GenerateUserWalletsJob::dispatch($response[RESPONSE_DATA]['user']);
            }
            app(VerificationService::class)->_sendEmailVerificationLink($response[RESPONSE_DATA]['user']);

            $response[RESPONSE_DATA]['access_token'] = $response[RESPONSE_DATA]['user']
                ->createToken($request->header('User-Agent'))
                ->plainTextToken;

            return response()->json($response);
        }
        return response()->json($response);
    }
}
