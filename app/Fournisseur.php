<?php

namespace App;
use App\Traits\Multitenantable;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Fournisseur extends Model implements Auditable
{
  use Multitenantable;
  use \OwenIt\Auditing\Auditable;

  use SoftDeletes;
  protected $dates = ['deleted_at'];

  public function produits()
  {
      return $this->belongsToMany('App\Produit','fournisseur_produits','fournisseurs_id','produits_id');
      // return $this->belongsToMany(FournisseurProduit::class,'fournisseur_produits','fournisseurs_id','produits_id');
  }

  public function telephones()
    {
        return $this->hasMany('App\FournisseurTelephones','fournisseurs_id');
    }


}
