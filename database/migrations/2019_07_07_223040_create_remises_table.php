<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRemisesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('remises', function (Blueprint $table) {
            $table->increments('id');
            $table->string('designationRemises');
            $table->integer('pourcentageRemises');
            $table->integer('minimumAchatRemises');
            $table->integer('maximumAchatRemises');
            $table->integer('typeRemises')->comment('0 appli sur l montant,1 sur l nb achat ');

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
        Schema::dropIfExists('remises');
    }
}
