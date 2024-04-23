<?php

namespace App\Http\Controllers\Post;

use App\Http\Controllers\Controller;
use App\Http\Requests\Post\CommentRequest;
use App\Models\Post\Post;
use App\Models\Post\PostComment;
use App\Services\Core\DataTableService;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class PostCommentController extends Controller
{
    public function index(): View
    {
        $searchFields = [
            ['content', __('Content')],
            ['post_comment_id', __('Reply')],
        ];

        $orderFields = [
            ['created_at', __('Registered Date')],
            ['is_published', __('Status')],
        ];
        $data['title'] = __('Comments');

        $queryBuilder = PostComment::orderBy('created_at', 'desc');

        $data['dataTable'] = app(DataTableService::class)
            ->setSearchFields($searchFields)
            ->setOrderFields($orderFields)
            ->create($queryBuilder);

        return view('posts.admin.comments.index', $data);
    }

    public function show(PostComment $comment): View
    {
        $data['title'] = __('Post Show');
        $data['comment'] = $comment;
        return view('posts.admin.comments.show', $data);
    }

    public function edit(PostComment $comment): View
    {
        $data['title'] = __('Comment Edit');
        $data['comment'] = $comment;
        return view('posts.admin.comments.edit', $data);
    }

    public function update(commentRequest $request, PostComment $comment): RedirectResponse
    {
        $attributes = $request->only('content');
        $attributes['post_id'] = $comment->id;
        $attributes['user_id'] = Auth::id();
        $attributes['is_published'] = $request->get('is_published');

        if ($comment->update($attributes)){
            return redirect()->back()->with(RESPONSE_TYPE_SUCCESS, __('Successfully comment updated!'));
        }
        return redirect()->back()->withInput()->with(RESPONSE_TYPE_SUCCESS, __('Failed to add comment!'));
    }

    public function store(CommentRequest $request, Post $post): RedirectResponse
    {
        $attributes = $request->only('content');
        $attributes['post_id'] = $post->id;
        $attributes['user_id'] = Auth::id();

        if (PostComment::create($attributes)){
            return redirect()->back()->with(RESPONSE_TYPE_SUCCESS, __('Successfully comment added!'));
        }
        return redirect()->back()->withInput()->with(RESPONSE_TYPE_SUCCESS, __('Failed to add comment!'));
    }

    public function destroy(Post $post): RedirectResponse
    {
        if ($post->delete()) {
            return redirect()->back()->with(RESPONSE_TYPE_SUCCESS, __("The post has been deleted successfully."));
        }
        return redirect()->back()->with(RESPONSE_TYPE_ERROR, __("Failed to delete the post."));
    }
}
