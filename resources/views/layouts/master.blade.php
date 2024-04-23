@include('layouts.includes.header')
<div class="wrapper{{((!isset($activeSideNav) && in_array(settings('navigation_type'), [1,2])) || (isset($activeSideNav) && $activeSideNav)) ? (isset($fixedSideNav) ? ($fixedSideNav ? ' lf-fixed-sidenav' : '') : (settings('navigation_type') && settings('side_nav_fixed') ? ' lf-fixed-sidenav-wrapper' : '')) : ''}}">
    @if(settings('preloader') == ACTIVE)
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    @endif
    @if(isset($headerLess) && $headerLess)
        <div class="centralize-wrapper">
            <div class="centralize-inner">
                <div class="centralize-content lf-no-header-wrapper">
                    @yield('content')
                </div>
            </div>
        </div>
    @else
        <div id="main-wrapper" class="h-100">
            @include('layouts.dashboard.header')
            @if(isset($topLess) && $topLess)
                @include('layouts.dashboard.sidebar')
            @endif

            @includeWhen((!isset($hideBreadcrumb) || !$hideBreadcrumb), 'layouts.includes.breadcrumb')
            <div id="app">
                <div class="lf-toggle-bg-content{{ isset($visualPage) ? '' : ' py-3' }}">
                    @yield('content')
                </div>

                @yield('extended-content')
            </div>
        </div>
</div>

@if(settings('home_page_popup') == ACTIVE && !session()->has('modal'))
<div id="showADS" class="modal fade pt-5" tabindex="-1" role="dialog" aria-labelledby="showADSModal"
     aria-hidden="true">
    <!-- Modal -->
    <div class="modal-dialog">
        <div class="modal-content lf-toggle-bg-card">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel"></h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"><i class="fa fa-close"></i> </button>
            </div>
            <div class="modal-body">
                <a href="{{route('home')}}"><img
                            src="{{ asset('storage/images/'.settings('home_page_popup_img')) }}"
                            alt="{{ config('app.name') }}"/></a>
            </div>
{{--            <div class="modal-footer">--}}
{{--                <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">Understood</button>--}}
{{--            </div>--}}
        </div>
    </div>
</div>
{{ session()->put('modal','shown') }}
@endif

@if(isset($topLess) && $topLess)
    @include('layouts.dashboard.footer')
@else
    @include('layouts.includes.footer')
@endif

@endif
@include('layouts.includes.script')
