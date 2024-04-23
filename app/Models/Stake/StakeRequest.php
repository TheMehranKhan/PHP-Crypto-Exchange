<?php

namespace App\Http\Requests\Stake;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class StakeRequest extends FormRequest
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

            'amount' => [
                'required',
                'numeric',
                'decimal_scale:11,8',
                'gt:0'
            ],
            'stake_package' => [
                'required'
            ]
        ];
    }
}
