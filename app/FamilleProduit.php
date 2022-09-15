<?php

namespace App;
use App\Traits\Multitenantable;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class FamilleProduit extends Model implements Auditable
{
  use Multitenantable;
  use \OwenIt\Auditing\Auditable;
  use SoftDeletes;
  protected $dates = ['deleted_at'];

  public function produits()
    {
        return $this->hasMany('App\Produit','famille_produits_id')->withTrashed();
    }
}
