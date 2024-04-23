</div>
@if(!isset($headerLess) || !$headerLess)
    @if((!isset($activeSideNav) && in_array(settings('navigation_type'), [1,2])) || (isset($activeSideNav) && $activeSideNav))
        @include('layouts.includes.side_nav')
    @endif
@endif
<!-- Flash Message -->
@include('errors.flash_message')
@include('layouts.includes.notice')

<!-- REQUIRED SCRIPTS -->
@yield('script-top')
<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.7.14/vue.min.js" integrity="sha512-BAMfk70VjqBkBIyo9UTRLl3TBJ3M0c6uyy2VMUrq370bWs7kchLNN9j1WiJQus9JAJVqcriIUX859JOm12LWtw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
@vite('resources/js/app.js')
{{--@vite('resources/js/language.js')--}}

{{--<script src="{{ asset('js/app.js') }}"></script>--}}
<script src="{{ asset('js/manifest.js') }}"></script>
<script src="{{ asset('js/vendor.js') }}"></script>
@if(!isset($headerLess) || !$headerLess)
    <script src="{{ asset('plugins/jQueryUI/jquery-ui.min.js') }}"></script>
    <script src="{{ asset('plugins/mcustomscrollbar/jquery.mCustomScrollbar.concat.min.js') }}"></script>
    <script src="{{ asset('plugins/slicknav/slicknav.min.js') }}"></script>
@endif
@if(isset($directionMode))
    @if($directionMode==PAGE_DIRECTION_RIGHT_TO_LEFT)
        <script src="{{ asset('plugins/bootstrap/bootstrap-rtl.min.js') }}"></script>
    @else
        <script src="{{ asset('plugins/bootstrap/bootstrap.min.js') }}"></script>
    @endif
@else
    @if(language(App()->getLocale())['direction']==PAGE_DIRECTION_RIGHT_TO_LEFT)
        <script src="{{ asset('plugins/bootstrap/bootstrap-rtl.min.js') }}"></script>
    @else
        <script src="{{ asset('plugins/bootstrap/bootstrap.min.js') }}"></script>
    @endif
@endif
@yield('extra-script')
<script src="{{ asset('plugins/flash_message/flash.message.js') }}"></script>
<script src="{{ asset('js/custom.js') }}"></script>

<script src="//code.jivosite.com/widget/Unh4UrVtv9" async></script>


@yield('script')

<script>
    $(window).on('load', function() {
        $('#showADS').modal('show');
    });
</script>

</body>
</html>
