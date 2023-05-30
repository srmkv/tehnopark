@extends(backpack_view('blank'))


@php
  $breadcrumbs = [
      trans('backpack::crud.admin') => url(config('backpack.base.route_prefix'), 'order'),
      'Ордер' => false,
  ];
@endphp

@section('header')
    <section class="content-header">
        <div class="container-fluid mb-3">
            <h1>Ордер</h1>
        </div>
    </section>
@endsection

@section('content')
    <div class="row">
        <div class="col">
            {!! $html !!}
        </div>
    </div>
@endsection
