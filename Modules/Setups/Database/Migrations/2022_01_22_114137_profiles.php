<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Profiles extends Migration
{
    public function up()
    {
        // Schema::dropIfExists('profiles');
        
        // Schema::create('profiles', function (Blueprint $table) {
        //     $table->bigIncrements('id');
        //     $table->bigInteger('user_id')->unsigned();
        //     $table->text('phone')->nullable();
        //     $table->integer('status')->default(1);
        //     $table->timestamps();
        // });
    }

    public function down()
    {
        // Schema::dropIfExists('profiles');
    }
}
