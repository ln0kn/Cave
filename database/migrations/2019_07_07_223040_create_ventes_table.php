<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVentesTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up()
  {
    Schema::create('ventes', function (Blueprint $table) {
      $table->increments('id');
      $table->string('identifiantVentes')->unique();
      $table->string('dateVentes');
      $table->string('nomClients')->nullable();
      $table->integer('sommePayer')->comment('montant facture avec la remise si y en a');
      $table->integer('sommeAPayer');
      $table->integer('sommeRestante');
      $table->string('infoVersement')->nullable()->comment('info sur le versement ,tel id virement bancaire');
      $table->integer('versement')->comment('entre cash , check, virement banquaire');
      $table->integer('montantVente')->comment('montant facture sans la remise');


      $table->integer('users_id')->unsigned() ;
      $table->foreign('users_id')->references('id')->on('users');

      $table->integer('remises_id')->unsigned()->nullable();
      $table->foreign('remises_id')->references('id')->on('remises');

      $table->integer('client_types_id')->unsigned();
      $table->foreign('client_types_id')->references('id')->on('client_types');

      $table->integer('clients_id')->unsigned()->nullable();
      $table->foreign('clients_id')->references('id')->on('clients');


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
    Schema::dropIfExists('ventes');
  }
}
