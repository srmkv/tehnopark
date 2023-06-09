<?php

use Illuminate\Support\Facades\Route;

// --------------------------
// Custom Backpack Routes
// --------------------------
// This route file is loaded automatically by Backpack\Base.
// Routes you generate using Backpack\Generators will be placed here.

Route::group([
    'prefix'     => config('backpack.base.route_prefix', 'admin'),
    'middleware' => array_merge(
        (array) config('backpack.base.web_middleware', 'web')
    ),
    'namespace'  => 'App\Http\Controllers\Admin',
], function () {
    Route::get('register', 'Auth\RegisterController@showRegistrationForm')->name('backpack.auth.register');
    Route::post('register', 'Auth\RegisterController@register');

});

Route::group([
    'prefix'     => config('backpack.base.route_prefix', 'admin'),
    'middleware' => array_merge(
        (array) config('backpack.base.web_middleware', 'web'),
        (array) config('backpack.base.middleware_key', 'admin')
    ),
    'namespace'  => 'App\Http\Controllers\Admin',
], function () { // custom admin routes
    Route::crud('groups', 'CourseCrudController');
    Route::crud('meets', 'LessonCrudController');
    Route::middleware(['role:admin,owner'])->group(function () {
        Route::crud('transaction', 'TransactionCrudController');
        Route::crud('licence', 'LicenceCrudController');
        Route::crud('members', 'MemberCrudController');
        Route::crud('link', 'LinkCrudController');
    });
    Route::middleware(['role:admin'])->group(function () {
        Route::crud('licence-type', 'LicenceTypeCrudController');
    });

    Route::crud('request', 'RequestCrudController');
    Route::crud('order', 'OrderCrudController');
}); // this should be the absolute last line of this file