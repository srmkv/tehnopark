@extends(backpack_view('layouts.blank'))
@section('styles')
<link rel="stylesheet" href="/assets/style.css">
@endsection
@section('content')

    @include('backpack::inc.auth_menu')
    <div class="container">
        <div class="row align-items-center h-100">
            <div class="col-sm-12">
                <div class="row justify-content-center">
                    <div class="col-10 col-md-8  col-lg-6 col-xl-5  text-center bg">

                        <p class="col-12 txtauth p-3 md-sm">Авторизация</p>
                        <form role="form" method="POST" action="{{ route('backpack.auth.login') }}">
                            {!! csrf_field() !!}
                            <div class="col-12 p-3">
                                <input class="login col-12{{ $errors->has($username) ? ' is-invalid' : '' }}"
                                    name="{{ $username }}" value="{{ old($username) }}" id="{{ $username }}"
                                    placeholder="Логин" type="text"></input>
                                @if ($errors->has($username))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first($username) }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="col-12 p-3">

                                <input type="password"
                                    class="login col-12{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password"
                                    id="password" placeholder="Пароль">

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="col-12 p-3">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="remember"> {{ trans('backpack::base.remember_me') }}
                                    </label>
                                </div>
                            </div>

                            <div class="p-3 row justify-content-xs-center">
                                <div class="col-12 col-sm-6 mb-2">
                                    <button class="loginbtn" type="submit">Авторизация</button>
                                </div>
                                <div class="col-12 col-sm-6 ">
                                    <button class="authbtn"
                                    onClick="location.href='/admin/register';return false;">Регистрация</button>
                                </div>

                            </div>
                        </form>

                        <div class="mt-4">
                            @if (backpack_users_have_email() && config('backpack.base.setup_password_recovery_routes', true))
                                <div class="text-center"><a href="{{ route('backpack.auth.password.reset') }}">{{ trans('backpack::base.forgot_your_password') }}</a></div>
                            @endif
                            @if (config('backpack.base.registration_open'))
                                <div class="text-center"><a href="{{ route('backpack.auth.register') }}">{{ trans('backpack::base.register') }}</a></div>
                            @endif
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
