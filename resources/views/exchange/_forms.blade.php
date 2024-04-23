<div class="card">
    <div class="card-header">
        <ul class="nav nav-pills" role="tablist">
            <li class="nav-item">
                <a class="nav-link active"
                        data-toggle="pill"
                        href="#limit"
                        role="tab"
                        aria-selected="true">{{__('Limit')}}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link"
                        data-toggle="pill"
                        href="#market"
                        role="tab"
                        aria-selected="false">{{__('Market')}}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link"
                        data-toggle="pill"
                        href="#stop-limit"
                        role="tab"
                        aria-selected="false">{{__('Stop Limit')}}</a>
            </li>
        </ul>
        <h5><a :href=`{{ route('futures.index', '') }}/${pairDetail.tradePair}` >{{__('Futures')}} <span class="badge badge-secondary">100x</span></a></h5>
    </div>
    <div class="card-body market-limit">
        <div class="tab-content">
            <div class="tab-pane fade show active"
                    id="limit"
                    role="tabpanel">
                @include('exchange._limit_forms')
            </div>
            <div class="tab-pane fade"
                    id="market"
                    role="tabpanel">
                @include('exchange._market_forms')
            </div>
            <div class="tab-pane fade"
                    id="stop-limit"
                    role="tabpanel">
                @include('exchange._stop_limit_forms')
            </div>

        </div>
    </div>
</div>