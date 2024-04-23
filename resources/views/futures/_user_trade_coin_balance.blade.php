<div class="card-header">
    <span class="font-size-16 font-weight-bold">
        {{ __('Sell') }} <span v-text="pairDetail.tradeCoin"></span>
    </span>
    @auth
        <span class="font-size-13 text-right"><span v-text="user.tradeCoinBalance"></span> <span
                    v-text="pairDetail.tradeCoin"></span></span>
    @endauth
</div>

