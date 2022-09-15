<?php

namespace App;
use App\Traits\Multitenantable;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class FournisseurProduit extends Model implements Auditable
{
  use Multitenantable;
  use \OwenIt\Auditing\Auditable;
    // protected $table ='fournisseur_produits';
}
