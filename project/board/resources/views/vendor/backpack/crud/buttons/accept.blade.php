<div class="d-flex">
    <a href="{{ url($crud->route.'/'.$entry->getKey().'/edit') }}" class="btn btn-sm btn-default mx-1"><i class="la la-edit"></i></a>
@if ($crud->hasAccess('update') && $entry->status == 'new')
    <form class="mx-1" method="POST" action="{{ url($crud->route.'/'.$entry->getKey().'/accept') }}">
        @csrf
        <button class="btn btn-sm btn-success">Принять</button>
    </form>

    <form class="mx-1" method="POST" action="{{ url($crud->route.'/'.$entry->getKey().'/ignore') }}">
        @csrf
        <button class="btn btn-sm btn-error">Отклонить</button>
    </form>
@endif
</div>
