<?php

namespace App\Http\Controllers\Api\Webhook;

use App\Http\Controllers\Controller;
use App\Models\Core\User;
use App\Models\Kyc\KycVerification;
use App\Override\Logger;
use IDAnalyzer\DocuPass;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Exception;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class IDAnalyzerIpnController extends Controller
{
    public function __invoke(Request $request)
    {
        // Get raw post body
        $input_raw = file_get_contents('php://input');
        // Parse JSON into associative array
        $data = json_decode($input_raw, true);

        $user = User::find($data['customid']);
        if (!empty($user) && $user->is_id_verified === VERIFIED) {
            return [];
        }

        $coreapi = new DocuPass(settings('idanalyzer_kyc_api'), "US");
        // Validate result with DocuPass API Server
        $validation = $coreapi->validate($data['reference'], $data['hash']);

        if ($validation) {
            $kyc = KycVerification::where('user_id', $data['customid'])->where('status', STATUS_REVIEWING)->first();

            if (empty($kyc)) {
                $attributes['card_image'] = NULL;
                $attributes['face_image'] = NULL;
                $attributes['data'] = NULL;
                $attributes['status'] = STATUS_REVIEWING;
                $attributes['reference'] = $data['reference'];
                $attributes['id'] = Str::uuid();
                $attributes['user_id'] = $data['customid'];
                $attributes['type'] = KYC_ID_ANALYZER;

                $creation = KycVerification::create($attributes);
                if (!$creation) {
                    return [];
                }
                $kyc = KycVerification::find($creation->id);
            }

            if ($data['success'] === true) {
                $upload = [];

                $upload['id_card_front'] = !empty($data['documentimage'][0]) ?$data['documentimage'][0]['url'] : "";
                $upload['id_card_back'] = !empty($data['documentimage'][1]) ?$data['documentimage'][1]['url'] : "";
                $upload['id_card_bio'] = !empty($data['documentimage'][2]) ? $data['documentimage'][2]['url'] : "";

                $kyc->card_image = $upload;
                $kyc->face_image = !empty($data['faceimage'][0]['url']) ? $data['faceimage'][0]['url'] : $data['faceimage'];
                $kyc->data = $data['data'];
                $kyc->status = STATUS_VERIFIED;
                $kyc->reason = NULL;
                $result = VERIFIED;
                switch ($data['data']['documentType']) {
                    case "P":
                        $type = KYC_TYPE_PASSPORT;
                        break;
                    case "D":
                        $type = KYC_TYPE_DRIVING_LICENSE;
                        break;
                    case "I":
                        $type = KYC_TYPE_NID;
                        break;
                    default:
                        $type = "";
                        break;
                }
                $kyc->type = $type;

                if ($user->is_id_verified === VERIFIED) {
                    return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('You can\'t change your ID verification information for having existing ID verification.'));
                }

                DB::beginTransaction();
                try {
                    $kycupdate = $kyc->save();
                    if (!$kycupdate) {
                        throw new Exception('Failed to create KYC Verification.');
                    }
                    $user->is_id_verified = $result;
                    $updateUser = $user->save();
                    if (!$updateUser) {
                        throw new Exception('Failed to update user while KYC verification.');
                    }
                } catch (Exception $exception) {
                    DB::rollBack();
                    Logger::error($exception, "[FAILED][UserKycController][idanalyzer]");
                }
                DB::commit();
            } else {
                $kyc->status = STATUS_FAILED;
                $kyc->reason = $data['failreason'];
                $result = UNVERIFIED;

                $kycupdate = $kyc->save();
                if (!$kycupdate) {
                    throw new Exception('Failed to create KYC Verification.');
                }
            }

        }

        return [];
    }
}
