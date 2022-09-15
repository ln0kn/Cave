<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProduitVentesTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up()
  {
    Schema::create('produit_ventes', function (Blueprint $table) {
      $table->increments('id');
      $table->integer('prixUnitaireProduitVentes');
      $table->integer('quantiteProduitVentes');
      $table->integer('prixTotalProduitVentes');
      $table->integer('conditionnement')->comment('12 pack ,6 demi pack ,1 bouteille');


      $table->integer('users_id')->unsigned() ;
      $table->foreign('users_id')->references('id')->on('users');
      $table->integer('produits_id')->unsigned();
      $table->foreign('produits_id')->references('id')->on('produits');
      $table->integer('ventes_id')->unsigned();
      $table->foreign('ventes_id')->references('id')->on('ventes');


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
    Schema::dropIfExists('produit_ventes');
  }
}
