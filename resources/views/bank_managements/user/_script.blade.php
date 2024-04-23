@if(language(App()->getLocale())['direction']==PAGE_DIRECTION_RIGHT_TO_LEFT)
    <script src="{{ asset('plugins/cvalidator/cvalidator-language-fa.js') }}"></script>
@else
    <script src="{{ asset('plugins/cvalidator/cvalidator-language-en.js') }}"></script>
@endif
<script src="{{ asset('plugins/cvalidator/cvalidator.js') }}"></script>
<script>
    "use strict";

    $(document).ready(function () {
        $('.validator-form').cValidate({
            rules : {
                'bank_name' : 'required|max:255',
                'iban' : 'required|max:255',
                'swift' : 'required|max:255',
                'bank_address' : 'required|max:255',
                'account_holder' : 'required|max:255',
                'account_holder_address' : 'required|max:255',
                'country_id' : 'required',
                'is_active' : 'required',
            }
        });
    });
</script>
