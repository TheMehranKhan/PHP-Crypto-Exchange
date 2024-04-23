@if(language(App()->getLocale())['direction']==PAGE_DIRECTION_RIGHT_TO_LEFT)
    <script src="{{ asset('plugins/cvalidator/cvalidator-language-fa.js') }}"></script>
@else
    <script src="{{ asset('plugins/cvalidator/cvalidator-language-en.js') }}"></script>
@endif
<script src="{{ asset('plugins/cvalidator/cvalidator.js') }}"></script>
<script>
    "use strict";

    $(document).ready(function () {
        $('#categoryForm').cValidate({
            rules : {
                'name' : 'required|max:255',
                'is_active' : 'required|in:0,1',
            }
        });
    });
</script>
