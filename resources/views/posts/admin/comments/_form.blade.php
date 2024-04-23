{{--editor_content--}}
<div class="form-group mb-3">
    <label for="editor_content" class="control-label required">{{ __('Content') }}</label>
    {{ Form::textarea('content',  old('content', $comment->content ?? null), ['class'=> form_validation($errors, 'content'), 'id' => 'editor_content']) }}

    <span class="invalid-feedback" data-name="content">{{ $errors->first('content') }}</span>
</div>

<div class="form-group mb-3">
    <label for="created_at" class="control-label required">{{ __('Date Created') }}</label>
    {{ Form::text('created_at', null, ['class'=> form_validation($errors, 'created_at').' datepicker',
    'id' => 'created_at']) }}
    <span class="invalid-feedback" data-name="created_at">{{ $errors->first('created_at') }}</span>
</div>

{{--is_published--}}
<div class="form-group mb-3">
    <label for="is_published" class="control-label required">{{ __('Publish Status') }}</label>
    <div>
        <div class="lf-switch">
            {{ Form::radio('is_published', ACTIVE, true, ['id' => 'is_published-active', 'class' => 'lf-switch-input']) }}
            <label for="is_published-active" class="lf-switch-label">{{ __('Published') }}</label>
            {{ Form::radio('is_published', INACTIVE, false, ['id' => 'is_published-inactive', 'class' => 'lf-switch-input']) }}
            <label for="is_published-inactive" class="lf-switch-label">{{ __('Unpublished') }}</label>
        </div>
        <span class="invalid-feedback" data-name="is_published">{{ $errors->first('is_published') }}</span>
    </div>
</div>

{{--submit buttn--}}
<div class="form-group">
    {{ Form::submit(__('Save'),['class'=>'btn btn-info form-submission-button']) }}
    {{ Form::button('<i class="fa fa-undo"></i>',['class'=>'btn btn-danger', 'type' => 'reset']) }}
</div>
