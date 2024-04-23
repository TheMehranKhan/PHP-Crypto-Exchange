@extends('layouts.master',['activeSideNav' => active_side_nav()])
@section('title', $title)
@section('content')
    <div class="container my-5">
        <div class="row">
            <div class="offset-md-2 col-md-8">
                <div class="card lf-toggle-bg-card lf-toggle-border-color">
                    <div class="card-body">
                        <div class="lf-post-terms bg-info p-3 mb-4">
                            <span class="mr-3">
                                {{ __('Username') }} : {{ !empty(get_profile_by_user_id($comment->user_id)) ? get_profile_by_user_id($comment->user_id)->first_name.' '.get_profile_by_user_id($comment->user_id)->last_name : '-'}}
                            </span>
                            <span class="mr-3">
                            </span>
                            <span>
                                <i class="fa fa-calendar-o"></i> {{$comment->created_at}}
                            </span>
                        </div>
                        <div class="lf-post-content mb-5">
                            <h2 class="mb-4 lf-post-title">{{ !empty(get_post_by_post_id($comment->post_id)) ? \Illuminate\Support\Str::limit(get_post_by_post_id($comment->post_id)->title) : '-'}}</h2>
                            <div class="lf-post-description lf-post-content">
                                {{ view_html($comment->content) }}
                            </div>
                        </div>
                        <div class="my-4">
                            @if(has_permission('post.edit'))
                                <a href="{{ route('comments.edit', $comment) }}" class="btn lf-card-btn btn-info">{{ __('Edit Comment') }}</a>
                            @endif
                            @if(has_permission('post.index'))
                                <a href="{{ route('comments.index') }}" class="btn btn-danger lf-card-btn">{{ __('Comment Lists') }}</a>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('style')
    <style>
        .lf-post-title {
            font-size: 30px;
            font-weight: 400;
            line-height: 1.4;
        }
    </style>
@endsection
@section('script')
    @include('posts.admin.posts._script')
@endsection
