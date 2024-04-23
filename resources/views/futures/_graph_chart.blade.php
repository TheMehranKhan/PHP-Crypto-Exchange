<div class="tradingview-widget-container card">
    <div class="card-body">
        <div class="graph-loader">
            <div class="card-header pt-0">
                <ul class="nav nav-pills" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active"
                           data-toggle="pill"
                           href="#limit"
                           role="tab"
                           @click="changeChart('live')"
                           aria-selected="true">{{__('TradingView')}}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
                           data-toggle="pill"
                           href="#market"
                           role="tab"
                           @click="changeChart('manual')"
                           aria-selected="false">{{__('Original')}}</a>
                    </li>
                </ul>
                <ul class="nav nav-pills" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link"
                           data-toggle="pill"
                           href="#tokeninfo"
                           role="tab"
                           aria-selected="true">{{__('Token Info')}}</a>
                    </li>
                </ul>
            </div>
            <div class="tab-content h-100">
                <div class="h-90 tab-pane fade show active"
                     id="limit"
                     role="tabpanel">
                    <div id="tv_chart_container_live" class="h-100"></div>
                </div>
                <div class="h-90 tab-pane fade h-100"
                     id="market"
                     role="tabpanel">
                    <div id="tv_chart_container"
                         class="h-100"></div>
                </div>
                <div class="h-90 tab-pane fade h-100"
                     id="tokeninfo"
                     role="tabpanel">
                    sdfsdf
                </div>
            </div>
            {{--            @if (settings('live_chart'))--}}
            {{--                <div id="tv_chart_container_live" class="h-100"></div>--}}
            {{--            @endif--}}

        </div>
    </div>
</div>
