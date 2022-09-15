<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStocksTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up()
  {
    Schema::create('stocks', function (Blueprint $table) {
      $table->increments('id');
      $table->integer('quantiteAnterieur');
      $table->integer('quantiteActuel');
      $table->integer('variationQuantite');
      $table->integer('quantitePhysique')->nullable();
      $table->string('dateApprovissionnement');

      $table->integer('produits_id')->unsigned();
      $table->foreign('produits_id')->references('id')->on('produits');

      $table->integer('users_id')->unsigned();
      $table->foreign('users_id')->references('id')->on('users');

      $table->integer('approvissionnements_id')->nullable()->unsigned();
      $table->foreign('approvissionnements_id')->references('id')->on('approvissionnements');

      $table->integer('rebuts_id')->nullable()->unsigned();
      $table->foreign('rebuts_id')->references('id')->on('rebuts');

      $table->integer('dons_id')->nullable()->unsigned();
      $table->foreign('dons_id')->references('id')->on('dons');


      $table->integer('ventes_id')->nullable()->unsigned();
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
    Schema::dropIfExists('stocks');
  }
}
