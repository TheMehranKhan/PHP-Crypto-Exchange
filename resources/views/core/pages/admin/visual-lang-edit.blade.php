@extends('layouts.master', ['hideBreadcrumb' => $page->settings['hide_breadcrumb'], 'cmbPage' => $page, 'directionMode'=>language($editableLang)['direction']])

@section('content')
    <div class="cmb-content-wrapper" data-name="Main Wrapper" id="cmb-content-wrapper">
        {{ view_html(short_code($outputLang['text'])) }}
    </div>

    <div id="cmb-admin-controller">
        <a class="" href="javascript:" id="cmb-admin-controller-save">{{ __('Save Page') }}<i class="fa fa-save float-right ml-1"></i></a>
    </div>
    <div class="d-none" id="cmb-admin-wrapper" style="">

        <div id="cmb-text-edit-option-box" style="display: none;">
            <a class="cmb-setting-icon" href="javascript:" id="cmb-text-option-edit"><i class="fa fa-pencil"></i></a>
{{--            <a class="cmb-setting-icon" href="javascript:" id="cmb-text-option-save"><i class="fa fa-save"></i></a>--}}
        </div>
    </div>
    <div class="d-none" id="cmb-temporary-html-wrapper">
    </div>
    <div class="d-none" id="cmb-loading-queue">
        <div></div>
    </div>
    <div id="cmb-status-popup">
    </div>
    <div id="cmb-tinymce-popup" class="d-none">
        <div class="container">
            <div class="row">
                <div class="col-12 pt-5">
                    <textarea id="cmb-tinymce" cols="30" ></textarea>
                </div>
                <div class="col-12 text-right">
                    <div class="bg-white p-3 mt-3">
                        <a class="btn btn-sm btn-primary" href="javascript:" id="cmb-text-option-save"><i class="fa fa-save"></i> {{__('Save Text')}}</a>
                        <a class="btn btn-sm btn-warning cmb-editor-close-modal" href="javascript:"><i class="fa fa-close"></i> {{__('Cancel')}}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('style')
    <link data-link="cmb-style.css" href="{{ asset('plugins/cm-visual-editor/cmb-style.css') }}" id="cmb-default-style" rel="stylesheet">



    <link href="{{ asset('plugins/cm-visual-editor/vendor/tinymce/skins/lightgray/skin.min.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('plugins/cm-visual-editor/vendor/tinymce/skins/lightgray/content.min.css') }}" rel="stylesheet" type="text/css">


    <link href="{{ asset('plugins/cm-visual-editor/vendor/grid/grid.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ asset('plugins/cm-visual-editor/vendor/lightbox/lightbox.css') }}" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="{{ asset('plugins/cm-visual-editor/vendor/animate/animate.css') }}">
    <link rel="stylesheet" href="{{ asset('plugins/cm-visual-editor/vendor/animate/cmb-animate.css') }}">

    <link href="{{ asset('plugins/cm-visual-editor/visual-editor-element-style.css') }}" rel="stylesheet">
    <link href="{{ asset('plugins/cm-visual-editor/visual-editor-style.css') }}" rel="stylesheet">
    <style class="cmb-dynamic-css-library" type="text/css"></style>
    <link href="{{ asset('plugins/cm-visual-editor/vendor/fonts-awesome/css/font-awesome.min.css') }}" rel="stylesheet">
    <link href="{{ asset('plugins/cm-visual-editor/vendor/cmfonts/cmfonts.css') }}" rel="stylesheet">
@endsection

@section('script')
    <script>
        let pageId = '{{ $page->id }}';
        let pageCssPath = '{{ asset("storage/css/cm-visual-builder/style-{$page->id}.css") }}';
        let savePageUrl = '{{ route('admin.pages.visual-lang-update', [$page->id,$editableLang]) }}';
        let dynamicContentUrl = '{{ route('admin.dynamic-content') }}';
        let currentLangData = {{view_html(json_encode($outputLang['objectData']))}};
        let onlyLanguage = true;
    </script>
    <script src="{{ asset('plugins/cm-visual-editor/visual-editor/visual-editor-initialization.js') }}"></script>

    <script src="{{ asset('plugins/cm-visual-editor/vendor/tinymce/tinymce.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('plugins/cm-visual-editor/vendor/tinymce/themes/modern/theme.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('plugins/cm-visual-editor/vendor/tinymce/plugins/code/plugin.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('plugins/cm-visual-editor/vendor/tinymce/plugins/colorpicker/plugin.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('plugins/cm-visual-editor/vendor/tinymce/plugins/hr/plugin.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('plugins/cm-visual-editor/vendor/tinymce/plugins/image/plugin.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('plugins/cm-visual-editor/vendor/tinymce/plugins/link/plugin.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('plugins/cm-visual-editor/vendor/tinymce/plugins/lists/plugin.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('plugins/cm-visual-editor/vendor/tinymce/plugins/paste/plugin.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('plugins/cm-visual-editor/vendor/tinymce/plugins/table/plugin.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('plugins/cm-visual-editor/vendor/tinymce/plugins/textcolor/plugin.min.js') }}" type="text/javascript"></script>

    <script>
        'use strict';
        $(document).ready(function () {
            tinymce.init({
                selector: '#cmb-tinymce',
                height : "400",
                menubar: false,
                paste_data_images : false,
                relative_urls : false,
                remove_script_host : true,
                plugins: 'link image code lists textcolor colorpicker table hr paste',
                toolbar: 'bold italic underline | link image | alignleft aligncenter alignright alignjustify | bullist numlist | strikethrough superscript subscript | fontsizeselect forecolor backcolor | table | code',
                fontsize_formats: "8px 10px 12px 14px 18px 24px 36px",
                mobile: {
                    menubar: false,
                    toolbar: 'bold italic link image alignleft aligncenter alignright code',
                }
            });
        })
    </script>


    <script src="{{ asset('plugins/cm-visual-editor/visual-editor/style-inputs.js') }}"></script>
    <script src="{{ asset('plugins/cm-visual-editor/visual-editor/visual-editor-primary-elements.js') }}"></script>
    <script src="{{ asset('plugins/cm-visual-editor/element-library/element.js') }}"></script>
    <script src="{{ asset('plugins/cm-visual-editor/visual-editor/visual-editor-general-settings.js') }}"></script>
    <script src="{{ asset('plugins/cm-visual-editor/visual-editor/class-settings.js') }}"></script>
    <script src="{{ asset('plugins/cm-visual-editor/visual-editor/input-type.js') }}"></script>
    <script src="{{ asset('plugins/cm-visual-editor/visual-editor/visual-editor-functions.js') }}"></script>

    <script src="{{ asset('plugins/cm-visual-editor/visual-editor/visual-editor.js') }}"></script>
    <script src="{{ asset('plugins/cm-visual-editor/visual-editor/visual-editor-events.js') }}"></script>

    <script src="{{ asset('plugins/cm-visual-editor/vendor/grid/grid.js') }}"></script>
    <script src="{{ asset('plugins/cm-visual-editor/slider.js') }}"></script>
    <script src="{{ asset('plugins/cm-visual-editor/slider-builder.js') }}"></script>
    <script src="{{ asset('plugins/cm-visual-editor/vendor/lightbox/lightbox.js') }}"></script>

    <script type="text/javascript">
        'use strict';
        let cmPfolio = $('.cm-pfbox').cmPfolio();
        if ($('.cm-slider').length > 0) {
            cmSliderMethods.sliderRun($('.cm-slider'), true)
        }

        $('body').addClass('cmb-editing-activated');
        $('#cmb-default-style').removeAttr('href');
        cmbPreviewActivated = false;
        $.each(cmbAllElements, function (key, val) {
            if(val['onEdit']){
                val['onEdit']();
            }
        });
    </script>
@endsection
