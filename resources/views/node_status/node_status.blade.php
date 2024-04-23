@extends('layouts.master',['hideBreadcrumb'=>true,'activeSideNav' => active_side_nav(),'topLess' => true])
@section('title', $title)
@section('content')
    @include('layouts.dashboard.title')
    @component('components.card')
        <div class="col-md-4 my-3">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{ __('Coinpayments API') }}</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive">
                            <button class="btn btn-info check-status" data-coin="USD"
                                    data-api="{{ API_COINPAYMENT }}">{{ __('Check Status') }}</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4 my-3">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{ __('Ethereum Node') }}</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive">
                            <button class="btn btn-info check-status" data-coin="ETH"
                                    data-api="{{ API_ETHEREUM }}">{{ __('Check Status') }}</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 my-3">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{ __('Binance Node') }}</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive">
                            <button class="btn btn-info check-status" data-coin="BNB"
                                    data-api="{{ API_BINANCE }}">{{ __('Check Status') }}</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 my-3">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{ __('TronGrid Node') }}</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="table-responsive">
                            <button class="btn btn-info check-status" data-coin="TRX"
                                    data-api="{{ API_TRON }}">{{ __('Check Status') }}</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @foreach($btcForkedCoins as $btcForkedCoin)
            <div class="col-md-4 my-3">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">{{ __(':name Node', ['name' => $btcForkedCoin->name]) }}</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="table-responsive">
                                <button class="btn btn-info check-status" data-coin="{{ $btcForkedCoin->symbol }}"
                                        data-api="{{ API_BITCOIN }}">{{ __('Check Status') }}</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    @endcomponent
@endsection

@section('script')
    <script>
        $(document).on('click', '.check-status', function () {
            let wrapper = $(this).closest('.table-responsive');
            let coin = $(this).data('coin');
            let api = $(this).data('api');
            let route = '{{ route('admin.node-status.show', ['TTT', 'API']) }}';
            route = route.replace('TTT', coin);
            route = route.replace('API', api);
            let loader = `<button class="btn btn-info" type="button" disabled>
                                <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                                {{ __('Loading...') }}
            </button>`
            wrapper.html(loader);

            axios.get(route).then(response => {
                wrapper.html(response.data);
            })
        });
    </script>
@endsection
