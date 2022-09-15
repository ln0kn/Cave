<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClotureJourneesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cloture_journees', function (Blueprint $table) {
            $table->increments('id');
            $table->string('idenfiantClotures')->unique();
            $table->string('dateJourneeClotures');

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
        Schema::dropIfExists('cloture_journees');
    }
}
