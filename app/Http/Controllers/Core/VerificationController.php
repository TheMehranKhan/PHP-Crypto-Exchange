<?php

namespace App\Http\Controllers\Core;

use App\Http\Controllers\Controller;
use App\Http\Requests\Core\PasswordResetRequest;
use App\Services\Core\UserActivityService;
use App\Services\Core\VerificationService;
use App\Models\Core\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VerificationController extends Controller
{
    public function verify(Request $request)
    {
        $response = app(VerificationService::class)->verifyUserEmail($request);
        $status = $response[RESPONSE_STATUS_KEY] ? RESPONSE_TYPE_SUCCESS : RESPONSE_TYPE_ERROR;
        $route = Auth::check() ? REDIRECT_ROUTE_TO_USER_AFTER_LOGIN : REDIRECT_ROUTE_TO_LOGIN;

        return redirect()->route($route)->with($status, $response[RESPONSE_MESSAGE_KEY]);
    }

    public function resendForm()
    {
        return view('core.no_header_pages.email_verify');
    }

    public function send(PasswordResetRequest $request)
    {
        $response = app(VerificationService::class)->sendVerificationLink($request);
        $status = $response[RESPONSE_STATUS_KEY] ? RESPONSE_TYPE_SUCCESS : RESPONSE_TYPE_ERROR;

        return redirect()->back()->with($status, $response[RESPONSE_MESSAGE_KEY]);
    }

    public function phone_verify(User $user)
    {
        $data['user'] = $user;
        return view('core.no_header_pages.mobile_verify',$data);
    }

    public function resendMobileForm(User $user)
    {
        $verifyCode = rand(10000, 99999); //generate random code
        $user->verify_code = $verifyCode;
        $user->save();
        $msg = __("Your verification code is :coin", ['coin' => $verifyCode]);
        $token = array($verifyCode, "", "");
        send_sms($user->mobile, $msg,'SMS','verify', $token);
        $data['user'] = $user;
        return view('core.no_header_pages.mobile_verify',$data);
    }

    public function sendVerify(Request $request)
    {
        $user_id = $request->get('user_id');
        $verifyCode = $request->get('verify_code');
        $user = User::find($user_id);
        if($user->verify_code == $verifyCode){
            $user->verify_code == NULL;
            $user->is_mobile_verified = ACTIVE;
            $user->save();
            Auth::login($user);
            app(UserActivityService::class)->store($user_id, 'login');
            return redirect()->route(REDIRECT_ROUTE_TO_USER_AFTER_LOGIN)->with(RESPONSE_TYPE_SUCCESS, ' Login is successful.');
        } else {
            return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('Verification Code is not valid!'));
        }
    }
}
