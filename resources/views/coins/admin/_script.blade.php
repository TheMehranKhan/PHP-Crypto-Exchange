@if(language(App()->getLocale())['direction']==PAGE_DIRECTION_RIGHT_TO_LEFT)
    <script src="{{ asset('plugins/cvalidator/cvalidator-language-fa.js') }}"></script>
@else
    <script src="{{ asset('plugins/cvalidator/cvalidator-language-en.js') }}"></script>
@endif
<script src="{{ asset('plugins/cvalidator/cvalidator.js') }}"></script>
<script>
    "use strict";

    $(document).ready(function () {
        let validate = $('#coinForm').cValidate({
            rules: {
                'type': 'required',
                'symbol': 'required|max:10',
                'name': 'required|max:255',
                'icon': 'image',
                'exchange_status': 'required',
                'is_active': 'required',
            }
        });
    });
    
    new Vue({
        el: "#app",
        data: {
            showERC20Fields: "erc20" === "{{old('type', isset($coin) ? $coin->type : '')}}" || "trc20" === "{{old('type', isset($coin) ? $coin->type : '')}}" || "trc10" === "{{old('type', isset($coin) ? $coin->type : '')}}"
        },
        methods: {
            onTypeChange(event) {
                this.showERC20Fields = event.target.value === "erc20" || event.target.value === "trc20" || event.target.value === "trc10";
                if (this.showERC20Fields) {
                    validate.setRules({
                        "contract_address": "required|max:42",
                        "decimal_place": "required|numeric|min:6|max:18"
                    });
                }
                validate.reFormat();
            }
        }
    })
</script>
