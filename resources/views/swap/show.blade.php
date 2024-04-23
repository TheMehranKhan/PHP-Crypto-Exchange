@extends('layouts.master', ['hideBreadcrumb' => true, 'cmbPage' => '','activeSideNav'=>active_side_nav()])

@section('title', __('Swap'))

@section('content')
    @include('swap._form')
@endsection

@section('style')
    @include('swap._style')
@endsection

@section('script')
    @include('swap._script')
    <script src="{{asset('plugins/bcmath/bcmath.js')}}"></script>
    <script src="{{asset('plugins/bcmath/libbcmath-min.js')}}"></script>
@endsection
