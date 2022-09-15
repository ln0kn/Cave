<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProduitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('produits', function (Blueprint $table) {
            $table->increments('id');
            $table->String('designationProduits')->unique();
            $table->integer('seuilAlerte');

            $table->integer('famille_produits_id')->unsigned();
            $table->foreign('famille_produits_id')->references('id')->on('famille_produits');

            $table->integer('users_id')->unsigned();
            $table->foreign('users_id')->references('id')->on('users');

            $table->integer('marque_produits_id')->unsigned();
            $table->foreign('marque_produits_id')->references('id')->on('marque_produits');

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
        Schema::dropIfExists('produits');
    }
}
