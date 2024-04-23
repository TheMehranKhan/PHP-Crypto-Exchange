@extends('layouts.master', ['hideBreadcrumb' => true, 'cmbPage' => '','activeSideNav'=>active_side_nav()])

@section('title', __('Stake'))

@section('content')
    @include('stake.user._form')
@endsection

@section('style')
    @include('stake.user._style')
@endsection

@section('script')
    @include('stake.user._script')
    <script src="{{asset('plugins/bcmath/bcmath.js')}}"></script>
    <script src="{{asset('plugins/bcmath/libbcmath-min.js')}}"></script>
@endsection