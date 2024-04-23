@extends('layouts.master',['activeSideNav' => active_side_nav()])
@section('title', $title)
@section('content')
    <div class="container my-5">
        <div class="row">
            <div class="col-lg-12">
                {{ $dataTable['filters'] }}
                {{ $dataTable['advanceFilters'] }}
                <div class="my-4">
                    @component('components.table',['class'=> 'lf-data-table'])
                        @slot('thead')
                            <tr>
                                <th class="all">{{ __('Username') }}</th>
                                <th class="min-desktop">{{ __('Post') }}</th>
                                <th class="min-desktop">{{ __('Reply') }}</th>
                                <th class="min-desktop">{{ __('content') }}</th>
                                <th class="all">{{ __('Status') }}</th>
                                <th class="text-right all no-sort">{{ __('Action') }}</th>
                            </tr>
                        @endslot

                        @foreach($dataTable['items'] as $key=>$comment)
                            <tr>
                                <td>{{ !empty(get_profile_by_user_id($comment->user_id)) ? get_profile_by_user_id($comment->user_id)->first_name.' '.get_profile_by_user_id($comment->user_id)->last_name : '-'}}</td>
                                <td>{{ !empty(get_post_by_post_id($comment->post_id)) ? \Illuminate\Support\Str::limit(get_post_by_post_id($comment->post_id)->title) : '-'}}</td>
                                <td>{{ !empty($comment->post_comment_id) ? __('Yes') : __('No')}}</td>
                                <td>{{ \Illuminate\Support\Str::limit($comment->content, 50) }}</td>
                                <td>
                                    <span class="font-size-12 py-1 px-2 badge badge-{{ config('commonconfig.active_status.' . $comment->is_published . '.color_class') }}">{{ publish_status($comment->is_published) }}
                                    </span>
                                </td>
                                <td class="lf-action text-right">
                                    <div class="btn-group">
                                        <button type="button"
                                                class="btn btn-sm btn-info dropdown-toggle"
                                                data-toggle="dropdown"
                                                aria-expanded="false">
                                            <i class="fa fa-gear"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right"
                                             role="menu">
                                            @if(has_permission('comments.show'))
                                                <a href="{{ route('comments.show', $comment->id) }}"
                                                   class="dropdown-item"><i class="fa fa-eye"></i> {{ __('Show') }}</a>
                                            @endif
                                            @if(has_permission('comments.edit'))
                                                <a href="{{ route('comments.edit', $comment->id) }}"
                                                   class="dropdown-item"><i class="fa fa-edit"></i> {{ __('Edit') }}</a>
                                            @endif
                                            @if(has_permission('comments.toggle-status'))
                                                <a href="{{ route('comments.toggle-status', $comment->id) }}"
                                                   class="dropdown-item confirmation"
                                                   data-form-id="put-{{ $comment->id }}"
                                                   data-form-method="put"
                                                   href="{{ route('comments.toggle-status', $comment->id) }}"
                                                   data-alert="{{$comment->is_published? __('Do you want to unpublished this post?'): __('Do you want to published this post?')}}">
                                                    @if($comment->is_published)
                                                        <i class="fa fa-refresh"></i>
                                                        {{ __('Unpublished') }}
                                                    @else
                                                        <i class="fa fa-check-square-o"></i>
                                                        {{ __('Publish') }}
                                                    @endif
                                                </a>
                                            @endif
                                            @if(has_permission('comments.destroy'))
                                                <a href="{{ route('comments.destroy', $comment->id) }}"
                                                   class="dropdown-item confirmation"
                                                   data-form-id="delete-{{ $comment->id }}"
                                                   data-form-method="delete"
                                                   href="{{ route('comments.destroy', $comment->id) }}"
                                                   data-alert="{{__('Do you want to remove this post?')}}"><i class="fa fa-trash"></i> {{ __('Destroy') }}
                                                </a>
                                            @endif
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    @endcomponent
                </div>
                {{ $dataTable['pagination'] }}
            </div>
        </div>
    </div>
@endsection

@section('style')
    @include('layouts.includes.list-css')
@endsection

@section('script')
    @include('layouts.includes.list-js')
@endsection
