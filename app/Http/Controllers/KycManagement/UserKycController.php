<?php

namespace App\Http\Controllers\KycManagement;

use App\Http\Controllers\Controller;
use App\Http\Requests\Kyc\UserKycVerificationRequest;
use App\Models\Core\User;
use App\Models\Kyc\KycVerification;
use App\Override\Logger;
use App\Services\Core\FileUploadService;
use Exception;
use Illuminate\Http\Request;
use IDAnalyzer\DocuPass;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\View\View;
class UserKycController extends Controller
{
    public function index(): View
    {
        $result = NULL;
        if (settings('enable_kyc_verification_in_exchange') != ACTIVE) {
            abort('404', "This page is not available at this time");
        }

        $data['user'] = Auth::user();
        $data['title'] = __('Upload ID');
        $data['kycVerification'] = $data['user']->kycVerification(STATUS_VERIFIED)->first();
        if (is_null($data['kycVerification'])) {
            $data['kycVerification'] = $data['user']->kycVerification(STATUS_REVIEWING)->first();
        }

        if (settings('enable_idanalyzer_kyc') == ACTIVE && is_null($data['kycVerification'])) {
            $coreapi = new DocuPass(settings('idanalyzer_kyc_api'), "GB");

            $coreapi->enableAuthentication(true, 2, 0.3);
            $coreapi->enableFaceVerification(true, 1, 0.5);
            $coreapi->setMaxAttempt(2);
            $coreapi->setCustomID(Auth::id());
            // Set a callback URL where verification results will be sent
            $coreapi->setCallbackURL(route('kyc-verifications.callback'));

            // We want to redirect user back to your website when they are done with verification
            $coreapi->setRedirectionURL(route('kyc-verifications.success'), route('kyc-verifications.fail'));
            // Create a session using DocuPass Iframe module
            $result = $coreapi->createIframe();

            // Create a session using DocuPass Redirection module
            // $result = $coreapi->createRedirection();
        }

        $data['IDAnalyzer'] = $result;
        return view('kyc_management.user.index', $data);

    }

    public function store(UserKycVerificationRequest $request)
    {
        if (settings('enable_kyc_verification_in_exchange') != ACTIVE) {
            return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('You can\'t send kyc request at this time'));
        }

        $uploadedIdFiles = [];
        foreach ($request->allFiles() as $fieldName => $file) {
            $uploadedIdFiles[$fieldName] = app(FileUploadService::class)->upload($file, config('commonconfig.path_id_image'), $fieldName, 'id', Auth::id(), 'public');
        }

        if (!empty($uploadedIdFiles)) {
            $attributes['card_image'] = $uploadedIdFiles;
            $attributes['status'] = STATUS_REVIEWING;
            $attributes['id'] = Str::uuid();
            $attributes['user_id'] = Auth::id();
            $attributes['type'] = $request->id_type;

            if (Auth::user()->is_id_verified === VERIFIED) {
                return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('You can\'t change your ID verification information for having existing ID verification.'));
            }

            DB::beginTransaction();
            try {
                $created = KycVerification::create($attributes);
                if (!$created) {
                    throw new Exception('Failed to create KYC Verification.');
                }

                $updateUser = Auth::user()->update(['is_id_verified' => VERIFIED]);
                if (!$updateUser) {
                    throw new Exception('Failed to update user while KYC verification.');
                }
                $parameters = $request->only('id_card', 'zip_code', 'phone', 'address');

                Auth::user()->profile()->update($parameters);

            } catch (Exception $exception) {
                DB::rollBack();
                Logger::error($exception, "[FAILED][UserKycController][store]");
                return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('Failed to upload ID.'));
            }
            DB::commit();
            if (settings('require_mobile_verification') == ACTIVE) {
                $superadmins = User::where('is_super_admin', ACTIVE)->get();
                foreach ($superadmins as $superadmin) {
                    $name = Auth::user()->username;
                    $fullName = str_replace('_', '.', $name);
                    $msg = __("Your KYC verification request has been declined.");
                    $token = array($fullName, "", "");
                    send_sms($superadmin->mobile, $msg, 'SMS', 'newKVC', $token);
                }
            }

        }
        return redirect()->route('kyc-verifications.index')->with(RESPONSE_TYPE_SUCCESS, __('ID has been uploaded successfully.'));
    }

    public function verification_success(Request $request)
    {
        return redirect()->route('kyc-verifications.index')->with(RESPONSE_TYPE_SUCCESS, __('KYC has been submitted successfully.'));
    }

    public function verification_fail(Request $request)
    {
        return redirect()->route('kyc-verifications.index')->with(RESPONSE_TYPE_ERROR, __('Failed to update user while KYC verification.'));
    }
}
