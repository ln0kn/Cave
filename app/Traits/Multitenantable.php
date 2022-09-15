<?php
namespace App\Traits;

use Illuminate\Database\Eloquent\Builder;
use Auth;
trait Multitenantable {

  protected static function bootMultitenantable()
  {
    // dd(' ');
    if (auth()->check()) {
      static::creating(function ($model) {
        $model->users_id = auth()->id();
      });
    }
  }

}
