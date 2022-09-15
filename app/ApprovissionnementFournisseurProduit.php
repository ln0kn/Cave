<?php

namespace App;
use App\Traits\Multitenantable;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class ApprovissionnementFournisseurProduit extends Model implements Auditable
{
  use Multitenantable;
  use \OwenIt\Auditing\Auditable;
  use SoftDeletes;
  protected $dates = ['deleted_at'];

    protected $table = 'approvissionnement_produits';

    public function fournisseurs()
    {
        return $this->belongsTo(Fournisseur::class);
        // return $this->belongsToMany(,'fournisseurs_id','produits_id');
    }

    public function prods()
    {
        return $this->belongsTo(Produit::class,'produits_id');
        // return $this->belongsToMany(,'fournisseurs_id','produits_id');
    }
}
