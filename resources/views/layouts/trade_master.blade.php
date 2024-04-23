<!doctype html>
<html lang="en" dir="{{ isset($directionMode) ? $directionMode : language(App()->getLocale())['direction'] }}" class="{{isset($headerLess) && $headerLess && settings('no_header_layout') ? ' no-header-light' : ''}}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible"
          content="ie=edge">
    <meta name="csrf-token"
          content="{{ csrf_token() }}">
    <link rel="icon"
          href="{{ get_favicon() }}">
    @yield('meta')

{{--    <title>--}}
{{--        @hasSection('title')--}}
{{--            @yield('title', config('app.name')) | {{ config('app.name') }}--}}
{{--        @else--}}
{{--            {{ config('app.name') }}--}}
{{--        @endif--}}
{{--    </title>--}}

    @yield('style-top')
    <link rel="stylesheet" href="{{ asset('plugins/icofont/icofont.min.css') }}">
    <link rel="stylesheet" href="{{ asset('fonts/vendor/custom-icon/flaticon.css') }}">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
          rel="stylesheet">


    @if(isset($directionMode))
        @if($directionMode==PAGE_DIRECTION_RIGHT_TO_LEFT)
            <link rel="stylesheet" href="{{ asset('plugins/bootstrap/bootstrap-rtl.min.css') }}">
        @else
            <link rel="stylesheet" href="{{ asset('plugins/bootstrap/bootstrap.min.css') }}">
        @endif
    @else
        @if(language(App()->getLocale())['direction']==PAGE_DIRECTION_RIGHT_TO_LEFT)
            <link rel="stylesheet" href="{{ asset('plugins/bootstrap/bootstrap-rtl.min.css') }}">
        @else
            <link rel="stylesheet" href="{{ asset('plugins/bootstrap/bootstrap.min.css') }}">
        @endif
    @endif

<!-- PrimeVue -->
    <link href="https://unpkg.com/primevue@3.29.2/resources/themes/arya-orange/theme.css" rel="stylesheet"/>
    <link href="https://unpkg.com/primevue@3.29.2/resources/primevue.min.css" rel="stylesheet"/>
    <link href="https://unpkg.com/primeflex@^3/primeflex.css" rel="stylesheet"/>
    <link href="https://unpkg.com/primeicons/primeicons.css" rel="stylesheet"/>


    <!-- Dependencies -->
    <script src="https://unpkg.com/vue@3.4.8/dist/vue.global.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/primevue@3.29.2/core/core.min.js"></script>

{{--    <link rel="stylesheet" href="{{ asset('css/websocket/bootstrap.min.css') }}"--}}
{{--          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">--}}
    <link rel="stylesheet" href="{{ asset('css/websocket/styles.css') }}">
    <link rel="stylesheet" href="{{ asset('css/websocket/customPrime.css') }}">
    <link rel="stylesheet" href="{{ asset('css/websocket/components.css') }}">
    <script type="text/javascript" src="{{ asset('js/websocket/tv.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/websocket/reconnect.js') }}"></script>

    <!-- prime components -->
    <script src="https://unpkg.com/primevue@3.29.2/overlaypanel/overlaypanel.min.js"></script>
    <script src="https://unpkg.com/primevue@3.29.2/skeleton/skeleton.min.js"></script>
    <script src="https://unpkg.com/primevue@3.29.2/checkbox/checkbox.min.js"></script>
    <script src="https://unpkg.com/primevue@3.29.2/datatable/datatable.min.js"></script>
    <script src="https://unpkg.com/primevue@3.29.2/column/column.min.js"></script>
    <script src="https://unpkg.com/primevue@3.29.2/progressspinner/progressspinner.min.js"></script>
    <script src="https://unpkg.com/primevue@3.29.2/sidebar/sidebar.min.js"></script>
    <script src="https://unpkg.com/primevue@3.29.2/accordion/accordion.min.js"></script>
    <script src="https://unpkg.com/primevue@3.29.2/selectbutton/selectbutton.min.js"></script>
    <script src="https://unpkg.com/primevue@3.29.2/accordiontab/accordiontab.min.js"></script>

    <script src="https://unpkg.com/primevue@3.29.2/toast/toast.min.js"></script>
    <script src="https://unpkg.com/primevue@3.29.2/toastservice/toastservice.min.js"></script>

    <!-- deph Chart -->
    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/locales/de_DE.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/geodata/germanyLow.js"></script>
    <script src="https://cdn.amcharts.com/lib/5/fonts/notosans-sc.js"></script>
    <style>
        .lf-side-nav .lf-side-nav-wrapper {
            padding-top: 90px;
            left: 0;
            top: 0;
            height: 100%;
            position: absolute;
            width: 100%;
            background: #343c49;
            z-index: 1;
        }

        .lf-side-nav .lf-side-nav-wrapper nav ul li a {
            display: block;
            color: #fff;
            padding: 10px 20px 10px 10px;
            position: relative;
            font-size: 12px;
        }
        .glyphicon {
            margin-right: 10px;
        }

        .panel-body {
            padding: 0px;
        }

        .panel-body table tr td {
            padding-left: 15px
        }

        .panel-body .table {
            margin-bottom: 0px;
        }
        .p-datatable-table.p-datatable-scrollable-table {
            height: auto !important;
        }

    </style>

    <!-- slider -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vue-slider-component@latest/theme/default.css">
    <script src="{{ asset('js/websocket/vue-slider.js') }}"></script>

    {{-- light-weightCharts --}}
    <script src="https://unpkg.com/lightweight-charts/dist/lightweight-charts.standalone.production.js"></script>

    @vite('resources/sass/app.scss')
    <link rel="stylesheet" href="{{ asset('css/new.css') }}">
    <link rel="stylesheet" href="{{ asset('css/new-dark.css') }}">

    @yield('style')
</head>
<body
        class="{{((!isset($activeSideNav) && in_array(settings('navigation_type'), [1,2])) || (isset($activeSideNav) && $activeSideNav)) ? (isset($fixedSideNav) ? ($fixedSideNav ? 'lf-fixed-sidenav' : '') : (settings('navigation_type') && settings('side_nav_fixed') ? 'lf-fixed-sidenav' : '')) : ''}}{{isset($headerLess) && $headerLess ? ' lf-headerless-body' : ''}} {{ is_light_mode('light', 'dark') }}"
>
@include('layouts.dashboard.trade-header')
{{--<div id="preloader">--}}
{{--    <div class="sk-three-bounce">--}}
{{--        <div class="sk-child sk-bounce1"></div>--}}
{{--        <div class="sk-child sk-bounce2"></div>--}}
{{--        <div class="sk-child sk-bounce3"></div>--}}
{{--    </div>--}}
{{--</div>--}}
<div id="main-wrapper" class="{{ $h100 === 'true' ? 'h-100' : 'nomainclass' }} show">
    @yield('content')
</div>

@include('layouts.includes.trade-script')