<div class="card">
    <div class="card-header">
        <h4 class="card-title">{{__('Your Wallet')}}</h4>
        <span>
            <img :src="pairDetail.tradeCoinIcon" class="lf-w-20px font-weight-bold"> <span
                    v-text="pairDetail.tradeCoin"></span> /
            <img :src="pairDetail.baseCoinIcon" class="lf-w-20px font-weight-bold"> <span
                    v-text="pairDetail.baseCoin"></span>
        </span>
    </div>
    <div class="card-body">
        <div class="row">
            @auth
                <div class="col-xl col-lg col-md col-sm-auto col-6">
                    <p class="mb-0">{{__('Trade Coin')}}</p>
                    <h6><span v-text="user.tradeCoinBalance"></span> <span v-text="pairDetail.tradeCoin"></span></h6>
                </div>
                <div class="col-xl col-lg col-md col-sm-auto col-6">
                    <p class="mb-0">{{__('Base Coin')}}</p>
                    <h6><span v-text="user.baseCoinBalance"></span> <span v-text="pairDetail.baseCoin"></span></h6>
                </div>
            @else
                <div class="col-12 font-size-12 p-2 lf-toggle-border-card text-center">
                    <a href="{{ route('login') }}" class="text-green">{{ __('Log In') }}</a> {{ __('or') }} <a
                            href="{{ route('register.index') }}"
                            class="text-green">{{ __('Register') }}</a> {{ __('to trade') }}
                </div>
            @endauth
        </div>
    </div>
</div>