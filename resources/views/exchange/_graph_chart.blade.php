<div class="tradingview-widget-container card">
    <div class="card-body">
        <div class="graph-loader">
            @if (settings('live_chart'))
                <div id="tv_chart_container_live" class="h-100"></div>
            @endif
            <div id="tv_chart_container" class="h-100 {{ settings('live_chart') ? 'd-none' : 'd-block'}}"></div>
        </div>
    </div>
</div>
