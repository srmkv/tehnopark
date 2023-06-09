<?php

namespace App\Http\Controllers;

use Mail;
use App\Models\User;
use App\Models\Course;
use App\Models\Lesson;
use App\Models\Member;

use App\Models\Licence;
use App\Models\Request;
use App\Mail\Mail as SendMail;

class AcceptController extends Controller
{
    public function accept($id)
    {
        $course = null;
        $lesson = null;
        $request = Request::where('owner_id', backpack_user()->id)->where('id', $id)->with('link')->firstOrFail();

        $member = Member::where('user_id', $request->user_id)->first();

        if ($member) {
            \Alert::add('error', 'Учвстник уже добавлен')->flash();
            return back();
        }

        $member = Member::create(['user_id' => $request->user_id]);

        if( $member ) {
            $request->status = 'accepted';
            $request->save();

            if( $request->link->course_id ) {
                Course::find($request->link->course_id)->pupils()->sync([$request->user_id]);
            }
            if( $request->link->lesson_id ) {
                Lesson::find($request->link->lesson_id)->pupils()->sync([$request->user_id]);
            }
        }

        $this->sendMail($request->user_id);

        return redirect('/admin/members');
    }

    public function ignore($id)
    {
        $request = Request::where('owner_id', backpack_user()->id)->where('id', $id)->firstOrFail();
        $request->status = 'ignored';
        $request->save();
        return back();
    }

    protected function sendMail($user_id) {
        $email = new \stdClass();
        $email->mail_content = "Ваше приглашение ". url('/admin/request') ." подтвердил организатор";
        Mail::to(User::find($user_id))->send(new SendMail($email));
    }
}
