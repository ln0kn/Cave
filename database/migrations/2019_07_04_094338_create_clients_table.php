<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateClientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clients', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nomClients');
            $table->integer('telephoneClients') -> nullable() -> unique();
            $table->string('emailClients') -> nullable ()-> unique();
            $table->integer('achatTotalClients') -> default(0);
            $table->integer('frequenceClients')-> default(0);

            $table->integer('clientTypes_id')->unsigned();
            $table->foreign('clientTypes_id')->references('id')->on('client_types');

            $table->integer('users_id')->unsigned();
            $table->foreign('users_id')->references('id')->on('users');

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
        Schema::dropIfExists('clients');
    }
}
