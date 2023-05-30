@extends(backpack_view('blank'))
@section('content')
    <div class="py-2">
        <h5>Вы были приглашены принять участие в событие:</h5>
        <table>
            <tr>
                <td>Организатор</td>
                <td class="px-5">{{ $link->user->email }}</td>
            </tr>

            <tr>
                <td>Группа</td>
                <td class="px-5">{{ $course ? $course->title : 'Не указано'  }}</td>
            </tr>

            <tr>
                <td>Встреча</td>
                <td class="px-5">{{ $lesson ? $lesson->title : 'Не указано'  }}</td>
            </tr>
        </table>
    </div>

    <form action="" method="POST">
        @csrf
        <button class="btn btn-default">Отправить запрос</button>
    </form>

@endsection
