<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Mail\Mail as SendMail;
use Mail;

class MailController extends Controller
{

    public function send_mail()
    {

        // $objDemo = new \stdClass();
        // $objDemo->demo_one = 'Demo One Value';
        // $objDemo->demo_two = 'Demo Two Value';
        // $objDemo->sender = 'SenderUserName';
        // $objDemo->receiver = 'ReceiverUserName';

        // Mail::to("receiver@example.com")->send(new SendMail($objDemo));

        // Mail::send(['text' => 'mail'], $data, function ($message) {
        //     $message->to($data['to'], $data['name'])->subject($data['subject']);
        //     // $message->from('xyz@gmail.com', 'Virat Gandhi');
        // });
        // dump($data);
        // echo "Text Email Sent. Check your inbox.";
    }









    public static function text_email($data)
    {
        // $data = array('name' => "Virat Gandhi");

        Mail::send(['text' => 'mail'], $data, function ($message) {
            $message->to($data['to'], $data['name'])->subject($data['subject']);
            // $message->from('xyz@gmail.com', 'Virat Gandhi');
        });
        echo "Text Email Sent. Check your inbox.";
    }
    public function html_email($data) {

        Mail::send('mail', $data, function ($message) {
            $message->to($data['to'], $data['name'])->subject($data['subject']);
            // $message->from('xyz@gmail.com', 'Virat Gandhi');
        });
        echo "HTML Email Sent. Check your inbox.";
    }
    //  public function attachment_email() {
    //     $data = array('name'=>"Virat Gandhi");
    //     Mail::send('mail', $data, function($message) {
    //        $message->to('abc@gmail.com', 'Tutorials Point')->subject
    //           ('Laravel Testing Mail with Attachment');
    //        $message->attach('C:\laravel-master\laravel\public\uploads\image.png');
    //        $message->attach('C:\laravel-master\laravel\public\uploads\test.txt');
    //        $message->from('xyz@gmail.com','Virat Gandhi');
    //     });
    //     echo "Email Sent with attachment. Check your inbox.";
    //  }
}
