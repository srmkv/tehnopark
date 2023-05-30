{{-- <header class="{{ config('backpack.base.header_class') }}"> --}}
<header class="main flex-center navbar">
    <div class="bg">
        <div></div>
    </div>
    <a href="/" class="logo"><img src="/images/logo.svg" alt=""></a>
    <!-- Logo -->

    @include(backpack_view('inc.menu'))

    <button class="navbar-toggler sidebar-toggler d-lg-none mr-auto ml-3" type="button" data-toggle="sidebar-show"
        aria-label="{{ trans('backpack::base.toggle_navigation') }}">
        <span></span>
    <span></span>
    <span></span>
    </button>

</header>
