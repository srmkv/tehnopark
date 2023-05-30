<?php
namespace App\Http\Controllers\Admin\Auth;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Validator;
use Backpack\CRUD\app\Http\Controllers\Auth\RegisterController as BackpackRegisterController;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Session\Session;

class RegisterController extends BackpackRegisterController
{
    /**
     * Get a validator for an incoming registration request.
     *
     * @param array $data
     *
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $user_model_fqn = config('backpack.base.user_model_fqn');
        $user = new $user_model_fqn();
        $users_table = $user->getTable();
        $email_validation = backpack_authentication_column() == 'email' ? 'email|' : '';

        return Validator::make($data, [
            'name'                             => 'required|max:255',
            'type'                             => ['required', Rule::in(['1', '2'])],
            backpack_authentication_column()   => 'required|'.$email_validation.'max:255|unique:'.$users_table,
            'password'                         => 'required|min:6|confirmed',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param array $data
     *
     * @return User
     */
    protected function create(array $data)
    {
        $user_model_fqn = config('backpack.base.user_model_fqn');
        $user = new $user_model_fqn();
        $role = ($data['type'] == 1)? 'owner' : 'user';

        return $user->create([
            'name'                             => $data['name'],
            backpack_authentication_column()   => $data[backpack_authentication_column()],
            'password'                         => bcrypt($data['password']),
        ])->assignRole($role);
    }

    /**
     * Handle a registration request for the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        // if registration is closed, deny access
        if (! config('backpack.base.registration_open')) {
            abort(403, trans('backpack::base.registration_closed'));
        }

        $this->validator($request->all())->validate();

        $user = $this->create($request->all());

        Auth::login($user);
        \Alert::add('success', 'Вы успешно зарегистрированы')->flash();
        event(new Registered($user));

        if( session('url.intended') ) {
            return redirect(session('url.intended'));
        }


        return redirect($this->redirectPath());
    }

    public function showRegistrationForm()
    {
        return view(backpack_view('auth.register'));
    }
}
