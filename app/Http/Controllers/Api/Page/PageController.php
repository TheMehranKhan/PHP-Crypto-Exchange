<?php

namespace App\Http\Controllers\Api\Page;

use App\Http\Controllers\Controller;
use App\Models\Core\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Storage;


class PageController extends Controller
{
    public function page(Page $page,Request $request)
    {
        if (empty($page)){
            return response()->json([
                RESPONSE_STATUS_KEY => false,
                RESPONSE_MESSAGE_KEY => __("404 Not Found"),
                RESPONSE_DATA => []
            ]);
        }
        try {
            $currentLang = Storage::disk('public')->get('page_language/'.$page->id.'/'. $request->lang .'.json');
            $content = json_decode($currentLang, true);
        }
        catch (\Exception $e){
            $content = [];
        }
        $data['slug'] = $page->slug;
        $data['title'] = __($page->title);
        $data['body'] = implode("<br/>",$content);
        return response()->json([
            RESPONSE_STATUS_KEY => true,
            RESPONSE_DATA => $data
        ]);
    }

}
