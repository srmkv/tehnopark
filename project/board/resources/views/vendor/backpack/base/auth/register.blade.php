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

                        <p class="col-12 txtauth p-3 md-sm">{{ trans('backpack::base.register') }}</p>

                        <form role="form" method="POST" action="{{ route('backpack.auth.register') }}">
                            {!! csrf_field() !!}


                            <div class="col-12 p-3">
                                <input type="text" placeholder="{{ trans('backpack::base.name') }}"
                                    class="login col-12{{ $errors->has('name') ? ' is-invalid' : '' }}" name="name"
                                    id="name" value="{{ old('name') }}">

                                @if ($errors->has('name'))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="col-12 p-3">
                                <input placeholder="{{ config('backpack.base.authentication_column_name') }}"
                                    type="{{ backpack_authentication_column() == 'email' ? 'email' : 'text' }}"
                                    class="login col-12{{ $errors->has(backpack_authentication_column()) ? ' is-invalid' : '' }}"
                                    name="{{ backpack_authentication_column() }}"
                                    id="{{ backpack_authentication_column() }}"
                                    value="{{ old(backpack_authentication_column()) }}">

                                @if ($errors->has(backpack_authentication_column()))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first(backpack_authentication_column()) }}</strong>
                                    </span>
                                @endif
                            </div>


                            <div class="col-12 p-3">

                                <input type="password"
                                    class="login col-12{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password"
                                    id="password" placeholder="{{ trans('backpack::base.password') }}">

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>

                            <div class="col-12 p-3">
                                <input placeholder="{{ trans('backpack::base.confirm_password') }}" type="password"
                                    class="login col-12{{ $errors->has('password_confirmation') ? ' is-invalid' : '' }}"
                                    name="password_confirmation" id="password_confirmation">

                                @if ($errors->has('password_confirmation'))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first('password_confirmation') }}</strong>
                                    </span>
                                @endif
                            </div>


                            <div class="form-group">
                                <div>
                                    <input type="radio" name="type" id="type_2" value="2" checked>
                                    <label class="control-label" for="type_2">Я участник</label>
                                </div>

                                <div>
                                    <input type="radio" name="type" id="type_1" value="1">
                                    <label class="control-label" for="type_1">Я организатор</label>
                                </div>
                            </div>

                            <div class="p-3 row justify-content-xs-center">
                                <div class="col-12 mb-2">
                                    <button class="loginbtn" type="submit"> {{ trans('backpack::base.register') }}
                                    </button>
                                </div>
                            </div>
                        </form>
                        @if (backpack_users_have_email() && config('backpack.base.setup_password_recovery_routes', true))
                            <div class="text-center"><a
                                    href="{{ route('backpack.auth.password.reset') }}">{{ trans('backpack::base.forgot_your_password') }}</a>
                            </div>
                        @endif
                        <div class="text-center"><a
                                href="{{ route('backpack.auth.login') }}">{{ trans('backpack::base.login') }}</a></div>
                    </div>
                </div>
            </div>
        </div>
    @endsection
