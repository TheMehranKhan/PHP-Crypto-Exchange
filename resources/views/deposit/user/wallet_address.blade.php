@extends('layouts.master',['hideBreadcrumb'=>true,'activeSideNav' => active_side_nav(),'topLess' => true])
@section('title', $title)
@section('content')
    @include('layouts.dashboard.title')
    @component('components.card')
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{$title}}</h4>
                </div>
                <div class="card-body" id="deposits">
                    <div class="wallet-address">
                        @if($wallet->coin->deposit_status == ACTIVE)
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab"
                                       href="#tab1">{{($wallet->coin->api['selected_apis'] == "CoinpaymentsApi") ? $wallet->coin->symbol : str_replace('Api','',$wallet->coin->api['selected_apis'])}}</a>
                                </li>
                                {{--                                <li class="nav-item">--}}
                                {{--                                    <a class="nav-link" data-toggle="tab" href="#tab2">ERC20</a>--}}
                                {{--                                </li>--}}
                                {{--                                <li class="nav-item">--}}
                                {{--                                    <a class="nav-link" data-toggle="tab" href="#tab3">BEP20</a>--}}
                                {{--                                </li>--}}
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="tab1">
                                    @if(isset($addressSvg))
                                        <div class="qrcode">
                                            {{ view_html($addressSvg) }}
                                            <small class="text-center d-block">{{ __('Scan QR code or copy the address') }}</small>
                                        </div>
                                        <form>
                                                <div class="col-xl-12">
                                                    <figcaption id="addressText"
                                                                class="font-size-20 text-center">{{ $walletAddress }}</figcaption>
                                                </div>
                                                <div class="col-xl-12 pt-2">
                                                    <button type="button" id="copyAddressBtn"
                                                            class="col-xl-3 col-md-12 col-lg-3 col-sm-12 mx-auto btn btn-block bg-primary text-center text-white ">
                                                        {{ __('Copy') }}
                                                    </button>
                                                </div>
                                        </form>
                                    @else
                                        <figcaption class="py-4">
                                            {{ view_html($walletAddress) }}
                                        </figcaption>
                                    @endif
                                </div>
                                <div class="tab-pane fade" id="tab2">

                                    <div class="row">
                                        <div class="col-md-8 offset-md-2">
                                            <div class="card">
                                                <div class="card-body p-4 text-center">
                                                    <h4 class="text-muted">
                                                        <strong>Under Maintenance</strong>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab3">
                                    <div class="row">
                                        <div class="col-md-8 offset-md-2">
                                            <div class="card">
                                                <div class="card-body p-4 text-center">
                                                    <h4 class="text-muted">
                                                        <strong>Under Maintenance</strong>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                @else
                                    <div class="row">
                                        <div class="col-md-8 offset-md-2">
                                            <div class="card">
                                                <div class="card-body p-4 text-center">
                                                    <h4 class="text-muted">
                                                        <strong>{{ $walletAddress }}</strong>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endif
                            </div>
                            @endcomponent
                    </div>
                    <div class="col-xl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">{{__('Important Information')}}</h4>
                            </div>
                            <div class="card-body">
                                <div class="important-info">
                                    <ul class="pt-1">
                                        <li>
                                            <i class="mdi mdi-checkbox-blank-circle"></i>
                                            {{ __('Warning! This wallet address is under :network Network. Sending any other network will result in permanent loss.', ['network' => ($wallet->coin->api['selected_apis'] == "CoinpaymentsApi") ? $wallet->coin->symbol : str_replace('Api','',$wallet->coin->api['selected_apis'])]) }}

                                        </li>
                                        <li>
                                            <i class="mdi mdi-checkbox-blank-circle"></i>
                                            {{ __('Only send :coinName (:coin) to this address. Sending any other digital asset will result in permanent loss.', ['coinName' => $wallet->coin->name, 'coin' => $wallet->symbol]) }}

                                        </li>
                                        <li>
                                            <i class="mdi mdi-checkbox-blank-circle"></i>
                                            {{ __('Minimum Deposit for this coin is :minDeposit', ['minDeposit' => !empty($wallet->coin->minimum_deposit_amount) ? $wallet->coin->minimum_deposit_amount : "No Limit"]) }}

                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
@endsection
@section('style')
    <style>
        svg {
            max-width: 100%;
        }
    </style>
@endsection
@section('script')
    <script>
        "use strict";

        $(document).ready(function () {
            var copyAddressBtn = $("#copyAddressBtn");
            copyAddressBtn.on("click", function () {
                copyToClipboard("#addressText");
            });

            function copyToClipboard(element) {
                var $temp = $("<input>");
                $("body").append($temp);
                $temp.val($(element).html()).select();
                document.execCommand("copy");
                $temp.remove();
            }
        });
    </script>
@endsection
