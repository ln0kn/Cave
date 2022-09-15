<?php

namespace App\Providers;

use Event;
use Log;
use Auth;
use Illuminate\Support\ServiceProvider;
// use App\Notifications\Stock;
use App\Notifications\Stock;
use App\Notifications\TaskStock;
use App\Produit;
use Notification;

class AppServiceProvider extends ServiceProvider
{
  /**
  * Bootstrap any application services.
  *
  * @return void
  */
  public function boot()
  {

    \App\Stock::saved(function ($model) {
      $produit = Produit::find($model['produits_id']);
      $user =Auth::user();
      // dd($model);

      if($produit['seuilAlerte'] >= $model['quantiteActuel']){
        try {
          Notification::send($user, new Stock($produit['designationProduits'],$model['quantiteActuel']));
        } catch(Exception $ex) {
          Log::info('Error'. $e->getMessage());
        }
      }
    });


  }

  /**
  * Register any application services.
  *
  * @return void
  */
  public function register()
  {
    //
  }
}
