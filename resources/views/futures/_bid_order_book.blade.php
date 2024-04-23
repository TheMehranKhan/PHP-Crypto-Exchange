<table class="table" id="bid-order-table">
    <thead>
    <tr>
        <th>{{ __('Price') }} (<span
                    v-text="pairDetail.baseCoin"></span>)
        </th>
        <th>{{ __('Amount') }} (<span
                    v-text="pairDetail.tradeCoin"></span>)
        </th>
        <th>{{ __('Total') }} (<span v-text="pairDetail.baseCoin"></span>)
        </th>
    </tr>
    </thead>
</table>