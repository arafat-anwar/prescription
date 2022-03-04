<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'username',
        'password',
        'role_id',
        'department_id',
        'designation_id',
        'is_developer',
        'gender',
        'admin',
        'sound',
        'image'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    //basic relations
        function profile(){
            return $this->hasOne(\Modules\Setups\Entities\Profile::class,'user_id','id');
        }
        
        function role(){
            return $this->hasOne(\Modules\Setups\Entities\Role::class,'id','role_id');
        }

        function department(){
            return $this->hasOne(\Modules\Departments\Entities\Department::class,'id','department_id');
        }

        function designation(){
            return $this->hasOne(\Modules\Setups\Entities\Designation::class,'id','designation_id');
        }

        function headOfDepartments(){
            return $this->hasMany(\Modules\Departments\Entities\HeadOfDepartment::class,'user_id','id');
        }
    //basic relations

    //project relations - basic
        function projects(){
            return $this->hasMany(\Modules\Projects\Entities\Project::class,'manager_id','id');
        }
    //project relations - basic

    //project relations - after distribution
        function projectCriterias(){
            return $this->hasMany(\Modules\Projects\Entities\ProjectCriteria::class,'user_id','id');
        }

        function projectStatuses(){
            return $this->hasMany(\Modules\Projects\Entities\ProjectStatus::class,'user_id','id');
        }

        function projectDistributions(){
            return $this->hasMany(\Modules\Projects\Entities\ProjectDistribution::class,'user_id','id');
        }

        function projectConsumptions(){
            return $this->hasMany(\Modules\Projects\Entities\ProjectConsumption::class,'user_id','id');
        }
    //project relations - after distribution
}
