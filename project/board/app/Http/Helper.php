<?php

namespace App\Http;

class Helper
{
    public static function generate_string($strength = 9, $model) {
        $permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $input_length = strlen($permitted_chars);
        $random_string = '';
        for($i = 0; $i < $strength; $i++) {
            $random_character = $permitted_chars[mt_rand(0, $input_length - 1)];
            $random_string .= $random_character;
        }

        if( $model::where('slug', $random_string)->first() ) {
            static::generate_string(9, $model);
        }

        return $random_string;
    }

    public static function getMyPupils(): array
    {
        $user_ids = null;
        $licences = \App\Models\Licence::where('user_id', backpack_user()->id)->whereActive(1)->with('pupils')->get();
        foreach( $licences as $licence ) {
            foreach($licence->pupils as $pupil) {
                $user_ids[] = $pupil->id;
            }
        }

        if( $user_ids ) {
            $users = \App\Models\User::whereIn('id', $user_ids)->pluck('email','id')->toArray();
            return $users;
        }
        return [];
    }
}
