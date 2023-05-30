<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;

use App\Mail\Mail as SendMail;
use Mail;

class Lesson extends Model
{
    use \Backpack\CRUD\app\Models\Traits\CrudTrait;
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title',
        'slug',
        'desc',
        'start_at',
        'status',
        'course_id',
        //'user_id',
        'pad_secret',
        'pad_json',
        'tribuna'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'start_at' => 'datetime',
        'course_id' => 'integer',
        'user_id' => 'integer'
    ];


    public function __construct(array $attributes = []) {
        parent::__construct($attributes);
        if (auth()->check() && !backpack_user()->hasRole('admin')) {
            $this->casts['pupils'] = 'array';
        }
    }

    public function setDatetimeAttribute($value) {
        $this->attributes['datetime'] = \Carbon\Carbon::parse($value);
    }

    protected static function booted()
    {
        if (auth()->check() && backpack_user()->hasRole('owner')) {
            $owner_id = backpack_user()->id;
            static::addGlobalScope('owner_lessons', function (Builder $builder) use ($owner_id) {
                $builder->where('user_id', $owner_id);
            });
        }
        if (auth()->check() && (backpack_user()->hasRole('user') || backpack_user()->hasRole('owner'))) {
            $user_id = backpack_user()->id;
            static::addGlobalScope('user_lessons', function (Builder $builder) use ($user_id) {
                $builder->whereHas('pupils', function($query) use ($user_id) {
                    $query->where('user_id', $user_id);
                });
            });
        }

        static::creating(function($model) {
            $model->user_id = backpack_user()->id;
        });

        static::created(function($model) {
            $model->sendMail($model);
        });
    }

    protected function sendMail($model) {
        $email = new \stdClass();
        $email->mail_content = "Организатор " . backpack_user()->email . " добавил новую конференцию: ";
        $email->mail_content .= url('/admin/meets/'. $model->id .'/show');
        Mail::to(env('MAIL_FROM_ADDRESS'))->send(new SendMail($email));
    }

    // public function my_pupils()
    // {
    //     $user_ids = null;
    //     $licences = Licence::where('user_id', backpack_user()->id)->whereActive(1)->with('pupils')->get();
    //     foreach( $licences as $licence ) {
    //         foreach($licence->pupils as $pupil) {
    //             $user_ids[] = $pupil->id;
    //         }
    //     }
    //     if( $user_ids ) {
    //         dd(User::whereIn('id', $user_ids)->get());
    //         return User::whereIn('id', $user_ids)->get();
    //     }
    // }

    public function pupils()
    {
        return $this->belongsToMany(User::class);
    }

    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    public function courseAll()
    {
        return $this->belongsTo(Course::class)->withoutGlobalScopes();
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function human_status()
    {
        switch($this->status) {
            case 1:
                return 'Запланированная';
                break;
            case 2:
                return 'Завершенная';
                break;
            case 3:
                return 'Отменена';
                break;
        }
    }


    public function goMeet()
    {
        return '<a href="/watch?v='.$this->slug.'" target="_blank" class="btn btn-sm btn-link"><i class="la la-eye"></i> Preview</a>';
    }
}
