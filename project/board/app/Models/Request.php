<?php

namespace App\Models;

use App\Listeners\SignupDone;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Backpack\CRUD\app\Models\Traits\CrudTrait;

class Request extends Model
{
    use CrudTrait;

    // protected $dispatchesEvents = [
    //     'created' => SignupDone::class,
    // ];

    /*
    |--------------------------------------------------------------------------
    | GLOBAL VARIABLES
    |--------------------------------------------------------------------------
    */

    protected $table = 'requests';
    // protected $primaryKey = 'id';
    // public $timestamps = false;
    protected $guarded = ['id'];
    protected $fillable = [
        'owner_id',
        'user_id',
        'link_id',
        'status'
    ];
    // protected $hidden = [];
    // protected $dates = [];

    /*
    |--------------------------------------------------------------------------
    | FUNCTIONS
    |--------------------------------------------------------------------------
    */

    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */

    public function link() {
        return $this->belongsTo(Link::class, 'link_id');
    }

    public function owner() {
        return $this->belongsTo(User::class);
    }

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function licence() {
        return $this->belongsTo(Licence::class);
    }

    public function lesson() {
        return $this->belongsTo(Lesson::class);
    }

    public function course() {
        return $this->belongsTo(Course::class);
    }

    /*
    |--------------------------------------------------------------------------
    | SCOPES
    |--------------------------------------------------------------------------
    */

    protected static function booted()
    {
        if( backpack_user()->hasRole('owner') ) {
            static::addGlobalScope('my_requests_owner',function (Builder $builder) {
                $builder->where('owner_id', backpack_user()->id);
            });
        }

        if( backpack_user()->hasRole('user') ) {
            static::addGlobalScope('my_requests',function (Builder $builder) {
                $builder->where('user_id', backpack_user()->id);
            });
        }

    }

    /*
    |--------------------------------------------------------------------------
    | ACCESSORS
    |--------------------------------------------------------------------------
    */

    /*
    |--------------------------------------------------------------------------
    | MUTATORS
    |--------------------------------------------------------------------------
    */
}
