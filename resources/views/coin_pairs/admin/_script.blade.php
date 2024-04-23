@if(language(App()->getLocale())['direction']==PAGE_DIRECTION_RIGHT_TO_LEFT)
    <script src="{{ asset('plugins/cvalidator/cvalidator-language-fa.js') }}"></script>
@else
    <script src="{{ asset('plugins/cvalidator/cvalidator-language-en.js') }}"></script>
@endif
<script src="{{ asset('plugins/cvalidator/cvalidator.js') }}"></script>
<script>
    "use strict";

    $(document).ready(function () {
        var form = $('#coinPairForm').cValidate({
            rules : {
                'trade_coin' : 'required',
                'base_coin' : 'required',
                'last_price' : 'required|numeric|between:0.00000001, 99999999999.99999999',
                'is_default' : 'required',
                'is_futures' : 'required',
                'is_active' : 'required',
            }
        });
    });
</script>
