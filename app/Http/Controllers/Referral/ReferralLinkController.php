<?php

namespace App\Http\Controllers\Referral;

use App\Http\Controllers\Controller;
use App\Models\Referral\ReferralEarning;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ReferralLinkController extends Controller
{
    public function __invoke()
    {
        $user = Auth::user();
        $data['title'] = __('Referral');
        if (is_null($user->referral_code)) {
            $user->update(['referral_code' => Str::random()]);
            $user = $user->fresh();
        }

        $refferralEarnings = ReferralEarning::select('symbol', DB::raw("sum(amount) as amount"))
            ->where('referrer_user_id', Auth::id())
            ->with('coin')
            ->groupBy("symbol")
            ->orderBy('amount', 'desc')
            ->take(10)
            ->get();

        $data['user'] = $user;
        $data['refferralEarnings'] = $refferralEarnings;
        return view('referral.link_show', $data);
    }
}
