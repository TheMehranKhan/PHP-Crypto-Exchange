@extends('layouts.master', ['hideBreadcrumb' => $visualPage->settings['hide_breadcrumb'], 'cmbPage' => $visualPage,'activeSideNav'=>active_side_nav()])

@section('title', $visualPage->title)

@section('content')
    @if(Route::currentRouteName() == 'home')
        <div class="kWjfqv">
            <div class="MuiBox-root jss1 sc-dkPtyc gnliEL banner-container">
                <div class="MuiBox-root jss2 sc-dkPtyc gnliEL background-banner"></div>
                <div class="MuiBox-root jss3 sc-dkPtyc gnliEL explanation">
                    <div class="MuiBox-root jss5 sc-dkPtyc gnliEL explanation-title">
                        <div class="intro-content">
                            <h1>
                                {{__('The Most')}} <span class="theme-color" id="dynamic_txt"></span>
                                <br>
                                {{__('Cryptocurrency Exchange.')}}
                            </h1>
                            <p>
                                {{__('Get started with the easiest and most secure platform to buy, sell, trade, and earn cryptocurrencies.')}}
                            </p>
                        </div>

                        <div class="intro-btn">
                            <a href="{{route('user.wallets.index')}}" class="btn btn-primary">{{__('Get Started')}}</a>
                            <a href="{{route('exchange.index')}}" class="btn btn-outline-primary">{{__('Browse Now')}}</a>
                        </div>
                    </div>
                </div>
                <div class="MuiBox-root jss7 sc-dkPtyc gnliEL coin-container bitcoin">
                    <div class="lazyload-wrapper "><img alt="bitcoin" title="cardano"
                                                        src="{{asset('/images')}}/bitcoin_banner.png">
                    </div>
                </div>
                <div class="MuiBox-root jss8 sc-dkPtyc gnliEL coin-container ethereum">
                    <div class="lazyload-wrapper "><img alt="ethereum" title="cardano"
                                                        src="{{asset('/images')}}/ethereum_banner.png">
                    </div>
                </div>
                <div class="MuiBox-root jss9 sc-dkPtyc gnliEL coin-container mazdax">
                    <div class="lazyload-wrapper "><img alt="mazdax" title="cardano"
                                                        src="{{asset('/images')}}/mazdax_banner.png">
                    </div>
                </div>
                <div class="MuiBox-root jss10 sc-dkPtyc gnliEL coin-container cardano">
                    <div class="lazyload-wrapper "><img alt="cardano" title="cardano"
                                                        src="{{asset('/images')}}/cardano_banner.png">
                    </div>
                </div>
                <div class="MuiBox-root jss11 sc-dkPtyc gnliEL cards-container">
                    <div class="MuiBox-root jss12 sc-dkPtyc gnliEL main-card">
                        <div class="MuiBox-root jss13 sc-dkPtyc gnliEL chart-card">
                            <div class="lazyload-wrapper "><img alt="trading view chart" title="trading view chart"
                                                                class="chart-image"
                                                                src="{{asset('/images')}}/chart_banner.svg">
                            </div>
                            <div class="MuiBox-root jss14 sc-dkPtyc gnliEL banner-card deposit">
                                <div class="card-container">
                                    <div class="blur-card"></div>
                                    <div class="lazyload-wrapper "><img alt="wallet" title="wallet"
                                                                        src="{{asset('/images')}}/deposit_banner.svg">
                                    </div>
                                </div>
                            </div>
                            <div class="MuiBox-root jss15 sc-dkPtyc gnliEL banner-card order">
                                <div class="card-container">
                                    <div class="blur-card"></div>
                                    <div class="lazyload-wrapper "><img alt="order" title="order"
                                                                        src="{{asset('/images')}}/order_banner.svg">
                                    </div>
                                </div>
                            </div>
                            <div class="MuiBox-root jss16 sc-dkPtyc gnliEL banner-card wallet">
                                <div class="card-container">
                                    <div class="blur-card"></div>
                                    <div class="lazyload-wrapper "><img alt="order history" title="order history"
                                                                        src="{{asset('/images')}}/wallets_banner.svg">
                                    </div>
                                </div>
                            </div>
                            <div class="MuiBox-root jss17 sc-dkPtyc gnliEL market-container banner-card">
                                <div class="MuiBox-root jss18 sc-dkPtyc gnliEL btc-market market-item">
                                    <div class="MuiBox-root jss19 sc-dkPtyc gnliEL card-container">
                                        <div class="blur-card"></div>
                                        <div class="lazyload-wrapper "><img class="market-coin" alt="bitcoin market"
                                                                            title="bitcoin market"
                                                                            src="{{asset('/images')}}/market_btc_banner.svg">
                                        </div>
                                    </div>
                                </div>
                                <div class="MuiBox-root jss20 sc-dkPtyc gnliEL eth-market market-item">
                                    <div class="MuiBox-root jss21 sc-dkPtyc gnliEL card-container">
                                        <div class="blur-card"></div>
                                        <div class="lazyload-wrapper "><img class="market-coin"
                                                                            alt="ethereum market"
                                                                            title="ethereum market"
                                                                            src="{{asset('/images')}}/market_eth_banner.svg">
                                        </div>
                                    </div>
                                </div>
                                <div class="MuiBox-root jss22 sc-dkPtyc gnliEL bca-market market-item">
                                    <div class="MuiBox-root jss23 sc-dkPtyc gnliEL card-container">
                                        <div class="blur-card"></div>
                                        <div class="lazyload-wrapper ">
                                            <img class="market-coin" alt="bitcoin atom market" title="bitcoin atom market" src="{{asset('/images')}}/market_bca_banner.svg">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @include('core.pages._livePrice')
    @endif
    <div class="cmb-content-wrapper" data-name="Main Wrapper" id="cmb-content-wrapper">
        {{ view_html(short_code(dynamic_language($visualPage->body,$fallbackLang,$currentLang))) }}
    </div>
    @if(!empty($recentPosts))
        <div class="blog section-padding" data-scroll-index="5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-6">
                        <div class="section-title text-center">
                            <h2>{{__('Blog')}}</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    @foreach($recentPosts as $recentPost)
                        <div class="col-xl-4 col-lg-4 col-md-12">
                            <div class="blog-grid">
                                <div class="card">
                                    <img class="img-fluid"
                                         src="{{ get_featured_image($recentPost->featured_image) }}"
                                         alt="{{ $recentPost->title }}"/>
                                    <div class="card-body">
                                        <a href="{{ route('blog.show', ['slug' => $recentPost->slug]) }}">
                                            <h4 class="card-title">
                                                {{ $recentPost->title }}
                                            </h4>
                                        </a>
                                        <p class="card-text">
                                            @php $desc = strip_tags($recentPost->content); @endphp
                                            {{ Str::limit($desc, 110) }}
                                        </p>
                                    </div>
                                    <div class="card-footer">
                                        <div class="meta-info">
                                            <a href="javascript:void(0)" class="author">
                                                <i class="fa fa-comment-o"></i> {{ __(':count comments', ['count' => $recentPost->comments_count]) }}
                                            </a>
                                            <a href="javascript:void(0)" class="post-date">
                                                <i class="fa fa-calendar-o"></i> {{ $recentPost->created_at->diffForHumans() }}
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    @endif
@endsection

@section('style')
    <link data-link="cmb-style.css" href="{{ asset('plugins/cm-visual-editor/cmb-style.css') }}" id="cmb-default-style"
          rel="stylesheet">

    <link href="{{ asset('plugins/cm-visual-editor/vendor/grid/grid.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('plugins/cm-visual-editor/vendor/lightbox/lightbox.css') }}" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="{{ asset('plugins/cm-visual-editor/vendor/animate/animate.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/cm-visual-editor/vendor/animate/cmb-animate.css') }}">

    <link href="{{ asset('plugins/cm-visual-editor/visual-editor-element-style.css') }}" rel="stylesheet">
    <link href="{{ asset('plugins/cm-visual-editor/vendor/fonts-awesome/css/font-awesome.min.css') }}" rel="stylesheet">
    <link href="{{ asset("storage/css/cm-visual-builder/style-{$visualPage->id}.css") }}" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('/plugins/owlCarousel/owl.carousel.min.css')}}"/>
    @include('core.pages._style')
@endsection

@section('script')
    <script src="{{ asset('plugins/cm-visual-editor/vendor/grid/grid.js') }}"></script>
    <script src="{{ asset('plugins/cm-visual-editor/slider.js') }}"></script>
    <script src="{{ asset('plugins/cm-visual-editor/vendor/lightbox/lightbox.js') }}"></script>
    <script src="{{ asset('plugins/cm-visual-editor/live-page.js') }}"></script>

    <script src="{{asset('/plugins/owlCarousel/owl.carousel.min.js')}}"></script>
    <script src="{{asset('/plugins/typing-text/theater.min.js')}}"></script>
    <script>
        $(document).ready(function () {
            var theater = theaterJS();
            theater.on('type:start, erase:start', function () {
                theater.getCurrentActor().$element.classList.add('actor__content--typing');
            }).on('type:end, erase:end', function () {
                theater.getCurrentActor().$element.classList.remove('actor__content--typing');
            });

            theater.addActor('dynamic_txt', {
                speed: 0.8,
                accuracy: 0.6
            }).addScene('dynamic_txt:{{__("Trusted")}}', 600).addScene('dynamic_txt:{{__("Secure")}}', 400).addScene('dynamic_txt:{{__("Fast")}}', 1600).addScene('dynamic_txt:{{__("Reliable")}}', 1000).addScene(theater.replay.bind(theater));
        });
    </script>
    @include('core.pages._script')
@endsection
