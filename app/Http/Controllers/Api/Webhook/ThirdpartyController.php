<?php

namespace App\Http\Controllers\Api\Webhook;

use App\Http\Controllers\Controller;
use App\Jobs\Webhook\ThirdpartyJob;
use App\Models\Order\Order;
use Illuminate\Http\Request;

class ThirdpartyController extends Controller
{
    public function __invoke(Request $request)
    {
        if (settings('enable_thirdparty_exchange') == ACTIVE) {
            $categories = [ORDER_CATEGORY_LIMIT, ORDER_CATEGORY_STOP_LIMIT];
            $orders = Order::query()
                ->where('status', STATUS_PENDING)
                ->whereNotNull('thirdparty')
                ->whereIn('category', $categories)
                ->get();
            foreach ($orders as $order) {
                ThirdpartyJob::dispatchSync($order);
            }
        }

        return [];
    }
}
