<?php

namespace App\Http\Controllers\Page;

use App\Http\Controllers\Controller;
use App\Models\Core\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Storage;
use App\Models\Coin\CoinPair;
use App\Models\Coin\Coin;


class PageController extends Controller
{
    public function __invoke(Page $page,Request $request)
    {
        $tickers = $this->getTickers($request);
        abort_if((empty($page->published_at) || $page->is_home_page), 404);
        try {
            $fallbackLang = Storage::disk('public')->get('page_language/'.$page->id.'/'. config('app.fallback_locale') .'.json');
            $data['fallbackLang'] = json_decode($fallbackLang, true);
        }
        catch (\Exception $e){
            abort('404','You do not have default fallback language data');
        }
        try {
            $currentLang = Storage::disk('public')->get('page_language/'.$page->id.'/'. App::getLocale() .'.json');
            $data['currentLang'] = json_decode($currentLang, true);
        }
        catch (\Exception $e){
            $data['currentLang'] = [];
        }
        $data['visualPage'] = $page;
        $data['tickers'] = $tickers;
        return view('core.pages.show', $data);
    }

    private function getTickers(Request $request)
    {
        $coinPairs = CoinPair::select('base_coin', 'trade_coin', 'name', 'last_price')
            ->where('is_active', ACTIVE)
//            ->when($request->get('tradePair'), function ($query) use($request) {
//                $query->where('name', $request->tradePair);
//            })
            ->with('exchangeSummary', 'coin')
            ->get();

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
            $decimal = $coin->decimal_place ?  : 8;
            array_push($collect, $item + [
                    'symbol' => $key,
                    'last_price' => number_format($item['last'], $decimal)
                ]);
        }
        return $collect;
    }
}
