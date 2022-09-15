<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFournisseurProduitsTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up()
  {
    Schema::create('fournisseur_produits', function (Blueprint $table) {
      $table->increments('id');

      $table->integer('fournisseurs_id')->unsigned()->nullable();
      $table->foreign('fournisseurs_id')->references('id')->on('fournisseurs');

      $table->integer('produits_id')->unsigned()->nullable();
      $table->foreign('produits_id')->references('id')->on('produits');

      // $table->integer('users_id')->unsigned();
      // $table->foreign('users_id')->references('id')->on('users');

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
    Schema::dropIfExists('fournisseur_produits');
  }
}
