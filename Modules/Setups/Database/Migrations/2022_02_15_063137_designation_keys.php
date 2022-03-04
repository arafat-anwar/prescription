<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DesignationKeys extends Migration
{
    public function up()
    {
        // Schema::table('users', function($table) {
        //    $table->foreign('designation_id')->references('id')->on('designations')->onDelete('restrict')->onUpdate('cascade');
        // });
    }

    public function down()
    {
        //
    }
}
