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
        </ul>
    </div>
    <div class="card-body open-position-table">
        <div class="market-history market-order">
            <div class="tab-content">
                <div class="tab-pane fade show active"
                     id="open-orders"
                     role="tabpanel">
                    <div class="">
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
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card-header">
        <a href="{{ route('user.open.order') }}">
            {{ __('View Complete Open Orders') }}
        </a>
    </div>
</div>
