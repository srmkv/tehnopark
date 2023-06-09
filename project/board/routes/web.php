<?php

use App\User;
use App\Models\Link;
use App\Models\Course;
use App\Models\Lesson;
use App\Models\Request;
use App\Models\User as ModelsUser;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MailController;
use App\Http\Controllers\PlanController;


use App\Http\Controllers\OrderController;
use App\Http\Controllers\AcceptController;
use App\Http\Controllers\InviteController;
use Illuminate\Http\Request as HttpRequest;
use Backpack\PermissionManager\app\Http\Controllers\UserCrudController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return redirect('/admin/login');
});

Route::group(['middleware' => 'auth'], function() {
    Route::get('/lesson/{slug}/request', function ($slug) {
        return view('lesson', compact('slug'));
    });
    Route::get('/lesson/{slug}', function ($slug) {
        return view('lesson', compact('slug'));
    });
    Route::post('/avatar_update', [UserCrudController::class, 'upload']);
    Route::view('plans', 'plans');
    // Route::get('plans/{id}/buy', [PlanController::class, 'buy']);

    Route::post('order', [OrderController::class, 'submitOrder']);
    Route::get('order/{id}', [OrderController::class, 'getOrder']);
});

// Route::get('send_mail', [MailController::class, 'send_mail']);


// Route::get('sendbasicemail', [MailController::class, 'basic_email']);
// Route::get('sendhtmlemail', [MailController::class, 'html_email']);
// Route::get('sendattachmentemail', [MailController::class, 'attachment_email']);





Route::get('/invite/{id}', function ($id) {
    $course = null;
    $lesson = null;

    $link = Link::withoutGlobalScope('my_links')->where('slug', $id)->with('user')->firstOrFail();

    if( $link->course_id ) {
        $course = Course::withoutGlobalScope('user_courses')->find($link->course_id);
    }

    if( $link->lesson_id ) {
        $lesson = Lesson::withoutGlobalScope('user_lessons')->find($link->lesson_id);
    }


    if(  auth()->check() && backpack_auth() ) {
        return view('backpack::request', compact('link', 'course', 'lesson') );
    } else {
        app('redirect')->setIntendedUrl("/invite/{$id}");
        return redirect('/admin/register');
    }
});

Route::post('/invite/{id}', InviteController::class);

Route::post('/admin/request/{id}/accept', [AcceptController::class, 'accept']);
Route::post('/admin/request/{id}/ignore', [AcceptController::class, 'ignore']);

