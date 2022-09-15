<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCreditsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('credits', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('sommeActuel');
            $table->integer('sommeAnterieur');
            $table->integer('variation');
            $table->integer('typeVersement');

            $table->integer('ventes_id')->unsigned()->nullable();
            $table->foreign('ventes_id')->references('id')->on('ventes');

            $table->integer('clients_id')->unsigned()->nullable();
            $table->foreign('clients_id')->references('id')->on('clients');

            $table->integer('versements_id')->unsigned()->nullable();
            $table->foreign('versements_id')->references('id')->on('versements');

            $table->integer('users_id')->unsigned();
            $table->foreign('users_id')->references('id')->on('users');

            $table->timestamps();
            //$table->timestamps('softDeletes');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('credits');
    }
}
