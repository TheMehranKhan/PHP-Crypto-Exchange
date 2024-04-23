<?php

namespace App\Http\Requests\Coin;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class CoinBonusRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'is_active' => [
                'required',
                Rule::in(array_keys(active_status()))
            ],
            'minimum_amount' => [
                'required',
                'numeric',
                'decimal_scale:11,8',
                'gt:0'
            ],
            'maximum_amount' => [
                'required',
                'numeric',
                'decimal_scale:11,8',
                'gt:0'
            ],
            'bonus_earning' => [
                'required',
                'numeric',
                'decimal_scale:11,8',
                'gte:0',
            ],
            'bonus_earning_type' => [
                'required',
                Rule::in(array_keys(fee_types()))
            ],
            'bonus_usage_count' => [
                'required',
                'numeric'
            ],
            'coin_earning' => [
                'required'
            ]
        ];
    }
}
