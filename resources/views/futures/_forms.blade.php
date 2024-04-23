<div class="card">
    <div class="card-header">
        <ul class="nav nav-pills" role="tablist">
            <li class="nav-item">
                <a class="nav-link active"
                        data-toggle="pill"
                        href="#limitFormTab"
                        role="tab"
                        aria-selected="true">{{__('Limit')}}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link"
                        data-toggle="pill"
                        href="#marketFormTab"
                        role="tab"
                        aria-selected="false">{{__('Market')}}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link"
                        data-toggle="pill"
                        href="#stopLimitFormTab"
                        role="tab"
                        aria-selected="false">{{__('Stop Limit')}}</a>
            </li>
        </ul>
    </div>
    <div class="card-body market-limit">
        <div class="tab-content w-100">
            <div class="tab-pane fade show active"
                    id="limitFormTab"
                    role="tabpanel">
                @include('futures._limit_forms')
            </div>
            <div class="tab-pane w-100 fade"
                    id="marketFormTab"
                    role="tabpanel">
                @include('futures._market_forms')
            </div>
            <div class="tab-pane w-100 fade"
                    id="stopLimitFormTab"
                    role="tabpanel">
                @include('futures._stop_limit_forms')
            </div>

        </div>
    </div>
</div>