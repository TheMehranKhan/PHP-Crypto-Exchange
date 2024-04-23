
    <div class="card">
        <div class="card-header">
            <span class="font-size-16 font-weight-bold">{{ __('My Trade History') }}</span>
            <a href="{{ route('my-trade-history') }}">
                {{ __('View All') }}
            </a>
        </div>
        <div class="card-body price-pair">
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
                    <a href="{{ route('login') }}" class="text-green">{{ __('Log In') }}</a> {{ __('or') }} <a
                            href="{{ route('register.index') }}"
                            class="text-green">{{ __('Register') }}</a> {{ __('to trade') }}
                </div>
            @endauth
        </div>
    </div>
