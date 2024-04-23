<?php

namespace App\Http\Controllers\BankAccount;

use App\Http\Controllers\Controller;
use App\Models\BankAccount\BankAccount;
use App\Models\Core\User;
use Illuminate\Http\RedirectResponse;

class ChangeAdminBankAccountStatusController extends Controller
{
    public function change(BankAccount $bankAccount): RedirectResponse
    {
        $oldStatus = $bankAccount->is_verified;
        if($oldStatus == INACTIVE){
            $attributes['is_verified'] = ACTIVE;
            $msg = __("Your Bank Account request has been approved.");
            $token = array("تأیید", "", "");
        } else {
            $attributes['is_verified'] = INACTIVE;
            $msg = __("Your Bank Account request has been declined.");
            $token = array("رد", "", "");
        }


        if ($bankAccount->update($attributes)) {
            $status = $bankAccount->is_verified;
            if($oldStatus != $status){
                $user = User::find($bankAccount->user_id);
                if (settings('require_mobile_verification') == ACTIVE) {
                    send_sms($user->mobile, $msg, 'SMS', 'cardStatus', $token);
                }
            }

            return redirect()->back()->with(RESPONSE_TYPE_SUCCESS, __('Successfully system bank account status changed. Please try again.'));
        }

        return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('Failed to update the system bank account. Please try again.'))->withInput();
    }
}
