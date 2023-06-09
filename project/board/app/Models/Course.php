<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Course extends Model
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
        'desc',
        'start_at',
        'end_at',
        'status',
        'user_id',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'start_at' => 'datetime',
        'end_at' => 'datetime',
        'user_id' => 'integer',
    ];

    protected $dates = [
        'start_at',
        'end_at'
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
            static::addGlobalScope('owner_courses', function (Builder $builder) use ($owner_id) {
                $builder->where('user_id', $owner_id);
            });
        }

        if (auth()->check() && backpack_user()->hasRole('user')) {
            $user_id = backpack_user()->id;
            static::addGlobalScope('user_courses', function (Builder $builder) use ($user_id) {
                $builder->whereHas('pupils', function($query) use ($user_id) {
                    $query->where('user_id', $user_id);
                });
            });
        }

        static::creating(function($model) {
            $model->user_id = backpack_user()->id;
        });

    }

    public function pupils()
    {
        return $this->belongsToMany(User::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
