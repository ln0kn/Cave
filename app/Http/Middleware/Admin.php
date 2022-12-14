<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class admin
{
  /**
  * Handle an incoming request.
  *
  * @param  \Illuminate\Http\Request  $request
  * @param  \Closure  $next
  * @return mixed
  */
  public function handle($request, Closure $next)
  {
    if (Auth::check() && Auth::user()->autorisation != '1') {
      return $next($request);
    }

    abort(401, "A Custom Exception Message");
  }
}
