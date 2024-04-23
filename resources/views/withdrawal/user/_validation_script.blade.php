@if(language(App()->getLocale())['direction']==PAGE_DIRECTION_RIGHT_TO_LEFT)
    <script src="{{ asset('plugins/cvalidator/cvalidator-language-fa.js') }}"></script>
@else
    <script src="{{ asset('plugins/cvalidator/cvalidator-language-en.js') }}"></script>
@endif
<script src="{{ asset('plugins/cvalidator/cvalidator.js') }}"></script>
<script>
    let rules;
    @if(in_array($wallet->coin->type,[COIN_TYPE_CRYPTO, COIN_TYPE_ERC20,COIN_TYPE_BEP20,COIN_TYPE_TRC20,COIN_TYPE_TRC10]))
        rules = {
        'amount': 'required|numeric|min:{{!empty($bonus) ? bcsub($wallet->coin->minimum_withdrawal_amount, $bonus->earning, 8) : $wallet->coin->minimum_withdrawal_amount}}',
        'withdrawal_policy': 'required',
        'address': 'required|max:255',
    };
    @else
        rules = {
        'amount': 'required|numeric|min:{{$wallet->coin->minimum_withdrawal_amount}}',
        'withdrawal_policy': 'required',
        'api': 'required',
        'bank_account_id': 'required',
    };
    @endif

    $(document).ready(function () {
        $('#withdrawalForm').cValidate({
            rules: rules
        });
    });
</script>
