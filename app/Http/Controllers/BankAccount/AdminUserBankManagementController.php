<?php

namespace App\Http\Controllers\BankAccount;

use App\Http\Controllers\Controller;
use App\Http\Requests\BankManagement\BankAccountRequest;
use App\Models\BankAccount\BankAccount;
use App\Models\Core\User;
use App\Models\Deposit\WalletDeposit;
use App\Services\BankManagements\BankAccountService;
use App\Services\Core\CountryService;
use App\Services\Core\DataTableService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;
use Illuminate\Http\Request;

class AdminUserBankManagementController extends Controller
{
    protected $service;

    public function __construct(BankAccountService $service)
    {
        $this->service = $service;
    }

    public function index(): View
    {
        $searchFields = [
            ['bank_name', __('Bank Name')],
            ['iban', __('IBAN')],
            ['account_holder', __('Account Holder')],
        ];

        $orderFields = [
            ['bank_name', __('Bank Name')],
            ['iban', __('IBAN')],
            ['account_holder', __('Account Holder')],
            ['is_verified', __('Verification')],
            ['is_active', __('Status')],
        ];

        $select = ['bank_accounts.*'];
        $data['title'] = __('Bank Accounts');

        $queryBuilder = BankAccount::select($select)
            ->orderBy('id', 'desc');

        $data['dataTable'] = app(DataTableService::class)
            ->setSearchFields($searchFields)
            ->setOrderFields($orderFields)
            ->create($queryBuilder);

        return view('user_bank_managements.admin.index', $data);
    }

    public function create(): View
    {
        $data['countries'] = app(CountryService::class)->getCountries();
        $data['title'] = __('Create User Bank Account');
        return view('user_bank_managements.admin.create', $data);
    }

    public function store(BankAccountRequest $request): RedirectResponse
    {
        $attributes = $this->service->_filterAttributes($request);
        $created = BankAccount::create($attributes);

        if ($created) {
            return redirect()->route('user-banks.index')->with(RESPONSE_TYPE_SUCCESS, __('The system bank account has been added successfully.'));
        }
        return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('Failed to add the system bank account. Please try again.'))->withInput();
    }

    public function edit(Request $request): View
    {
        $bankAccount = BankAccount::find($request->segment(3));
        if (empty($bankAccount)){
            $bankAccount = BankAccount::find($request->segment(4));
        }
        $data['countries'] = app(CountryService::class)->getCountries();
        $data['title'] = __('Edit User Bank Account');
        $data['bankAccount'] = $bankAccount;

        return view('user_bank_managements.admin.edit', $data);
    }

    public function update(BankAccountRequest $request, BankAccount $bankAccount): RedirectResponse
    {
        $bankAccount = BankAccount::find($request->segment(3));
        if (empty($bankAccount)){
            $bankAccount = BankAccount::find($request->segment(4));
        }
        $attributes = $this->service->_filterAttributes($request);
        $attributes['user_id'] = $bankAccount->user_id;

        $oldStatus = $bankAccount->is_verified;

        if ($bankAccount->update($attributes)) {
            $status = $bankAccount->is_verified;
            if($oldStatus != $status){
                if($status == ACTIVE){
                    $msg = __("Your Bank Account request has been approved.");
                    $token = array("تأیید", "", "");
                } else {
                    $msg = __("Your Bank Account request has been declined.");
                    $token = array("رد", "", "");
                }

                $user = User::find($bankAccount->user_id);
                if (settings('require_mobile_verification') == ACTIVE) {
                    send_sms($user->mobile, $msg, 'SMS', 'cardStatus', $token);
                }
            }

            return redirect()->route('user-banks.edit', $bankAccount->id)->with(RESPONSE_TYPE_SUCCESS, __('The system bank account has been updated successfully.'));
        }

        return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('Failed to update the system bank account. Please try again.'))->withInput();
    }

    public function destroy(BankAccount $bankAccount): RedirectResponse
    {
        if ( $bankAccount->delete() ) {
            return redirect()->route('user-banks.index')->with(RESPONSE_TYPE_SUCCESS, __('The system bank account has been deleted successfully.'));
        }

        return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('Failed to delete the system bank account. Please try again.'))->withInput();
    }
}
