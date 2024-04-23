@extends('layouts.master', ['hideBreadcrumb' => true, 'cmbPage' => '','activeSideNav'=>active_side_nav()])

@section('title', __('Markets'))
@section('content')
    @include('core.markets._livePrice')
@endsection

@section('style')
    @include('core.pages._style')
@endsection

@section('script')
    @include('core.pages._script')
@endsection
