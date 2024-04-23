@extends('layouts.master',['hideBreadcrumb'=>true,'activeSideNav' => active_side_nav(),'topLess' => true])
@section('title', $title)
@section('content')
    @include('layouts.dashboard.title')
    @component('components.profile', ['user' => $user])
        <div class="col-xl-6 col-lg-6 col-md-6">
            <div class="card profile_card">
                <div class="card-body">
                    <div class="media">
                        @include('core.profile.avatar')
                        <div class="media-body">
                            <span>{{__('Hello')}}</span>
                            <h4 class="mb-2">{{ $user->profile->full_name }}</h4>
                            <p class="mb-1">
                            <span
                            ><i class="fa fa-phone mr-2 text-primary"></i
                                ></span>
                                {{ $user->mobile }}
                                @if( settings('require_mobile_verification') == ACTIVE )
                                    <small
                                            class="ml-3 py-1 px-2 badge badge-{{ config("commonconfig.email_status.{$user->is_mobile_verified}.color_class") }}">{{ verified_status($user->is_mobile_verified) }}</small>
                                    @if(!$user->is_mobile_verified)
                                        <a class="btn-link pull-right"
                                           href="{{ route('mobile.verification.form',$user) }}">{{ __('Verify Now') }}</a>
                                    @endif
                                @endif
                            </p>
                            <p class="mb-1">
                            <span
                            ><i class="fa fa-envelope mr-2 text-primary"></i
                                ></span>
                                {{ $user->email }}
                                @if( settings('require_email_verification') == ACTIVE )
                                    <small
                                            class="ml-3 py-1 px-2 badge badge-{{ config("commonconfig.email_status.{$user->is_email_verified}.color_class") }}">{{ verified_status($user->is_email_verified) }}</small>
                                    @if(!$user->is_email_verified)
                                        <a class="btn-link pull-right"
                                           href="{{ route('verification.form') }}">{{ __('Verify Now') }}</a>
                                    @endif
                                @endif
                            </p>
                        </div>
                    </div>

                    <ul class="card-profile__info">
                        <li>
                            <h5 class="mr-4">{{__('Birthday')}}</h5>
                            <span>{{ date('Y-m-d', strtotime($user->profile->birthday))}}</span>
                        </li>
                        <li>
                            <h5 class="mr-4">{{__('Address')}}</h5>
                            <span class="text-muted"
                            >{{ $user->profile->address }}</span>
                        </li>
                        <li>
                            <h5 class="mr-4">{{__('Since')}}</h5>
                            <span>{{ $user->profile->created_at->diffForHumans() }}</span>
                        </li>
                        <li>
                            <h5 class="text-danger mr-4">{{__('Last Login')}}</h5>
                            <span class="text-danger">{{ $userLastLogin->created_at->diffForHumans() }}, {{ $userLastLogin->location }}, {{ $userLastLogin->ip_address }} </span>
                        </li>
                        <li>
                            <h5 class="mr-4">{{__('KYC Verification')}}</h5>
                            <small class="px-2 badge badge-{{ config("commonconfig.financial_status.{$user->is_id_verified}.color_class") }}">
                                {{ verification_status($user->is_id_verified) }}
                            </small>
                        </li>
                    </ul>
{{--                    <div class="social-icons">--}}
{{--                        <a class="facebook text-center" href="javascript:void(0)"--}}
{{--                        ><span><i class="fa fa-facebook"></i></span--}}
{{--                            ></a>--}}
{{--                        <a class="twitter text-center" href="javascript:void(0)"--}}
{{--                        ><span><i class="fa fa-twitter"></i></span--}}
{{--                            ></a>--}}
{{--                        <a class="youtube text-center" href="javascript:void(0)"--}}
{{--                        ><span><i class="fa fa-youtube"></i></span--}}
{{--                            ></a>--}}
{{--                        <a class="googlePlus text-center" href="javascript:void(0)"--}}
{{--                        ><span><i class="fa fa-google"></i></span--}}
{{--                            ></a>--}}
{{--                    </div>--}}
                </div>
            </div>
        </div>

        <div class="col-xl-6 col-lg-6 col-md-6">
            <div class="card acc_balance">
                <div class="card-header">
                    <h4 class="card-title">{{__('Profile')}}</h4>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-between my-3">
                        <p class="mb-1">{{__('Username')}}</p>
                        <h5>{{ $user->username }}</h5>
                    </div>

                    <div class="d-flex justify-content-between my-3">
                        <p class="mb-1">{{__('User Role')}}</p>
                        <h5>{{ $user->role->name }}</h5>
                    </div>
                    <div class="d-flex justify-content-between my-3">
                        <p class="mb-1">{{ __('Account Status') }}</p>
                        <h4>
                            <small class=" py-1 px-2 badge badge-{{ config("commonconfig.account_status.{$user->status}.color_class") }}">
                                {{ account_status($user->status) }}
                            </small>
                        </h4>
                    </div>

                    <div class="d-flex justify-content-between my-3">
                        <p class="mb-1">{{ __('Financial Status') }}</p>
                        <h4>
                            <small class="py-1 px-2 badge badge-{{ config("commonconfig.financial_status.{$user->is_financial_active}.color_class") }}">
                                {{ financial_status($user->is_financial_active) }}
                            </small>

                        </h4>
                    </div>
                    <div class="d-flex justify-content-between my-3">
                        <p class="mb-1">{{ __('VIP User Status') }}</p>
                        <h4>
                            <small class="py-1 px-2 badge badge-{{ config("commonconfig.financial_status.{$user->is_accessible_under_maintenance}.color_class") }}">
                                {{ financial_status($user->is_accessible_under_maintenance) }}
                            </small>
                        </h4>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-12">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                    <div class="card text-center pt-2">
                        <div class="card-body">
                            <h4><i class="mdi mdi-wallet"></i> {{__('My Wallets')}}</h4>
                            <a href="{{route('user.wallets.index')}}">
                                <p class="mb-1">{{__('All Wallets')}}</p>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                    <div class="card text-center pt-2">
                        <div class="card-body">

                            <h4><i class="mdi mdi-shopping"></i> {{__('My Orders')}}</h4>
                            <p class="mb-1">
                                <a href="{{route('my-trade-history')}}">{{__('All Orders')}}</a>
                                |
                                <a href="{{route('user.open.order')}}">{{__('Open Orders')}}</a>
                            </p>

                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                    <div class="card text-center pt-2">
                        <div class="card-body">
                            <h4><i class="mdi mdi-file-document"></i> {{__('KYC Verification')}}</h4>
                            <p class="mb-1">
                                <a href="{{ route('kyc-verifications.index') }}">{{__('Management')}}</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                    <div class="card text-center pt-2">
                        <div class="card-body">
                            <h4><i class="mdi mdi-help-box"></i> {{__('Support')}}</h4>
                            <p class="mb-1">
                                <a href="{{route('tickets.index')}}">{{__('Tickets')}}</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{__('Trade History')}}</h4>
                    <a href="{{ route('my-trade-history') }}">
                        {{ __('View All') }}
                    </a>
                </div>
                <div class="card-body">
                    <div class="transaction-table">
                        @component('components.table',['class'=> 'lf-data-table table-striped'])
                            @slot('thead')
                                <tr>
                                    <th>{{__('Market')}}</th>
                                    <th>{{__('Price')}}</th>
                                    <th>{{__('Type')}}</th>
                                    <th>{{__('Amount')}}</th>
                                    <th>{{__('Total')}}</th>
                                    <th>{{__('Fee')}}</th>
                                    <th>{{__('Date')}}</th>
                                </tr>
                            @endslot
                            @foreach($tradeHistories as $tradeHistory)
                                <tr>
                                    <td>{{ $tradeHistory->trade_pair }}</td>
                                    <td>{{ order_type($tradeHistory->order_type) }}</td>
                                    <td>{{ $tradeHistory->price }}</td>
                                    <td>{{ $tradeHistory->amount }}</td>
                                    <td>{{ $tradeHistory->total }}</td>
                                    <td>{{ $tradeHistory->fee }}</td>
                                    <td class="text-right">{{ $tradeHistory->created_at->toFormattedDateString() }}</td>

                                </tr>
                            @endforeach
                        @endcomponent
                    </div>
                    <div class="my-4">
                        <a href="{{ route('profile.edit') }}"
                           class="btn lf-card-btn btn-info">
                            {{ __('Edit Profile') }}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    @endcomponent
@endsection

@section('style')
    @include('layouts.includes._avatar_and_loader_style')
@endsection

@section('style')
    @include('layouts.includes.list-css')
@endsection

@section('script')
    @include('layouts.includes.list-js')
@endsection
