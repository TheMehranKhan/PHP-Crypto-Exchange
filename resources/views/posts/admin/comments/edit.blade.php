@extends('layouts.master',['activeSideNav' => active_side_nav()])
@section('title', $title)
@section('content')
    <div class="container my-5">
        <div class="row">
            <div class="offset-md-1 col-md-10">
                @component('components.form_box')
                    @slot('title', __('Edit Comment'))
                    @slot('indexUrl', route('comments.index'))
                    {{ Form::model($comment, ['route'=>['comments.update', $comment], 'method' => 'put', 'class'=>'form-horizontal', 'enctype' => 'multipart/form-data', 'id' => 'commentForm']) }}
                    @include('posts.admin.comments._form')
                    {{ Form::close() }}
                @endcomponent
            </div>
        </div>
    </div>
@endsection

@section('style')
    @include('posts.admin.comments._style')
@endsection
@section('script')
    @include('posts.admin.comments._script')
@endsection
