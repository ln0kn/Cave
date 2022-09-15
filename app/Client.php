<?php

namespace App;
use App\Traits\Multitenantable;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Client extends Model implements Auditable
{
  use Multitenantable;
  use \OwenIt\Auditing\Auditable;
  use SoftDeletes;
  protected $dates = ['deleted_at'];

  public function type()
    {
        return $this->belongsTo('App\ClientTypes','clientTypes_id')->withTrashed();
    }

  public function compte()
    {
        return $this->belongsTo('App\ClientCompte','clients_id')->withTrashed();
    }
}
