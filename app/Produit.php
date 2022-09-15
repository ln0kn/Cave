<?php

namespace App;
use App\Traits\Multitenantable;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Produit extends Model implements Auditable
{
  use Multitenantable;
  use \OwenIt\Auditing\Auditable;
  use SoftDeletes;
  protected $dates = ['deleted_at'];

  public function marque()
    {
        return $this->belongsTo('App\MarqueProduit','marque_produits_id')->withTrashed();
    }
  public function famille()
    {
        return $this->belongsTo('App\FamilleProduit','famille_produits_id')->withTrashed();
    }

    public function fournisseurs()
    {
        return $this->belongsToMany(Fournisseur::class,'fournisseur_produits','fournisseurs_id','produits_id');
        // return $this->belongsToMany(,'fournisseurs_id','produits_id');
    }

    public function stocks()
      {
          return $this->hasMany('App\Stock','produits_id')->latest();
      }

}
