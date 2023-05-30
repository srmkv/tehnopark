<?php

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use App\Mail\Mail as SendMail;

class RequestListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle($user)
    {
        $email = new \stdClass();
        $email->mail_content = "Вам был отправлен запрос на  участие в событие в системе Видео Контур\n\n";
        $email->mail_content .= "Участником: " . $user->user->email . "\n\n";
        $email->mail_content .= "ВИДЕО КОНТУР - ВИДЕОСВЯЗЬ ДЛЯ ВСТРЕЧ, \nВЕБИНАРОВ, ОБУЧЕНИЯ И ТРЕНИНГОВ";

        Mail::to($user->user)->send(new SendMail($email));
    }
}
