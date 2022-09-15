<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDonProduitsTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up()
  {
    Schema::create('don_produits', function (Blueprint $table) {
      $table->increments('id');
      $table->integer('quantiteProduitDons');
      $table->integer('conditionnement')->comment('12 pack ,6 demi pack ,1 bouteille');


      $table->integer('users_id')->unsigned();
      $table->foreign('users_id')->references('id')->on('users');

      $table->integer('produits_id')->unsigned()->nullable();
      $table->foreign('produits_id')->references('id')->on('produits');

      $table->integer('dons_id')->unsigned();
      $table->foreign('dons_id')->references('id')->on('dons');


      $table->integer('clients_id')->unsigned()->nullable();
      $table->foreign('clients_id')->references('id')->on('clients');

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
    Schema::dropIfExists('don_produits');
  }
}
