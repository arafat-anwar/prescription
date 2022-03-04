<?php

namespace Modules\Setups\Entities;

use Illuminate\Database\Eloquent\Model;

class Designation extends Model
{
    protected $fillable = [
        'name',
        'rate',
        'hours',
        'status',
    ];

    function users(){
        return $this->hasMany(\App\User::class);
    }
}
