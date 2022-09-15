<?php

namespace App;
use App\Traits\Multitenantable;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Poste extends Model implements Auditable
{
  use \OwenIt\Auditing\Auditable;
  use SoftDeletes;
  protected $dates = ['deleted_at'];

}
