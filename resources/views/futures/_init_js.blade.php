<script>
    "use strict";

    $(function () {
        $(document).on('click', '.cancel_order', function (event) {
            event.preventDefault();
            const buttonInstance = $(this);
            buttonInstance.attr('disabled', 'disabled');
            const loadingText = "{{__('Canceling...')}}";

            if (buttonInstance.html() !== loadingText) {
                buttonInstance.data('original-text', buttonInstance.html());
                buttonInstance.html(loadingText);
            }

            const url = buttonInstance.data('url');
            const orderId = buttonInstance.data('id');
            vueInstance.cancelOrder(orderId, url, buttonInstance);
        });
    });

    let validationOptions = {
        messageOnSubmit: true,
        formSubmission: false,
        rules: {
            stop: "required|numeric|decimalScale:11,8|between:0.00000001,99999999999.99999999",
            price: "required|numeric|decimalScale:11,8|between:0.00000001,99999999999.99999999",
            limit: "required|numeric|decimalScale:11,8|between:0.00000001,99999999999.99999999",
            amount: "required|numeric|decimalScale:11,8|between:0.00000001,99999999999.99999999",
            total: "required|numeric|decimalScale:11,8|between:0.00000001,99999999999.99999999",
        }
    };

    let limitBuyForm = $('#limit-buy-form').cValidate(validationOptions);
    let limitSellForm = $('#limit-sell-form').cValidate(validationOptions);
    let stopLimitBuyForm = $('#stop-limit-buy-form').cValidate(validationOptions);
    let stopLimitSellForm = $('#stop-limit-sell-form').cValidate(validationOptions);
    let marketBuyForm = $('#market-buy-form').cValidate(validationOptions);
    let marketSellForm = $('#market-sell-form').cValidate(validationOptions);

    var sheet = document.createElement('style'),
        $rangeInput = $('#limit-sell-form .range input'),
        prefs = ['webkit-slider-runnable-track', 'moz-range-track', 'ms-track'];

    document.body.appendChild(sheet);

    var getTrackStyle = function (el) {
        var curVal = el.value,
            val = (curVal - 1) * 25,
            style = '';

        // Set active label
        // $('.range-labels li').removeClass('active selected');

        var curLabel = $('.range-labels').find('li:nth-child(' + curVal + ')');

        // curLabel.addClass('active selected');
        // curLabel.prevAll().addClass('selected');

        // Change background gradient
        for (var i = 0; i < prefs.length; i++) {
            style += '.range {background: linear-gradient(to right, #229e6b 0%, #229e6b ' + val + '%, #fff ' + val + '%, #fff 100%)}';
            style += '.range input::-' + prefs[i] + '{background: linear-gradient(to right, #229e6b 0%, #229e6b ' + val + '%, #b2b2b2 ' + val + '%, #b2b2b2 100%)}';
        }

        return style;
    }

    $rangeInput.on('input', function () {
        sheet.textContent = getTrackStyle(this);
    });

    // Change input value on label click
    // $('.range-labels li').on('click', function () {
    //     var index = $(this).index();
    //     $rangeInput.val(index * 25).trigger('input');
    // });

</script>
