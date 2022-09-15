<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFournisseursTable extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up()
  {
    Schema::create('fournisseurs', function (Blueprint $table) {
      $table->increments('id');
      $table->string('nomFournisseurs');
      $table->string('emailFournisseurs')->nullable();

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
    Schema::dropIfExists('fournisseurs');
  }
}
