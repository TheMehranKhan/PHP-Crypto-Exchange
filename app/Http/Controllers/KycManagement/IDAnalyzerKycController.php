<?php

namespace App\Http\Controllers\KycManagement;

use App\Http\Controllers\Controller;
use App\Http\Requests\Kyc\UserKycVerificationRequest;
use App\Models\Kyc\KycVerification;
use App\Override\Logger;
use App\Services\Core\FileUploadService;
use Exception;
use http\Env\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\View\View;
use IDAnalyzer\CoreAPI;

class IDAnalyzerKycController extends Controller
{

    public function verification_submit(Request $request)
    {
        return true;
    }

    public function verification_success(Request $request)
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
            } catch (Exception $exception) {
                DB::rollBack();
                Logger::error($exception, "[FAILED][UserKycController][store]");
                return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('Failed to upload ID.'));
            }
            DB::commit();
        }
        return redirect()->route('kyc-verifications.index')->with(RESPONSE_TYPE_SUCCESS, __('ID has been uploaded successfully.'));
    }

    public function verification_fail(Request $request)
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
            } catch (Exception $exception) {
                DB::rollBack();
                Logger::error($exception, "[FAILED][UserKycController][store]");
                return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('Failed to upload ID.'));
            }
            DB::commit();
        }
        return redirect()->route('kyc-verifications.index')->with(RESPONSE_TYPE_SUCCESS, __('ID has been uploaded successfully.'));
    }
}
