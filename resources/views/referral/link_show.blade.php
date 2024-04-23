@extends('layouts.master',['hideBreadcrumb'=>true,'activeSideNav' => active_side_nav(),'topLess' => true])
@section('title', $title)
@section('content')
    @include('layouts.dashboard.title')
    @component('components.profile', ['user' => $user])

        @if(settings('referral'))
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">{{__("Affiliate Program")}}</h4>
                    </div>
                    <div class="card-body">
                        <div class="row justify-content-between">
                            <div class="col-xl-6 col-lg-6">
                                <h5>{{__("Affiliate Link")}}</h5>
                                <p>
                                    {{__("Copy and paste this link to send to friends or use in your articles. When users sign up using this link, your account will be credited with referral bonuses.")}}
                                </p>
                            </div>
                            <div class="col-xl-5 col-lg-6">
                                <h5>{{__("Share your link")}}</h5>
                                <form onsubmit="event.preventDefault()">
                                    <div class="input-group cursor-pointer">
                                        <input type="text" class="form-control"
                                               value="{{ route('register.index',['ref' => $user->referral_code ]) }}"/>
                                        <div class="input-group-append">
                                                <span class="input-group-text bg-primary text-white"
                                                      data-toggle="tooltip"
                                                      type="button" onclick="copyLink()"
                                                      title="{{ __('Copy Link') }}">{{ __('Copy') }}</span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
{{--            <div class="col-xl-12">--}}
{{--                <div class="card">--}}
{{--                    <div class="card-header">--}}
{{--                        <h4 class="card-title">Affiliate Status</h4>--}}
{{--                        <small class="mb-0">Pay on a daily basis</small>--}}
{{--                    </div>--}}
{{--                    <div class="card-body">--}}
{{--                        <div class="table-responsive">--}}
{{--                            <table class="table table-striped">--}}
{{--                                <thead>--}}
{{--                                <tr>--}}
{{--                                    <th>Index</th>--}}
{{--                                    <th>Total</th>--}}
{{--                                    <th>Previous Day</th>--}}
{{--                                </tr>--}}
{{--                                </thead>--}}
{{--                                <tbody>--}}
{{--                                <tr>--}}
{{--                                    <td>Invites</td>--}}
{{--                                    <td>5 User</td>--}}
{{--                                    <td>3 User</td>--}}
{{--                                </tr>--}}
{{--                                <tr>--}}
{{--                                    <td>Total Turnover</td>--}}
{{--                                    <td>0.248 BTC</td>--}}
{{--                                    <td>0.354 BTC</td>--}}
{{--                                </tr>--}}
{{--                                <tr>--}}
{{--                                    <td>Free Paid</td>--}}
{{--                                    <td>0.255 BTC</td>--}}
{{--                                    <td>0.253 BTC</td>--}}
{{--                                </tr>--}}
{{--                                <tr>--}}
{{--                                    <td>Affiliate Level (% of Commissions)</td>--}}
{{--                                    <td>50%</td>--}}
{{--                                    <td></td>--}}
{{--                                </tr>--}}
{{--                                </tbody>--}}
{{--                                <tfoot>--}}
{{--                                <tr>--}}
{{--                                    <th>--}}
{{--                                        Affiliate Payouts--}}
{{--                                        <br/>--}}
{{--                                        <small--}}
{{--                                        >Not listed on affiliate--}}
{{--                                            leaderboard</small--}}
{{--                                        >--}}
{{--                                    </th>--}}
{{--                                    <th>0.925 BTC</th>--}}
{{--                                    <th>0.235 BTC</th>--}}
{{--                                </tr>--}}
{{--                                </tfoot>--}}
{{--                            </table>--}}
{{--                        </div>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </div>--}}
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">{{ __('Affiliate Payout Status') }}</h4>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>{{ __('Wallet') }}</th>
                                    <th>{{ __('Last Earning At') }}</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($refferralEarnings as $refferralEarning)
                                    <tr>
                                        <td><img class="img-sm img-table"
                                                 src="{{ get_coin_icon($refferralEarning->symbol) }}"
                                                 alt="{{ $refferralEarning->symbol }}"> {{$refferralEarning->symbol}}
                                        </td>
                                        <td>{{$refferralEarning->amount}}</td>
                                    </tr>
                                @endforeach

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        @else
            <alert class="alert alert-warning text-center d-block">{{ __("Referral is currently disabled.") }}</alert>
        @endif
    @endcomponent
@endsection
@section('style')
    @include('layouts.includes._avatar_and_loader_style')
@endsection
@section('script')
    <script>
        "use strict";

        function copyLink() {
            var copyText = document.getElementById("link");
            copyText.select();
            document.execCommand("copy");
        }
    </script>
@endsection
