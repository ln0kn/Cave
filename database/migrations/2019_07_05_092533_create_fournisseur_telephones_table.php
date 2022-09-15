<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFournisseurTelephonesTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up()
  {
    Schema::create('fournisseur_telephones', function (Blueprint $table) {
      $table->increments('id');
      $table->integer('numeroFournisseurTelephone');

      $table->integer('fournisseurs_id')->unsigned();
      $table->foreign('fournisseurs_id')->references('id')->on('fournisseurs');

      $table->integer('users_id')->unsigned();
      $table->foreign('users_id')->references('id')->on('users');
      // $table->softDeletes();
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
    Schema::dropIfExists('fournisseur_telephones');
  }
}
