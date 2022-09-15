<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('username')->nullable()->unique();
            $table->string('email')-> unique();
            $table->string('password');
            $table->integer('droit')-> comment('1 ajout , 2 modif , 4 desactiver');
            $table->integer('autorisation');
            $table->integer('statut') ->default(0)-> comment('0 pour actif , 1 pour inactif');

            $table->integer('enrolle_id')->unsigned();
            $table->foreign('enrolle_id')->references('id')->on('enrollements');

            $table->rememberToken();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
