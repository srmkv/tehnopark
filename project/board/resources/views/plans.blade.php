@extends('backpack::base.blank')

@section('styles')
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="assets/tarif.css" rel="stylesheet">
@endsection

@php
    $plans = App\Models\LicenceType::whereActive(1)->get();
    // dd($plans);
@endphp

@section('content')
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="assets/tarif.css" rel="stylesheet">
    <div class="container">
        <div id="tarif">

            <div id="mod-custom121" class="mod-custom custom">
                <h3>Тарифы</h3>
                <ul id="pills-tab" class="nav nav-pills mb-3" role="tablist">
                    <li class="nav-item" role="presentation"><button id="pills-home-tab" class="nav-link" role="tab"
                            type="button" data-bs-toggle="pill" data-bs-target="#year" aria-controls="pills-home"
                            aria-selected="false" tabindex="-1">За год</button></li>
                    <li class="nav-item" role="presentation"><button id="pills-contact-tab" class="nav-link active"
                            role="tab" type="button" data-bs-toggle="pill" data-bs-target="#month"
                            aria-controls="pills-contact" aria-selected="true">За месяц</button></li>
                </ul>
                <div id="pills-tabContent" class="tab-content">
                    <div id="year" class="tab-pane fade show active" role="tabpanel" aria-labelledby="pills-home-tab">
                        <div class="row_my">
                            @forelse ($plans as $plan)
                            <div class="block">
                                <div class="name">{{ $plan->title }}</div>
                                <div class="desc">{!! $plan->desc !!}</div>
                                <div class="price">{{ intval($plan->price_year) ? $plan->price_year . " руб/год" : "бесплатно" }}</div>
                                <div class="vhodit">
                                    <button class="btn_vhodit" type="button" data-bs-toggle="modal"
                                        data-bs-target="#tarif_{{ $plan->id }}_year">Что входит?</button></div>
                            </div>
                        @empty

                        @endforelse

                            {{-- <div class="block">
                                <div class="name">Демо</div>
                                <div class="desc">Небольшим компаниям для ознакомления с системой</div>
                                <div class="price">бесплатно</div>
                                <div class="vhodit"><button class="btn_vhodit" type="button" data-bs-toggle="modal"
                                        data-bs-target="#tarif_baza">Что входит?</button></div>
                            </div>
                            <div class="block">
                                <div class="name">Группа</div>
                                <div class="desc">Средним<br>организациям</div>
                                <div class="price">7 190 руб/в год</div>
                                <div class="vhodit"><button class="btn_vhodit" type="button" data-bs-toggle="modal"
                                        data-bs-target="#tarif_gruppa">Что входит?</button></div>
                            </div>
                            <div class="block">
                                <div class="name">Корпорация</div>
                                <div class="desc">Крупным компаниям с большим количеством сотрудников</div>
                                <div class="price">60 060 руб/в год</div>
                                <div class="vhodit"><button class="btn_vhodit" type="button" data-bs-toggle="modal"
                                        data-bs-target="#tarif_corporate">Что входит?</button></div>
                            </div>
                            <div class="block">
                                <div class="name">Сервер</div>
                                <div class="desc">Крупным компаниям с большим количеством сотрудников</div>
                                <div class="price">190 000 руб/в год</div>
                                <div class="vhodit"><button class="btn_vhodit" type="button" data-bs-toggle="modal"
                                        data-bs-target="#tarif_server">Что входит?</button></div>
                            </div>
                            <div class="block">
                                <div class="name">Сервер плюс</div>
                                <div class="desc">Крупным компаниям с большим количеством сотрудников</div>
                                <div class="price">500 000 руб/в год</div>
                                <div class="vhodit"><button class="btn_vhodit" type="button" data-bs-toggle="modal"
                                        data-bs-target="#tarif_server_plus">Что входит?</button></div>
                            </div> --}}
                        </div>
                    </div>
                    <div id="month" class="tab-pane fade" role="tabpanel" aria-labelledby="pills-contact-tab">
                        <div class="row_my">
                            {{-- @dd($plans) --}}

                        @forelse ($plans as $plan)
                            <div class="block">
                                <div class="name">{{ $plan->title }}</div>
                                <div class="desc">{!! $plan->desc !!}</div>
                                <div class="price">{{ intval($plan->price) ? $plan->price . " руб/мес" : "бесплатно" }}</div>
                                <div class="vhodit">
                                    <button class="btn_vhodit" type="button" data-bs-toggle="modal"
                                        data-bs-target="#tarif_{{ $plan->id }}">Что входит?</button></div>
                            </div>
                        @empty

                        @endforelse

                            {{-- <div class="block">
                                <div class="name">Группа</div>
                                <div class="desc">Средним<br>организациям</div>
                                <div class="price">900 руб/мес</div>
                                <div class="vhodit"><button class="btn_vhodit" type="button" data-bs-toggle="modal"
                                        data-bs-target="#tarif_gruppa">Что входит?</button></div>
                            </div>
                            <div class="block">
                                <div class="name">Корпорация</div>
                                <div class="desc">Крупным компаниям с большим количеством сотрудников</div>
                                <div class="price">7 150 руб/мес</div>
                                <div class="vhodit"><button class="btn_vhodit" type="button" data-bs-toggle="modal"
                                        data-bs-target="#tarif_corporate">Что входит?</button></div>
                            </div>
                            <div class="block">
                                <div class="name">Сервер</div>
                                <div class="desc">Крупным компаниям с большим количеством сотрудников</div>
                                <div class="price">19 000 руб/мес</div>
                                <div class="vhodit"><button class="btn_vhodit" type="button" data-bs-toggle="modal"
                                        data-bs-target="#tarif_server">Что входит?</button></div>
                            </div>
                            <div class="block">
                                <div class="name">Сервер плюс</div>
                                <div class="desc">Крупным компаниям с большим количеством сотрудников</div>
                                <div class="price">500 000 руб</div>
                                <div class="vhodit"><button class="btn_vhodit" type="button" data-bs-toggle="modal"
                                        data-bs-target="#tarif_server_plus">Что входит?</button></div>
                            </div> --}}
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Тариф Демо -->
    @section('after_scripts')

    @forelse ($plans as $plan)
    <div class="modal fade" id="tarif_{{ $plan->id }}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog-centered modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Тариф {{ $plan->title }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                </div>
                <div class="modal-body">

                    <table class="price_modal">
                        <tbody>
                            <tr>
                                <td>КОЛИЧЕСТВО УЧАСТНИКОВ</td>
                                <td>до {{ $plan->pupils }}</td>
                            </tr>
                            <tr>
                                <td>Срок действия</td>
                                <td>1 мес</td>
                            </tr>
                            <tr>
                                <td>ВИДЕОКОНФЕРЕНЦИИ FULL HD КАЧЕСТВа</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ЗАЩИЩЁННАЯ ВИДЕОСВЯЗЬ НА ВСЕХ ПЛАТФОРМАХ И ОПЕРАЦИОННЫХ СИСТЕМАХ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ИНТЕГРАЦИЯ ВИДЕО СО СТОРОННИХ СЕРВЕРОВ YOUTUBE, RUTUBE И ДРУГИХ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ПОЛНОФУНКЦИОНАЛЬНАЯ ОН ЛАЙН ДОСКА В ПОСТОЯННОМ ДОСТУПЕ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>РЕЖИМ МОДЕРАЦИИ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ПЛАНИРОВЩИК КОНФЕРЕНЦИЙ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ЗАПИСЬ КОНФЕРЕНЦИЙ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ЧАТЫ, ОНЛАЙН ГОЛОСОВАНИЕ, ИНТЕГРАЦИЯ ОБМЕНА ФАЙЛАМИ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ПОИСК ПО ИСТОРИИ КОНФЕРЕНЦИЙ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ОПРОСЫ И ТЕСТЫ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ВОЗМОЖНОСТЬ ДОРАБОТКИ</td>
                                <td>-</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="modal_price_btn">
                        <div><span class="txt_price">Цена: {{ intval($plan->price) ? $plan->price . " руб/мес" : "бесплатно" }}</span></div>
                        <div><span class="zakazat" onclick="order(this)" data-id="{{ $plan->id }}" id="order_{{ $plan->id }}">Заказать интеграцию</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="tarif_{{ $plan->id }}_year" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog-centered modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Тариф {{ $plan->title }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
                </div>
                <div class="modal-body">

                    <table class="price_modal">
                        <tbody>
                            <tr>
                                <td>КОЛИЧЕСТВО УЧАСТНИКОВ</td>
                                <td>до {{ $plan->pupils }}</td>
                            </tr>
                            <tr>
                                <td>Срок действия</td>
                                <td>1 год</td>
                            </tr>
                            <tr>
                                <td>ВИДЕОКОНФЕРЕНЦИИ FULL HD КАЧЕСТВа</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ЗАЩИЩЁННАЯ ВИДЕОСВЯЗЬ НА ВСЕХ ПЛАТФОРМАХ И ОПЕРАЦИОННЫХ СИСТЕМАХ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ИНТЕГРАЦИЯ ВИДЕО СО СТОРОННИХ СЕРВЕРОВ YOUTUBE, RUTUBE И ДРУГИХ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ПОЛНОФУНКЦИОНАЛЬНАЯ ОН ЛАЙН ДОСКА В ПОСТОЯННОМ ДОСТУПЕ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>РЕЖИМ МОДЕРАЦИИ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ПЛАНИРОВЩИК КОНФЕРЕНЦИЙ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ЗАПИСЬ КОНФЕРЕНЦИЙ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ЧАТЫ, ОНЛАЙН ГОЛОСОВАНИЕ, ИНТЕГРАЦИЯ ОБМЕНА ФАЙЛАМИ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ПОИСК ПО ИСТОРИИ КОНФЕРЕНЦИЙ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ОПРОСЫ И ТЕСТЫ</td>
                                <td><img src="img/arrow_svyaz.svg"></td>
                            </tr>
                            <tr>
                                <td>ВОЗМОЖНОСТЬ ДОРАБОТКИ</td>
                                <td>-</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="modal_price_btn">
                        <div><span class="txt_price">Цена: {{ intval($plan->price_year) ? $plan->price_year . " руб/год" : "бесплатно" }}</span></div>
                        <div><span class="zakazat" onclick="order(this)" data-id="{{ $plan->id }}" id="order_{{ $plan->id }}_year">Заказать интеграцию</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @empty

    @endforelse

    @endsection

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous">
    </script>

    <script>
        function order(e) {
            let plans = @json($plans);
            let period = 'month';
            let plan_type_id = e.dataset.id;

            console.log('plans_js', plans, plan_type_id);
            console.log('plans_php', {!! $plan !!});

            if( plan_type_id ) {
                let plan = plans.find(plan => plan.id == plan_type_id);

                if( e.id.includes('year') ) {
                    price = plan.price_year;
                    period = 'year';
                } else {
                    price = plan.price;
                }

                var formdata = new FormData();
                formdata.append("plan_type_id", plan_type_id);
                formdata.append("period", period);
                formdata.append("amount", price);
                formdata.append("_token", "{{ csrf_token() }}");


                var requestOptions = {
                    method: 'POST',
                    body: formdata,
                    redirect: 'follow'
                };

                fetch("/order", requestOptions)
                    .then(response => response.text())
                    .then(result => {
                        location.href = '/order/' + result;
                    })
                    .catch(error => console.log('error', error));
            }

        }
    </script>

@endsection

@section('styles')
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="assets/tarif.css" rel="stylesheet">
@endsection
