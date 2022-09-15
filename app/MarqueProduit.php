<?php

namespace App;
use App\Traits\Multitenantable;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MarqueProduit extends Model implements Auditable
{
  use \OwenIt\Auditing\Auditable;
  use SoftDeletes;
  use Multitenantable;
  protected $dates = ['deleted_at'];
  
}
