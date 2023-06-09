<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Backpack\CRUD\app\Models\Traits\CrudTrait;

class Link extends Model
{
    use CrudTrait;

    /*
    |--------------------------------------------------------------------------
    | GLOBAL VARIABLES
    |--------------------------------------------------------------------------
    */

    protected $table = 'links';
    // protected $primaryKey = 'id';
    // public $timestamps = false;
    protected $guarded = ['id'];
    // protected $fillable = [];
    // protected $hidden = [];
    // protected $dates = [];

    /*
    |--------------------------------------------------------------------------
    | FUNCTIONS
    |--------------------------------------------------------------------------
    */

    protected static function booted()
    {
        if( auth()->check() && !backpack_user()->hasRole('admin') ) {
            static::addGlobalScope('my_links',function (Builder $builder) {
                $builder->where('user_id', backpack_user()->id);
            });
        }

        if( auth()->check() && !backpack_user()->hasRole('user') ) {
            static::creating(function($model) {
                $model->active = false;
            });
        }
    }

    public function social() {
        // echo '<script src="https://yastatic.net/share2/share.js"></script>
        // <div class="ya-share2" data-curtain data-shape="round" data-services="telegram,whatsapp"></div>';
        $link = url('/') . '/invite/' . $this->slug;
        $mail = 'mailto:?subject=VideoContour%20приглашение&body=Ссылка на приглашение: ' . $link;
        $tg = 'https://t.me/share/url?url='. $link .'&text=VideoContour';
        $wp = 'https://api.whatsapp.com/send?text=VideoContour%20'. $link;
        $html = '<a href="#" onclick="navigator.clipboard.writeText(`'. $link .'`);alert(`Ссылка скопирована`);return false;"><img height="40px" width="40px" src="/images/link80.png" /></a>';
        $html .= '<a href="' . $wp . '"><img height="40px" width="40px" src="/images/whatsup80.png" /></a>';
        $html .= '<a href="' . $tg . '"><img height="40px" width="40px" src="/images/tg80.png" /></a>';
        $html .= '<a href="' . $mail . '"><img height="40px" width="40px" src="/images/email80.png" /></a>';
        echo '<div class="social-icons">' . $html . '</div>';
    }

    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function course() {
        return $this->belongsTo(Course::class);
    }

    public function lesson() {
        return $this->belongsTo(Lesson::class);
    }

    /*
    |--------------------------------------------------------------------------
    | SCOPES
    |--------------------------------------------------------------------------
    */

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
