<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRebutsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rebuts', function (Blueprint $table) {
            $table->increments('id');
            $table->string('identifiantVentes');
            $table->integer('conditionnementRebuts');
            $table->integer('quantiteRebuts');

            $table->integer('users_id')->unsigned()->nullable();
            $table->foreign('users_id')->references('id')->on('users');
            $table->integer('produits_id')->unsigned();
            $table->foreign('produits_id')->references('id')->on('produits');
            $table->integer('Ventes_id')->unsigned();
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
        Schema::dropIfExists('rebuts');
    }
}
