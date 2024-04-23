<?php

namespace App\Http\Controllers;

use App\Models\Coin\Coin;
use App\Models\Coin\CoinPair;
use App\Models\Core\Page;
use App\Models\Post\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;

class HomeController extends Controller
{

    public function __invoke(Request $request): View
    {
        $homePage = Page::whereNotNull('published_at')->where('is_home_page', ACTIVE)->first();
        $tickers = $this->getTickers($request);
        if ($homePage) {
            try {
                $fallbackLang = Storage::disk('public')->get('page_language/' . $homePage->id . '/' . config('app.fallback_locale') . '.json');
                $data['fallbackLang'] = json_decode($fallbackLang, true);
            } catch (\Exception $e) {
                abort('404', 'You do not have default fallback language data');
            }
            try {
                $currentLang = Storage::disk('public')->get('page_language/' . $homePage->id . '/' . App::getLocale() . '.json');
                $data['currentLang'] = json_decode($currentLang, true);
            } catch (\Exception $e) {
                $data['currentLang'] = [];
            }
            $recentPosts = Post::where('is_published', ACTIVE)->orderBy('created_at', 'desc')->take(3)->get();
            $data['visualPage'] = $homePage;
            $data['tickers'] = $tickers;
            $data['recentPosts'] = $recentPosts;
//            return view('regular_pages.home', compact('tickers'));

            return view('core.pages.show', $data);
        }

        return view('regular_pages.home', compact('tickers'));
    }

    private function getTickers(Request $request)
    {
        $coinPairs = CoinPair::select('base_coin', 'trade_coin', 'name', 'last_price')
            ->where('is_active', ACTIVE)
//            ->when($request->get('tradePair'), function ($query) use($request) {
//                $query->where('name', $request->tradePair);
//            })
            ->with('exchangeSummary', 'coin')
            ->paginate(20);

        $formattedCoinPair = [];

        foreach ($coinPairs as $coinPair) {
            $formattedCoinPair[$coinPair->name] = [
                'last' => $coinPair->last_price,
                'low24hr' => "0",
                'high24hr' => "0",
                'change' => "0",
                'tradeVolume' => "0",
                'baseVolume' => "0",
            ];

            if ($coinPair->exchangeSummary !== null) {
                $formattedCoinPair[$coinPair->name]['low24hr'] = $coinPair->exchangeSummary->low_price;
                $formattedCoinPair[$coinPair->name]['high24hr'] = $coinPair->exchangeSummary->high_price;
                $formattedCoinPair[$coinPair->name]['tradeVolume'] = $coinPair->exchangeSummary->trade_coin_volume;
                $formattedCoinPair[$coinPair->name]['baseVolume'] = $coinPair->exchangeSummary->base_coin_volume;
                $formattedCoinPair[$coinPair->name]['change'] = bcmul(bcdiv(bcsub($coinPair->last_price, $coinPair->exchangeSummary->first_price), $coinPair->exchangeSummary->first_price), '100', 2);
            }
        }

        $response = $request->has('tradePair') ? $formattedCoinPair[$request->get('tradePair')] : $formattedCoinPair;
        $collect = [];
        foreach ($response as $key => $item) {
            $coin = Coin::where('symbol', explode('_', $key)[0])->first();
            $decimal = $coin->decimal_place ?: 8;
            $tradeCoinArr = explode('_', $key);

            array_push($collect, $item + [
                    'symbol' => $key,
                    'base_coin' => $tradeCoinArr[0],
                    'trade_coin' => $tradeCoinArr[1],
                    'last_price' => number_format($item['last'], $decimal),
                    'change' => floatval($item['change']),
                    'baseVolume' => number_format($item['baseVolume'], $decimal)
                ]);
        }
        return $collect;
    }
}
