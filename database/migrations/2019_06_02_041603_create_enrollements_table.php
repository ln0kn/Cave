<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEnrollementsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('enrollements', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nomEnrolle');
            $table->string('prenomEnrolle');
            $table->integer('telephoneEnrolle');
            $table->integer('sexeEnrolle');
            $table->integer('statut')->default(0)->comment('0 non user ,1 users');
            $table->integer('users_id')->nullable();

            $table->integer('postes_id')->unsigned();
            $table->foreign('postes_id')->references('id')->on('postes');


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
        Schema::dropIfExists('enrollements');
    }
}
