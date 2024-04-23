@extends('layouts.master',['hideBreadcrumb'=> true, 'hideNotice'=> true, 'fixedSideNav'=>false, 'activeSideNav'=>active_side_nav()])
@section('content')
    @include('regular_pages._banner')
    @include('regular_pages._livePrice')
    @include('regular_pages._feature')
    @include('regular_pages._testimonial')
    @include('regular_pages._investment')
    @include('regular_pages._bitcoin')
    @include('regular_pages._team')
    @include('regular_pages._news')
@endsection
@section('script')
    <script src="{{asset('/plugins/owlCarousel/owl.carousel.min.js')}}"></script>
    <script>
        $(document).ready(function(){
            $(".owl-carousel").owlCarousel({
                loop:false,
                margin:10,
                nav:true,
                responsive:{
                    0:{
                        items:1
                    },
                    600:{
                        items:3
                    },
                    1000:{
                        items:6
                    }
                }
            });
        });
    </script>
    @include('regular_pages._script')

@endsection
@section('style')
    <link rel="stylesheet" href="{{asset('/plugins/owlCarousel/owl.carousel.min.css')}}" />
    @include('regular_pages._style')
@endsection
