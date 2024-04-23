<?php

namespace App\Http\Controllers\KycManagement;

use App\Http\Controllers\Controller;
use App\Http\Requests\Kyc\AdminKycReasonRequest;
use App\Models\Core\Notification;
use App\Models\Kyc\KycVerification;
use Exception;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class DeclineKycVerificationController extends Controller
{
    public function index(AdminKycReasonRequest $request, KycVerification $kycVerification)
    {
        if ($kycVerification->status != STATUS_REVIEWING) {
            return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('The KYC decline failed for wrong ID.'));
        }

        DB::beginTransaction();
        try {
            $updateVerification = $kycVerification->update([
                'status' => STATUS_DECLINED,
                'reason' => $request->reason
            ]);
            if ($updateVerification) {
                $updateUser = $kycVerification->user()->update(['is_id_verified' => UNVERIFIED]);
                if (!$updateUser) {
                    DB::rollBack();
                    return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('Failed to decline.'));
                }
                $notification = ['user_id' => $kycVerification->user_id, 'message' => __("Your KYC verification has been declined.")];
                Notification::create($notification);
                if (settings('require_mobile_verification') == ACTIVE) {
                    $msg = __("Your KYC verification request has been declined.");
                    $token = array("رد", "", "");
                    $user = User::find($kycVerification->user_id);
                    send_sms($user->mobile, $msg, 'SMS', 'kycStatus', $token);
                }
            }
        } catch (Exception $exception) {
            return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('Failed to decline.'));
        }
        DB::commit();
        return redirect()->back()->with(RESPONSE_TYPE_SUCCESS, __('The KYC has been declined successfully.'));
    }
}
