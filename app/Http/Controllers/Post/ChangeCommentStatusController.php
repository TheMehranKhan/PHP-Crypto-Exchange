<?php

namespace App\Http\Controllers\Post;

use App\Http\Controllers\Controller;
use App\Models\Post\PostComment;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class ChangeCommentStatusController extends Controller
{
    public function change(PostComment $comment): RedirectResponse
    {
        if ($comment->toggleStatus('is_published')) {
            return redirect()->back()->with(RESPONSE_TYPE_SUCCESS, __('Successfully comment status changed.'));
        }
        return redirect()->back()->with(RESPONSE_TYPE_ERROR, __('Failed to change status. Please try again.'));
    }
}
