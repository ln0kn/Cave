<?php

namespace App;
use App\Traits\Multitenantable;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Devi extends Model implements Auditable
{
  use Multitenantable;
  use \OwenIt\Auditing\Auditable;
  use SoftDeletes;
  protected $dates = ['deleted_at'];

}
