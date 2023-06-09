<div class="profile flex">
    @if(Auth::user()->image)
        <img height="58px" width="58px" class="image rounded-circle"  src="{{asset('/storage/avatar/'.Auth::user()->email . '/' . Auth::user()->image)}}">
    @else
        <img height="58px" width="58px" class="image rounded-circle"  src="{{asset('/storage/avatar/user.png')}}">
    @endif
    <a href="#" data-toggle="dropdown" role="button" class="flex-center">{{ auth()->user()->name }}</a>
    <div class="dropdown-menu {{ config('backpack.base.html_direction') == 'rtl' ? 'dropdown-menu-left' : 'dropdown-menu-right' }} mr-4 pb-1 pt-1">
        <a class="dropdown-item" href="{{ route('backpack.account.info') }}"><i class="la la-user"></i> {{ trans('backpack::base.my_account') }}</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="{{ backpack_url('logout') }}"><i class="la la-lock"></i> {{ trans('backpack::base.logout') }}</a>
      </div>
</div>
