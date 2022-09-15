<?php

namespace App;
use App\Traits\Multitenantable;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Prix extends Model implements Auditable
{
  use Multitenantable;
  use \OwenIt\Auditing\Auditable;
  use SoftDeletes;
  protected $dates = ['deleted_at'];

  public function produits()
    {
        return $this->belongsTo('App\Produit')->withTrashed();
    }

    public function types()
      {
          return $this->belongsTo('App\ClientTypes','client_types_id')->withTrashed();
      }
}
