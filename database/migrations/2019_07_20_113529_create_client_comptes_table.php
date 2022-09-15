<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClientComptesTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */ 
  public function up()
  {
    Schema::create('client_comptes', function (Blueprint $table) {
      $table->increments('id');
      $table->integer('sommeActuel');
      $table->integer('sommeAnterieur');
      $table->integer('variation');
      $table->integer('typeVersement');
      $table->string('date');

      $table->integer('ventes_id')->unsigned()->nullable();
      $table->foreign('ventes_id')->references('id')->on('ventes');

      $table->integer('clients_id')->unsigned()->nullable();
      $table->foreign('clients_id')->references('id')->on('clients');

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
    Schema::dropIfExists('client_comptes');
  }
}
