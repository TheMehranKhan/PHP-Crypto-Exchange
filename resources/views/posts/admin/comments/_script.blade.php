<script src="{{ asset('plugins/cvalidator/cvalidator-language-en.js') }}"></script>
<script src="{{ asset('plugins/cvalidator/cvalidator.js') }}"></script>
<script src="{{ asset('plugins/jasny-bootstrap/js/jasny-bootstrap.min.js') }}"></script>
<script src="{{ asset('plugins/tinymce/tinymce.min.js') }}"></script>
<script type="text/javascript">
    "use strict";

    $(document).ready(function () {
        let postForm = $('#postForm').cValidate({
            rules : {
                'title' : 'required|max:255',
                'slug' : 'required|max:255',
                'category_slug' : 'required',
                'is_featured' : 'required',
                'editor_content' : 'required',
                'featured_image' : 'image|max:2048',
                'is_published' : 'required',
                'created_at' : 'required',
            }
        });

        tinymce.init({
            selector: '#editor_content',
            menubar: false,
            plugins: 'preview powerpaste casechange searchreplace autolink autosave save directionality advcode visualblocks visualchars fullscreen image link media mediaembed template codesample advtable table charmap pagebreak nonbreaking anchor advlist lists checklist wordcount tinymcespellchecker a11ychecker help formatpainter permanentpen pageembed linkchecker emoticons export',
            toolbar: 'undo redo | blocks | bold italic | ltr rtl | alignleft aligncenter alignright alignjustify | outdent indent | forecolor backcolor | link image |code',
            directionality: "{{ language(App()->getLocale())['direction'] }}",
            relative_urls: false,
            setup: function(editor) {
                editor.on('change keyup focus', function(e) {
                    $('#content').val(editor.getContent());
                    postForm.reFormat('content');
                });
            }
        });

        $('.fileinput').on('clear.bs.fileinput', function() {
            postForm.reFormat('featured_image');
        });

        $('.datepicker').datepicker({
            dateFormat: 'yy-mm-dd'
        });
    });
</script>
