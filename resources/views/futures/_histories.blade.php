<div class="card">
    <div class="card-header">
        <span class="font-size-16 font-weight-bold">{{ __('Market Trade History') }}</span>
    </div>
    <div class="card-body price-pair">
        <table class="table table lf-data-table dataTable no-footer dtr-inline"
               id="market-trade-history-table">
            <thead>
            <tr>
                <th>{{ __('Price') }} (<span
                            v-text="pairDetail.baseCoin"></span>)
                </th>
                <th>{{ __('Amount') }} (<span
                            v-text="pairDetail.tradeCoin"></span>)
                </th>
                <th>{{ __('Date') }}</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
