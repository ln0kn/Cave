<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateApprovissionnementFournisseurProduitsTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up()
  {
    Schema::create('approvissionnement_produits', function (Blueprint $table) {
      $table->increments('id');
      $table->integer('prixUnitaire')->nullable();
      $table->integer('quantite');
      $table->integer('prixTotal');
      $table->integer('conditionnement')->comment('12 pack ,6 demi pack ,1 bouteille');

      $table->integer('fournisseurs_id')->unsigned();
      $table->foreign('fournisseurs_id')->references('id')->on('fournisseurs');

      $table->integer('produits_id')->unsigned();
      $table->foreign('produits_id')->references('id')->on('produits');

      $table->integer('approvissionnements_id')->unsigned();
      $table->foreign('approvissionnements_id')->references('id')->on('approvissionnements');

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
    Schema::dropIfExists('approvissionnement_fournisseur_produits');
  }
}
