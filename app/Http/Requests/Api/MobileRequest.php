<?php

namespace App\Http\Requests\Api;

use Illuminate\Foundation\Http\FormRequest;

class MobileRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'mobile' => 'required'
//            'mobile' => 'required|required|unique:users,mobile|exists:users,mobile,is_mobile_verified,' . INACTIVE,
        ];
    }
}
