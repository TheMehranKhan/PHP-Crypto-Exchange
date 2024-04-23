@extends('layouts.master',['activeSideNav' => active_side_nav()])
@section('title', $title)
@section('content')
<div class="container my-5">
    <div class="row">
        <div class="offset-md-3 col-md-6">
            @component('components.form_box')
                @slot('title', __('Edit Notice'))
                @slot('indexUrl', route('notices.index'))
                {{ Form::model($notice, ['route'=>['notices.update',  $notice->id], 'method' => 'post', 'class'=>'form-horizontal system-notice-form', 'id' => 'noticeForm']) }}
                @method('PUT')
                @include('core.notices._form',['buttonText'=> __('Update')])
                {{ Form::close() }}
            @endcomponent
        </div>
    </div>
</div>
@endsection

@section('style')
    <link rel="stylesheet" href="{{ asset('plugins/bs4-datetimepicker/css/bootstrap-datetimepicker.min.css') }}">
@endsection

@section('script')
    <script>
        "use strict";

        var noticesTypes = "{{array_to_string(notices_types())}}";
        var noticesVisibleTypes = "{{array_to_string(notices_visible_types())}}";
    </script>
    @include('core.notices._script')
@endsection
