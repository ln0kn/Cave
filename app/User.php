<?php

namespace App;
// use App\Traits\Multitenantable;
use OwenIt\Auditing\Contracts\Auditable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements Auditable
{
  use \OwenIt\Auditing\Auditable;
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'username', 'email', 'password','droit','autorisation','enrolle_id'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
 
    public function enrolle() {
      return $this->belongsTo( 'App\Enrollement' );
    }

    public function routeNotificationForMail()
    {
        return 'mad9368@laravel.com';
    }
}
