@extends('layouts.master',['landing'=>'false','h100'=>'false']) 
@section("content")
    @component('components.dashboard.header')
    @component('components.dashboard.sidebar')
    @component('components.dashboard.title', ['title' => $title])
    @component('components.dashboard.footer')
@endsection
