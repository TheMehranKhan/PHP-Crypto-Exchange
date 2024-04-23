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
    <meta name="baidu-site-verification" content="code-yh1h4hnzNf" />

    <link rel="icon"
          href="{{ get_favicon() }}">

    <!-- Facebook Meta Tags -->
    <meta property="og:url" content="https://trademen.codemen.me">
    <meta property="og:type" content="website">
    <meta property="og:title" content="اسکریپت صرافی فول نود تریدمن | Trademen Cryptocurrency Exchange">
    <meta property="og:description" content="اسکریپت خرید و فروش ارز دیجیتال | اسکریپت صرافی ارز دیجیتال Trademen | اسکریپت صرافی رمز ارز تریدمن | اسکرپت آماده صرافی ارز دیجیتال">
    <meta property="og:image" content="https://trademen.codemen.me/images/banner-trademen.png">
    <meta property="og:image" content="https://files.codegrape.com/213111.jpg">

    <!-- Twitter Meta Tags -->
    <meta name="twitter:card" content="summary_large_image">
    <meta property="twitter:url" content="https://trademen.codemen.me">
    <meta name="twitter:title" content="اسکریپت صرافی فول نود تریدمن | Trademen Cryptocurrency Exchange">
    <meta name="twitter:description" content="اسکریپت خرید و فروش ارز دیجیتال | اسکریپت صرافی ارز دیجیتال Trademen | اسکریپت صرافی رمز ارز تریدمن | اسکرپت آماده صرافی ارز دیجیتال">
    <meta name="twitter:image" content="https://trademen.codemen.me/images/banner-trademen.png">
    <meta name="twitter:image" content="https://files.codegrape.com/213111.jpg">

    <!-- Meta Tags Generated via https://iplocation.io -->
    @yield('meta')

    <title>
        @hasSection('title')
            @yield('title', config('app.name')) | {{ config('app.name') }}
        @else
            {{ config('app.name') }}
        @endif
    </title>

    @yield('style-top')
    <link rel="stylesheet" href="https://trademen.codemen.me/vendor/codemenco/laravel-notify/css/notify.css">
    <link rel="stylesheet" href="{{ asset('plugins/icofont/icofont.min.css') }}">
    <link rel="stylesheet" href="{{ asset('fonts/vendor/custom-icon/flaticon.css') }}">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
          rel="stylesheet">
    @if(!isset($headerLess) || !$headerLess)
        <link rel="stylesheet"
              href="{{ asset('plugins/slicknav/slicknav.min.css') }}">
        <link rel="stylesheet"
              href="{{ asset('plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.css') }}">
    @endif

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
    @vite('resources/sass/app.scss')

{{--    <link rel="stylesheet" href="{{ asset('css/app.css') }}">--}}
    <link rel="stylesheet" href="{{ asset('css/new.css') }}">
    <link rel="stylesheet" href="{{ asset('css/new-dark.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css"/>

    @yield('style')
</head>
<body
    class="{{((!isset($activeSideNav) && in_array(settings('navigation_type'), [1,2])) || (isset($activeSideNav) && $activeSideNav)) ? (isset($fixedSideNav) ? ($fixedSideNav ? 'lf-fixed-sidenav' : '') : (settings('navigation_type') && settings('side_nav_fixed') ? 'lf-fixed-sidenav' : '')) : ''}}{{isset($headerLess) && $headerLess ? ' lf-headerless-body' : ''}} {{ is_light_mode('light', 'dark') }}"
>
