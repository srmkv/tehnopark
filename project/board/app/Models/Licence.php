<?php

namespace App\Models;

use Spatie\Permission\Traits\HasRoles;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Licence extends Model
{
    use \Backpack\CRUD\app\Models\Traits\CrudTrait;
    use HasRoles;
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'licence_type_id',
        'start_at',
        'end_at',
        'active',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'user_id' => 'integer',
        'licence_type_id' => 'integer',
        'start_at' => 'datetime',
        'end_at' => 'datetime',
        'active' => 'boolean',
    ];

    protected $dates = [
        'start_at',
        'end_at'
    ];

    public function pupils()
    {
        return $this->belongsToMany(User::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function licenceType()
    {
        return $this->belongsTo(LicenceType::class);
    }

    protected static function booted()
    {
        if (!backpack_user()->hasRole('admin')) {
            static::addGlobalScope('pupils', function (Builder $builder) {
                $builder->whereUserId(backpack_user()->id);
            });
        }

    }
}
