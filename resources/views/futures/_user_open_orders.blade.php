<div class="card row">
    <div class="card-header">
        <ul class="nav nav-pills" role="tablist">
            <li class="nav-item">
                <a
                        class="nav-link active"
                        data-toggle="pill"
                        href="#open-orders"
                        role="tab"
                        aria-selected="true">{{ __('My Open Orders') }}
                </a>
            </li>
            <li class="nav-item">
                <a
                        class="nav-link"
                        data-toggle="pill"
                        href="#my-trade-history"
                        role="tab"
                        aria-selected="true">{{ __('My Trade History') }}
                </a>
            </li>
        </ul>
    </div>
    <div class="card-body open-position-table">
        <div class="market-history market-order">
            <div class="tab-content">
                <div class="tab-pane fade show active"
                     id="open-orders"
                     role="tabpanel">
                    <div class="">
                        @auth
                            <table class="table lf-data-table collapsed" id="user-open-order-table">
                                <thead>
                                <tr>
                                    <th>
                                        {{ __('Symbol') }}
                                    </th>
                                    <th>
                                        {{ __('Date') }}
                                    </th>
                                    <th>
                                        {{ __('Type') }}
                                    </th>
                                    <th>
                                        {{ __('Price') }} (<span v-text="pairDetail.baseCoin"></span>)
                                    </th>
                                    <th>
                                        {{ __('Amount') }} (<span v-text="pairDetail.tradeCoin"></span>)
                                    </th>
                                    <th>
                                        {{ __('Open') }} (<span v-text="pairDetail.tradeCoin"></span>)
                                    </th>
                                    <th>
                                        {{ __('Filled') }} (<span v-text="pairDetail.tradeCoin"></span>)
                                    </th>
                                    <th>
                                        {{ __('Total') }} (<span v-text="pairDetail.baseCoin"></span>)
                                    </th>
                                    <th>
                                        {{ __('Trigger Conditions') }}
                                    </th>
                                    <th>
                                        {{ __('Action') }}
                                    </th>
                                </tr>
                                </thead>
                            </table>
                        @else
                            <div class="font-size-12 p-2 lf-toggle-border-card text-center">
                                <a href="{{ route('login') }}" class="text-green">{{ __('Log In') }}</a> {{ __('or') }}
                                <a
                                        href="{{ route('register.index') }}"
                                        class="text-green">{{ __('Register') }}</a> {{ __('to trade') }}
                            </div>
                        @endauth
                    </div>
                </div>
                <div class="tab-pane fade"
                     id="my-trade-history"
                     role="tabpanel">
                    <div class="">
                        @auth
                            <table class="table lf-data-table collapsed"
                                   id="user-trade-history-table">
                                <thead>
                                <tr>
                                    <th>{{ __('Date') }}</th>
                                    <th>{{ __('Type') }}</th>
                                    <th>{{ __('Price') }} (<span v-text="pairDetail.baseCoin"></span>)</th>
                                    <th>{{ __('Amount') }} (<span v-text="pairDetail.tradeCoin"></span>)</th>
                                    <th>{{ __('Total') }} (<span v-text="pairDetail.baseCoin"></span>)</th>
                                </tr>
                                </thead>
                            </table>
                        @else
                            <div class="font-size-12 p-2 lf-toggle-border-card text-center">
                                <a href="{{ route('login') }}" class="text-green">{{ __('Log In') }}</a> {{ __('or') }}
                                <a
                                        href="{{ route('register.index') }}"
                                        class="text-green">{{ __('Register') }}</a> {{ __('to trade') }}
                            </div>
                        @endauth
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card-header">
        <a href="{{ route('my-trade-history') }}">
            {{ __('View All') }}
        </a>
    </div>
</div>
