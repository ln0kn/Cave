<?php

namespace App;

use App\Traits\Multitenantable;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Model;
//use Illuminate\Database\Eloquent\SoftDeletes;

class Credit extends Model implements Auditable
{
  use Multitenantable;
  use \OwenIt\Auditing\Auditable;
  //use SoftDeletes;
  /*protected $fillable = [
        'sommeActuel', 'sommeAnterieur', 'variation','typeVersement','ventes_id','clients_id','versements_id','users_id'
    ];*/
  //protected $dates = ['deleted_at'];


    public function client()
    {
        return $this->belongsTo(Client::class);
    }

}
