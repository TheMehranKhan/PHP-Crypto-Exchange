<div class="card-header d-flex justify-content-between">
    <span class="font-size-16 font-weight-bold">
        {{ __('Buy') }} <span v-text="pairDetail.tradeCoin"></span>
    </span>
    @auth
            <span class="font-size-13 text-right"><span v-text="user.baseCoinBalance"></span> <span
                        v-text="pairDetail.baseCoin"></span></span>
    @endauth
</div>
