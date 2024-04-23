<?php

namespace App\Http\Controllers\Page;

use App\Http\Controllers\Controller;
use App\Models\Core\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AdminVisualEditController extends Controller
{
    public function edit(Page $page)
    {
        try {
            $fallbackLang = Storage::disk('public')->get('page_language/' . $page->id . '/' . config('app.fallback_locale') . '.json');
            $data['fallbackLang'] = json_decode($fallbackLang, true);
            $data['currentLangText'] = $fallbackLang;

        } catch (\Exception $e) {
            Storage::disk('public')->put('page_language/' . $page->id . '/' . config('app.fallback_locale') . '.json', '{}');
            $data['fallbackLang'] = [];
            $data['currentLangText'] = '{}';
        }
        $data['visualPage'] = $page;
        return view('core.pages.admin.visual-edit', $data);
    }

    public function update(Request $request, Page $page)
    {
        $request->validate([
            'style' => 'present',
            'body' => 'present',
        ]);
        $page->body = null;

        if (!$page->update()){
            return response()->json([RESPONSE_MESSAGE_KEY => __('Failed to reload save page.')], 400);
        }

        $page->update();
        Storage::disk('public')->put('css/cm-visual-builder/style-' . $page->id . '.css', '');
        Storage::disk('public')
            ->put('page_language/' . $page->id . '/' . config('app.fallback_locale') . '.json', '');


        $page->body = $request->get('body');
        $currentLangData = !empty($request->get('currentLangData')) && $request->get('currentLangData') != '[]' ? $request->get('currentLangData') : '{}';
        if ($page->update()) {
            Storage::disk('public')->put('css/cm-visual-builder/style-' . $page->id . '.css', $request->get('style', ''));
            Storage::disk('public')
                ->put('page_language/' . $page->id . '/' . config('app.fallback_locale') . '.json', $currentLangData);
            return response()->json([RESPONSE_MESSAGE_KEY => __('Page has been saved successfully.')]);
        }
        return response()->json([RESPONSE_MESSAGE_KEY => __('Failed to save page.')], 400);
    }

    public function editOtherLang(Page $page, $editableLang)
    {

        try {
            $fallbackLang = Storage::disk('public')->get('page_language/' . $page->id . '/' . config('app.fallback_locale') . '.json');
            $fallbackLang = json_decode($fallbackLang, true);
        } catch (\Exception $e) {
            abort('404', 'You do not have default fallback language data');
        }

        try {
            $currentLang = Storage::disk('public')->get('page_language/' . $page->id . '/' . $editableLang . '.json');
            $currentLang = json_decode($currentLang, true);
        } catch (\Exception $e) {
            $currentLang = [];
        }
        $data['outputLang'] = dynamic_language($page->body, $fallbackLang, $currentLang, true);
        $data['editableLang'] = $editableLang;
        $data['page'] = $page;
        return view('core.pages.admin.visual-lang-edit', $data);
    }

    public function updateOtherLang(Request $request, Page $page, $editableLang)
    {
        $currentLangData = !empty($request->get('currentLangData')) && $request->get('currentLangData') != '[]' ? $request->get('currentLangData') : '{}';

        if (Storage::disk('public')
            ->put('page_language/' . $page->id . '/' . $editableLang . '.json', $currentLangData)
        ) {
            return response()->json([RESPONSE_MESSAGE_KEY => __('Language data has been saved successfully.')]);
        }
        return response()->json([RESPONSE_MESSAGE_KEY => __('Failed to save language.')], 400);
    }
}
