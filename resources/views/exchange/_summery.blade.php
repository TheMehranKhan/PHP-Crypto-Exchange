<div class="card">
    <div class="card-header" v-if="pairDetail.loading">{{ __('Loading...') }}</div>
    <div class="card-header" v-else="pairDetail.loading">
        <h4 class="card-title" v-text="pairDetail.name"></h4>
        <span>{{ __('24h Change') }}
              <strong :class="pairDetail.changeColorText"
                      v-text="pairDetail.change24hr"></strong>
        </span>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-xl col-lg col-md col-sm-auto col-6">
                <p class="mb-0">{{ __('24h Change') }}</p>
                <h6 :class="pairDetail.changeColorText"
                    v-text="pairDetail.change24hr"></h6>
            </div>
            <div class="col-xl col-lg col-md col-sm-auto col-6">
                <p class="mb-0">{{ __('24h High') }}</p>
                <h6>
                    <span v-text="pairDetail.high24hr"></span>
                    <span v-text="pairDetail.baseCoin"></span>
                </h6>
            </div>
            <div class="col-xl col-lg col-md col-sm-auto col-6">
                <p class="mb-0">{{ __('24h Low') }}</p>
                <h6>
                    <span v-text="pairDetail.low24hr"></span>
                    <span v-text="pairDetail.baseCoin"></span>
                </h6>
            </div>
            <div class="col-xl col-lg col-md col-sm-auto col-6">
                <p class="mb-0">{{ __('Last Price') }}</p>
                <h6>
                    <span v-text="pairDetail.lastPrice"></span>
                    <span v-text="pairDetail.baseCoin"></span>
                </h6>
            </div>
            <div class="col-xl col-lg col-md col-sm-auto col-6">
                <p class="mb-0">{{ __('24h Volume') }}</p>
                <h6>
                    <span v-text="pairDetail.baseCoinVolume"></span>
                    <span v-text="pairDetail.baseCoin"></span>
                </h6>
            </div>
            <div class="col-xl col-lg col-md col-sm-auto col-6">
                <p class="mb-0">{{ __('24h Volume') }}</p>
                <h6>
                    <span v-text="pairDetail.tradeCoinVolume"></span>
                    <span v-text="pairDetail.tradeCoin"></span>
                </h6>
            </div>
        </div>
    </div>
</div>