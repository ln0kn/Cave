<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVersementsTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up()
  {
    Schema::create('versements', function (Blueprint $table) {
      $table->increments('id');
      $table->integer('montantVersement');
      $table->string('dateVersements');
      $table->integer('typeVersements_id');
      $table->string('infoVerseur');

      $table->integer('clients_id')->unsigned()->nullable();
      $table->foreign('clients_id')->references('id')->on('clients');

      $table->integer('users_id')->unsigned();
      $table->foreign('users_id')->references('id')->on('users');

      $table->softDeletes();
      $table->timestamps();
    });
  }

  /**
  * Reverse the migrations.
  *
  * @return void
  */
  public function down()
  {
    Schema::dropIfExists('versements');
  }
}
