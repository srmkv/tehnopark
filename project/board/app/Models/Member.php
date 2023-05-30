<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

// use Illuminate\Database\Eloquent\Relations\HasOne;

class Member extends Model
{
    use CrudTrait;

    /*
    |--------------------------------------------------------------------------
    | GLOBAL VARIABLES
    |--------------------------------------------------------------------------
    */

    protected $table = 'licence_user';
    protected $primaryKey = 'user_id';
    public $timestamps = false;
    //protected $guarded = ['user_id', 'licence_id'];
    protected $fillable = ['user_id', 'licence_id'];
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

    public function licence(): BelongsTo
    {
        return $this->belongsTo(Licence::class, 'licence_id')->whereActive(1);
    }

    public function pupil(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    /*
    |--------------------------------------------------------------------------
    | SCOPES
    |--------------------------------------------------------------------------
    */

    protected static function booted()
    {
        $licence_ids = Licence::whereUserId(backpack_user()->id)->whereActive(1)->pluck('id')->toArray();
        if( !$licence_ids ) {
            \Alert::add('error', 'У вас нет активных лицензий')->flash();
            // return back();
        }

        static::addGlobalScope('my_licence', function (Builder $builder) use ($licence_ids) {
            $builder->whereIn('licence_id', $licence_ids);
        });

        static::creating(function($model) use ($licence_ids)
        {
            $added = false;
            $lincences = Licence::whereIn('id', $licence_ids)->with('licenceType')->withCount('pupils')->get();
            foreach($lincences as $lincence) {
                if( $lincence->pupils_count < $lincence->licenceType->pupils ) {
                    $model->licence_id = $lincence->id;
                    $added = true;
                }
            }
            if( !$added ) {
                \Alert::add('error', 'У вас нет больше места для новых участников')->flash();
                return false;
            }
        });
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
