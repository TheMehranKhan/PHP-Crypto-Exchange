<div class="card">
    <div class="card-header">
        <span class="font-size-16 font-weight-bold">{{ __('MARKETS') }}</span>
        <div id="market-table-dropdown-wrapper" class="w-50 text-right"></div>
    </div>
    <div class="card-body price-pair">
        <div class="tab-content">
            <div class="tab-pane fade show active"
                    id="BTC"
                    role="tabpanel">
                <table class="table table-borderless lf-data-table" id="market-table">
                    <thead>
                    <tr>
                        <th>{{ __('Coin') }}</th>
                        <th>{{ __('Price') }}</th>
                        <th>{{ __('Volume') }}</th>
                        <th>{{ __('Change') }}</th>
                    </tr>
                    </thead>
                    <tbody class="font-size-13"></tbody>
                </table>
            </div>
        </div>
    </div>
</div>
