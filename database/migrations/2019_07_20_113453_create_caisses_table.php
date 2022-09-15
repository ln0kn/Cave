<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCaissesTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up()
  {
    Schema::create('caisses', function (Blueprint $table) {
      $table->increments('id');
      $table->integer('typeVersment');
      $table->integer('SommeAnterieurCaisse');
      $table->integer('sommeActuelCaisse');
      $table->integer('VariatioCaisse');
      $table->string('dateOperation');


      $table->integer('ventes_id')->unsigned()->nullable();
      $table->foreign('ventes_id')->references('id')->on('ventes');

      $table->integer('versements_id')->unsigned()->nullable();
      $table->foreign('versements_id')->references('id')->on('versements');

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
    Schema::dropIfExists('caisses');
  }
}
