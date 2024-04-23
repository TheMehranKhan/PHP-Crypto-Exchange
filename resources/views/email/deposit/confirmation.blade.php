@component('mail::message')
# {{ __('Dear') }}, {{ $profile->profile->full_name }}

{{ __("You've just received :amount :coin",['amount' => $deposit->amount, 'coin' => $deposit->symbol]) }}

**{{ __('Your deposit request details are:') }}**

**{{ __('Request ID:') }}** {{ $deposit->id }}<br>
**{{ __('Wallet:') }}** {{ $deposit->symbol }}<br>
**{{ __('System Fee:') }}** {{ $deposit->system_fee }}<br>
**{{ __('Amount:') }}** {{ $deposit->amount }}<br>
**{{ __('Address:') }}** {{ $deposit->address }}<br>
**{{ __('Date:') }}** {{ $deposit->created_at }}<br>

<p style="text-align: center; font-weight: bold;margin-top: 30px">{{ __("After making a deposit, you can track its progress on the Deposit & Withdrawal History page.") }}</p>

{{ __("Please contact the support team with the Request ID: :id for any further assistance.", ['id' => $deposit->id]) }}

{{ __('Thanks a lot for being with us,') }}<br>
{{ company_name() }}
@endcomponent
