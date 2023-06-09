<!-- This file is used to store sidebar items, starting with Backpack\Base 0.9.0 -->
<li class="nav-item"><a class="nav-link" href="{{ backpack_url('dashboard') }}"><img src="/images/icon-dashboard.svg" alt=""> {{ trans('backpack::base.dashboard') }}</a></li>
@hasrole('owner')
<li class='nav-item'><a class='nav-link' href='{{ backpack_url('members') }}'><img src="/images/icon-peoples.svg" alt=""> Мои Участники</a></li>
@endhasrole
@hasrole('admin')
<!-- Users, Roles, Permissions -->
<li class="nav-item nav-dropdown">
    <a class="nav-link nav-dropdown-toggle" href="#"><i class="nav-icon la la-users"></i> Упраление пользователями</a>
    <ul class="nav-dropdown-items">
        <li class="nav-item"><a class="nav-link" href="{{ backpack_url('user') }}"><i class="nav-icon la la-user"></i> <span>Пользователи</span></a></li>
        <li class="nav-item"><a class="nav-link" href="{{ backpack_url('role') }}"><i class="nav-icon la la-id-badge"></i> <span>Роли</span></a></li>
        <li class="nav-item"><a class="nav-link" href="{{ backpack_url('permission') }}"><i class="nav-icon la la-key"></i> <span>Привилегии</span></a></li>
    </ul>
</li>

<li class="nav-item"><a class="nav-link" href="{{ backpack_url('elfinder') }}"><i class="nav-icon la la-files-o"></i> <span>{{ trans('backpack::crud.file_manager') }}</span></a></li>
@endhasrole
<li class='nav-item'><a class='nav-link' href='{{ backpack_url('groups') }}'><img src="/images/icon-courses.svg" alt=""> Группы ВКС</a></li>
<li class='nav-item'><a class='nav-link' href='{{ backpack_url('meets') }}'><img src="/images/icon-lessons.svg" alt=""> Мои встречи</a></li>

@hasrole('admin')
<li class='nav-item'><a class='nav-link' href='{{ backpack_url('licence-type') }}'><i class='nav-icon la la-key'></i> Типы лицензий</a></li>
@endhasrole
@hasanyrole('admin|owner')
<li class='nav-item'><a class='nav-link' href='/plans'><img src="/images/icon-dashboard.svg" alt=""> Тарифы</a></li>
<li class='nav-item'><a class='nav-link' href='{{ backpack_url('licence') }}'><img src="/images/icon-licence.svg" alt=""> Лицензии</a></li>
<li class='nav-item'><a class='nav-link' href='{{ backpack_url('transaction') }}'><img src="/images/icon-transactions.svg" alt=""> Транзакции</a></li>
<li class='nav-item'><a class='nav-link' href='{{ backpack_url('link') }}'><img src="/images/icon-links.svg" alt=""> Ссылки</a></li>
<li class='nav-item'><a class='nav-link' href='{{ backpack_url('order') }}'><i class='nav-icon la la-shopping-cart'></i> Заказы</a></li>

@endhasanyrole

<li class='nav-item'><a class='nav-link' href='{{ backpack_url('request') }}'><img src="/images/icon-share.svg" alt=""> Приглашения</a></li>
