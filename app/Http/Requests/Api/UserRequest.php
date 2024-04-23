<?php

namespace App\Http\Requests\Api;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\Auth;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [
            "first_name" => "required|alpha_space|between:2,255",
            "last_name" => "required|alpha_space|between:2,255",
            "email" => "required|email|unique:users,email|between:5,255",
            "mobile" => "required|unique:users,mobile|between:6,32",
            "username" => "required|unique:users,username|max:255",
            'password' => 'required|between:6,32|same:password_confirmation',
            'password_confirmation' => 'required',
            "check_agreement" => "required",
        ];

        if(
            env('APP_ENV') != 'local' &&
            settings('display_google_captcha') == ACTIVE &&
            !$this->is('api/*')
        )
        {
            $rules['g-recaptcha-response'] = 'required|captcha';
        }


        return $rules;
    }

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json([RESPONSE_STATUS_KEY => false,"message" =>$validator->errors()], 422));
    }
}
