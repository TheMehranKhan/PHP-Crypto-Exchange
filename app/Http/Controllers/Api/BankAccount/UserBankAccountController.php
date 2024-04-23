<?php

namespace App\Http\Controllers\Api\BankAccount;

use App\Http\Controllers\Controller;
use App\Http\Requests\BankManagement\BankAccountRequest;
use App\Models\BankAccount\BankAccount;
use App\Services\BankManagements\BankAccountService;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class UserBankAccountController extends Controller
{

    public BankAccountService $BankAccountService;

    public function __construct(BankAccountService $BankAccountService)
    {
        $this->BankAccountService = $BankAccountService;
    }

    public function index()
    {
        $bankAccounts = BankAccount::where('user_id', Auth::id())->get();

        return response()->json([
            RESPONSE_STATUS_KEY => true,
            RESPONSE_DATA => $bankAccounts,
        ]);
    }

    public function store(BankAccountRequest $request)
    {
        $attributes = $this->BankAccountService->_filterAttributes($request);
        $created = BankAccount::create($attributes);

        if ($created) {
            return response()->json([
                RESPONSE_STATUS_KEY => true,
                RESPONSE_DATA => $created,
            ]);
        }

        return response()->json([
            RESPONSE_STATUS_KEY => false,
            RESPONSE_MESSAGE_KEY => __('Failed to create the bank account.')
        ]);
    }

    public function update(BankAccountRequest $request)
    {
        $bankAccount = BankAccount::find($request->id);
        if ($bankAccount->user_id != Auth::id() || $bankAccount->is_verified == ACTIVE) {
            return response()->json([
                RESPONSE_STATUS_KEY => false,
                RESPONSE_MESSAGE_KEY => __('The Invalid bank account id. Please try again')
            ]);
        }

        $attributes = $this->BankAccountService->_filterAttributes($request);
        if ($bankAccount->update($attributes)) {
            return response()->json([
                RESPONSE_STATUS_KEY => true,
                RESPONSE_MESSAGE_KEY => __('The bank account has been updated successfully.'),
                RESPONSE_DATA => $bankAccount
            ]);
        }
        return response()->json([
            RESPONSE_STATUS_KEY => false,
            RESPONSE_MESSAGE_KEY => __('Failed to update the bank account. Please try again.')
        ]);
    }

    public function destroy(Request $request)
    {
        if (BankAccount::find($request->id)->delete()) {
            return response()->json([
                RESPONSE_STATUS_KEY => true,
                RESPONSE_MESSAGE_KEY => __('The bank account has been delete successfully.'),
                RESPONSE_DATA => ''
            ]);
        }
        return response()->json([
            RESPONSE_STATUS_KEY => false,
            RESPONSE_MESSAGE_KEY => __("Failed to delete the bank account."),
            RESPONSE_DATA => ''
        ]);
    }
}
