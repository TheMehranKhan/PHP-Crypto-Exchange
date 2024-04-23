<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\TransformsRequest;
use Stevebauman\Purify\Facades\Purify;

class StripTags extends TransformsRequest
{

    /**
     * Transform the given value.
     *
     * @param string $key
     * @param mixed $value
     * @return mixed
     */
    protected function transform($key, $value)
    {
        $stripTags = config('commonconfig.strip_tags');
        if (in_array($key, $stripTags['escape_text'], true)) {
            if($key=='currentLangData'){
                $newValue = [];
                $value = json_decode($value,true);
                foreach ($value as $key=>$val){
                    $newValue[Purify::clean($key)] = Purify::clean($val);
                }
                $newValue = (object) $newValue;
                return json_encode($newValue);
            }
            return Purify::clean($value);
        }
        return strip_tags($value);
    }
}
