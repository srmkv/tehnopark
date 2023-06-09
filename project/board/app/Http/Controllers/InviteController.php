<?php

namespace App\Http\Controllers;

use App\Models\Link;
use App\Models\Request;

class InviteController extends Controller
{
    public function __invoke($id)
    {
        $link = Link::withoutGlobalScope('my_links')->where('slug', $id)->firstOrFail();

        $data = [
            'owner_id' => $link->user_id,
            'user_id' => backpack_user()->id,
            'link_id' => $link->id
        ];

        if( $link->course_id ) {
            $data['course_id'] = $link->course_id;
        }

        if( $link->lesson_id ) {
            $data['lesson_id'] = $link->lesson_id;
        }

        Request::create([
            'owner_id' => $link->user_id,
            'user_id' => backpack_user()->id,
            'link_id' => $link->id,
        ]);
        \Alert::add('success', 'Запросс был отпрален')->flash();
        return \Redirect::to('admin/request');
    }
}
