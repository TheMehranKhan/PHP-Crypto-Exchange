<?php

namespace App\Http\Controllers\Guest;

use App\Http\Controllers\Controller;
use App\Jobs\Deposit\DepositBonusProcessJob;
use App\Jobs\Wallet\GenerateUserWalletsJob;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Session;
use App\Models\Wallet\Wallet;
use Illuminate\Support\Str;
use App\Models\Core\Page;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Core\{LoginRequest, NewPasswordRequest, PasswordResetRequest, RegisterRequest};
use App\Models\Core\User;
use App\Services\Core\{AuthService, UserActivityService, UserService, VerificationService};
use Illuminate\Http\{RedirectResponse, Request};
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;


class AuthController extends Controller
{
    protected $service;

    public function __construct(AuthService $service)
    {
        $this->service = $service;
    }

    public function loginForm(): View
    {
        return view('core.no_header_pages.login');
    }

    public function login(LoginRequest $request): RedirectResponse
    {
        $response = $this->service->login($request);

        if (Auth::check()) {
            Cookie::queue(Cookie::forget('coinPair'));
            app(UserActivityService::class)->store(Auth::id(), 'login');
            return redirect()->route(REDIRECT_ROUTE_TO_USER_AFTER_LOGIN)->with($response[RESPONSE_STATUS_KEY], $response[RESPONSE_MESSAGE_KEY]);
        }
        return redirect()->back()->with($response[RESPONSE_STATUS_KEY], $response[RESPONSE_MESSAGE_KEY]);
    }

    public function logout(): RedirectResponse
    {
        $userId = Auth::id();
        Auth::logout();
        app(UserActivityService::class)->store($userId, 'logout');
        session()->flush();
        return redirect()->route('login');
    }

    public function register(): View
    {
        $page = Page::where('slug', 'terms-for-registration')->first();
        try {
            $fallbackLang = Storage::disk('public')->get('page_language/' . $page->id . '/' . config('app.fallback_locale') . '.json');
            $data['fallbackLang'] = json_decode($fallbackLang, true);
        } catch (\Exception $e) {
            abort('404', 'You do not have default fallback language data');
        }
        try {
            $currentLang = Storage::disk('public')->get('page_language/' . $page->id . '/' . App::getLocale() . '.json');
            $data['currentLang'] = json_decode($currentLang, true);
        } catch (\Exception $e) {
            $data['currentLang'] = [];
        }
        $data['visualPage'] = $page;
        return view('core.no_header_pages.register', $data);
    }

    public function storeUser(RegisterRequest $request): RedirectResponse
    {
        $parameters = $request->only(['first_name', 'last_name', 'email', 'mobile', 'birthday', 'username', 'password', 'referral_id']);
        if (!Str::contains($request->get('mobile'), '+')) {
            return redirect()->back()->withInput()->with(RESPONSE_TYPE_ERROR, __('Mobile must be enter with country code!'));
        }

        $response = app(UserService::class)->generate($parameters);

        if ($response[RESPONSE_STATUS_KEY]) {
            if (env('QUEUE_CONNECTION', 'sync') === 'sync') {
                GenerateUserWalletsJob::dispatchSync($response[RESPONSE_DATA]['user']);
            } else {
                GenerateUserWalletsJob::dispatch($response[RESPONSE_DATA]['user']);
            }

            if (settings('register_bonus_status') == ACTIVE) {
                DepositBonusProcessJob::dispatchSync($response[RESPONSE_DATA]['user']);
            }

            app(VerificationService::class)->_sendEmailVerificationLink($response[RESPONSE_DATA]['user']);

            if (settings('require_mobile_verification') == ACTIVE) {
                app(VerificationService::class)->_sendMobileVerificationCode($response[RESPONSE_DATA]['user']);
                return redirect()->route('account.mobile.verification', $response[RESPONSE_DATA]['user'])->with(RESPONSE_TYPE_SUCCESS, __("Please insert the verification code that you received as SMS."));
            }

            return redirect()->route('login')->with(RESPONSE_TYPE_SUCCESS, $response[RESPONSE_MESSAGE_KEY]);
        }

        return redirect()->back()->withInput()->with(RESPONSE_TYPE_ERROR, $response[RESPONSE_MESSAGE_KEY]);
    }

    public function forgetPassword(): View
    {
        return view('core.no_header_pages.forget_password');
    }

    public function sendPasswordResetMail(PasswordResetRequest $request): RedirectResponse
    {
        $response = $this->service->sendPasswordResetMail($request);
        $status = $response[RESPONSE_STATUS_KEY] ? RESPONSE_TYPE_SUCCESS : RESPONSE_TYPE_ERROR;

        return redirect()->route('forget-password.index')->with($status, $response[RESPONSE_MESSAGE_KEY]);
    }

    public function resetPassword(Request $request, User $user): View
    {
        $data = $this->service->resetPassword($request, $user->id);

        return view('core.no_header_pages.reset_password', $data);
    }

    public function updatePassword(NewPasswordRequest $request, User $user): RedirectResponse
    {
        $response = $this->service->updatePassword($request, $user);

        if ($response[RESPONSE_STATUS_KEY]) {
            app(UserActivityService::class)->store($user->id, 'reset password');

            return redirect()->route('login')->with(RESPONSE_TYPE_SUCCESS, $response[RESPONSE_MESSAGE_KEY]);
        }

        return redirect()->back()->with(RESPONSE_TYPE_ERROR, $response[RESPONSE_MESSAGE_KEY]);
    }
}
