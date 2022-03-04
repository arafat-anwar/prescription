<?php

namespace Modules\Setups\Entities;

use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    protected $fillable = [
        'user_id',
        'phone',
        'status',
    ];

    function user(){
        return $this->belongsTo(\App\User::class);
    }
}
