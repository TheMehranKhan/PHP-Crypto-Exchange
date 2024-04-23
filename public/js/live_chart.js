"use strict";
function getParameterByName(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        let regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function initTradingViewLive(tradeCoin,chartColor,rootPath){
    let widget2 = window.tvWidget = new TradingView.widget(
        {
            locale: getParameterByName('lang') || "en",
            debug: false,
            // fullscreen: true,
            autosize: true,
            height: 460,
            width: '100%',
            symbol: `binance:${tradeCoin}USDT`,
            library_path: rootPath + "plugins/charting_library/",
            custom_css_url: rootPath + "plugins/charting_library/style.css",
            interval: "D",
            timezone: "Asia/Tehran",
            theme: chartColor.theme,
            hide_legend: true,
            style: "1",
            enable_publishing: false,
            withdateranges: false,
            hide_side_toolbar: false,
            allow_symbol_change: false,
            studies: [
                "Volume@tv-basicstudies"
            ],
			"show_popup_button": true,
		    "popup_width": "1000",
		    "popup_height": "650",
            container_id: "tv_chart_container_live"
        }
    );
}