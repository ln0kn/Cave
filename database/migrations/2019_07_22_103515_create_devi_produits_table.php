<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDeviProduitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('devi_produits', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('prixUnitaireDevis');
            $table->integer('quantiteDevis');
            $table->integer('prixTotalDevis');
            $table->integer('conditionnement')->comment('12 pack ,6 demi pack ,1 bouteille');

            $table->integer('users_id')->unsigned()->nullable();
            $table->foreign('users_id')->references('id')->on('users');
            $table->integer('produits_id')->unsigned()->nullable();
            $table->foreign('produits_id')->references('id')->on('produits');
            $table->integer('devis_id')->unsigned()->nullable();
            $table->foreign('devis_id')->references('id')->on('devis');

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
        Schema::dropIfExists('devi_produits');
    }
}
