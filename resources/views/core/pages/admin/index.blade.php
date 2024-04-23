@extends('layouts.master')

@section('title', $title)
@section('route', $isRoute =true, $routeName = 'Add New Page', $route = 'admin.pages.create')
@section('content')
    <div class="container my-5">
        <div class="row">
            <div class="col-12">
                {{ $dataTable['filters'] }}
                <div class="my-4">
                    @component('components.table', ['class' => 'lf-data-table'])
                        @slot('thead')
                            <tr>
                                <th class="all">{{ __('Title') }}</th>
                                <th class="min-desktop">{{ __('Slug') }}</th>
                                <th class="min-desktop text-center">{{ __('Published Status') }}</th>
                                <th class="text-right no-sort">{{ __('Action') }}</th>
                            </tr>
                        @endslot
                        @foreach($dataTable['items'] as $page)
                            <tr>
                                <td>{{ \Illuminate\Support\Str::limit($page->title, 20) }}</td>
                                <td>
                                    {{ $page->slug }}
                                    @if($page->is_home_page)
                                        <i class="fa fa-home font-size-18 text-success ml-2"></i>
                                    @endif
                                </td>
                                <td class="text-center">
                                    @if($page->published_at)
                                        <span class="badge badge-success">{{ __('Published') }}</span>
                                    @else
                                        <span class="badge badge-danger">{{ __('Unpublished') }}</span>
                                    @endif
                                </td>
                                <td class="lf-action">
                                    <div class="lf-available-lang d-none">
                                        @php($availableLang=available_lang($page->id))
                                        <table class="table table-borderless table-striped">
                                            <thead>
                                            <tr class="bg-primary text-white font-weight-bold font-size-16">
                                                <td class="text-left">{{ __('Language Name') }}</td>
                                                <td class="text-center">{{ __('Is Translated') }}</td>
                                                <td class="text-right">{{ __('Build Lang') }}</td>
                                            </tr>
                                            </thead>
                                            <tbody class="font-size-14">
                                            @foreach(language() as $key=>$item)
                                                <tr>
                                                    <td class="text-left">{{$item['name']}}</td>
                                                    <td class="text-center">{{in_array($key,$availableLang)?'YES':'NO'}}</td>
                                                    <td class="text-right">
                                                        <a class="btn btn-info {{ in_array(config('app.fallback_locale'),$availableLang)?'':'disabled' }}"
                                                           href="{{ in_array(config('app.fallback_locale'),$availableLang)?route('admin.pages.visual-lang-edit',[$page->id,$key]):'javascript:;' }}">
                                                            <i class="fa fa-edit"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            @endforeach
                                            @if(!in_array(config('app.fallback_locale'),$availableLang))
                                                <tr>
                                                    <td colspan="3" class="text-center">
                                                        <div class="alert alert-warning">
                                                            {{__("You don't have any fallback language right now. Go to 'Build Page' to save the fallback language")}}
                                                            @if( has_permission('admin.pages.visual-edit'))
                                                                <div class="mt-3">
                                                                    <a class="btn btn-info"
                                                                       data-form-id="up-{{$page->id}}" data-form-method="put"
                                                                       href="{{ route('admin.pages.visual-edit',  $page->id) }}">
                                                                        <i class="fa fa-pencil-square"></i> {{ __('Build Page') }}
                                                                    </a>
                                                                </div>
                                                            @endif
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endif
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="btn-group">
                                        <button class="btn btn-info dropdown-toggle"
                                                data-toggle="dropdown">
                                            <i class="fa fa-gear"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            @if( has_permission('admin.pages.visual-edit'))
                                                <a class="dropdown-item"
                                                   data-form-id="up-{{$page->id}}" data-form-method="put"
                                                   href="{{ route('admin.pages.visual-edit',  $page->id) }}">
                                                    <i class="fa fa-pencil-square"></i> {{ __('Build Page') }}
                                                </a>
                                            @endif
                                            <a href="javascript:;" class="dropdown-item lf-open-modal-btn">
                                                <i class="fa fa-language"></i> {{ __('Translate Page') }}
                                            </a>
                                            @if( has_permission('admin.pages.edit'))
                                                <a class="dropdown-item"
                                                   data-form-id="up-{{$page->id}}" data-form-method="put"
                                                   href="{{ route('admin.pages.edit',  $page->id) }}">
                                                    <i class="fa fa-edit"></i> {{ __('Edit') }}
                                                </a>
                                            @endif

                                            @if( has_permission('admin.pages.published'))
                                                @if($page->published_at)
                                                    <a class="dropdown-item confirmation"
                                                       data-form-id="up-{{$page->id}}" data-form-method="put"
                                                       data-alert="{{ __('Are you sure?') }}"
                                                       href="{{ route('admin.pages.published',  $page->id) }}">
                                                        <i class="fa fa-toggle-on"></i> {{ __('Unpublished') }}
                                                    </a>
                                                @else
                                                    <a class="dropdown-item confirmation"
                                                       data-form-id="up-{{$page->id}}" data-form-method="put"
                                                       data-alert="{{ __('Are you sure?') }}"
                                                       href="{{ route('admin.pages.published',  $page->id) }}">
                                                        <i class="fa fa-toggle-off"></i> {{ __('Published') }}
                                                    </a>
                                                @endif
                                            @endif
                                            @if( has_permission('admin.pages.home-page') && !$page->is_home_page)
                                                <a class="dropdown-item confirmation"
                                                   data-form-method="put"
                                                   data-alert="{{ __('Are you sure?') }}"
                                                   data-form-id="de-{{$page->id}}"
                                                   href="{{ route('admin.pages.home-page', $page->id) }}">
                                                    <i class="fa fa-home"></i> {{ __('Make Home Page') }}
                                                </a>
                                            @endif

                                            @if( has_permission('admin.pages.destroy'))
                                                <a class="dropdown-item confirmation"
                                                   data-form-method="delete"
                                                   data-alert="{{ __('Are you sure?') }}"
                                                   data-form-id="de-{{$page->id}}"
                                                   href="{{ route('admin.pages.destroy', $page->id) }}">
                                                    <i class="fa fa-trash-o"></i> {{ __('Delete') }}
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
    <div class="lang-confirmation-modal fixed-top w-100 h-100 d-none">
        <div class="centralize-wrapper">
            <div class="centralize-inner">
                <div class="centralize-content bg-white text-center">
                    <div class="lf-lang-modal-header d-flex border-bottom mb-3 pb-3 align-items-center">
                        <div>
                            <h3 class="font-weight-bold my-0">{{ __('Language List') }}</h3>
                        </div>
                        <div class="ml-auto">
                            <a href="javascript:;" class="btn btn-sm btn-danger" id="lf-close-modal-btn"><i
                                    class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="lf-lang-modal-style">
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('style')
    @include('layouts.includes.list-css')
    <style>
        .lang-confirmation-modal .centralize-wrapper .centralize-inner .centralize-content {
            max-width: 1000px;
        }
    </style>
@endsection

@section('script')
    @include('layouts.includes.list-js')
    <script>
        'use strict';
        $('#lf-close-modal-btn').on('click', function () {
            $('.lang-confirmation-modal').addClass('d-none')
        })
        $('.lf-open-modal-btn').on('click', function () {
            let langTable = $(this).closest('tr').find('.lf-available-lang').html();
            $('.lang-confirmation-modal').removeClass('d-none')
            $('.lang-confirmation-modal').find('.lf-lang-modal-style').html(langTable)
        })
    </script>
@endsection
