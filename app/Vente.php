<?php

namespace App;
use App\Traits\Multitenantable;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Vente extends Model implements Auditable
{
  use Multitenantable;
  use \OwenIt\Auditing\Auditable;
  use SoftDeletes;
  protected $dates = ['deleted_at'];


  public function produits()
    {
        return $this->hasMany('App\ProduitVente','ventes_id');
        // return $this->hasMany('App\ProduitVente','ventes_id')->withTrashed();
    } 

  public function remise()
    {
        return $this->belongsTo('App\Remise','remises_id')->withTrashed();
    }

    public function stock()
      {
          return $this->hasMany('App\Stock','ventes_id')->withTrashed();
      }

    public function caisse()
      {
          return $this->hasMany('App\Caisse','ventes_id')->withTrashed();
      }

      public function vendeur()
      {
          return $this->belongsTo('App\User','users_id');
      }

    public function clientCompte()
      {
          return $this->hasMany('App\ClientCompte','ventes_id')->withTrashed();
      }

}
