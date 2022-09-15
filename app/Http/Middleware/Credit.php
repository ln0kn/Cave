<?php

namespace App\Http\Middleware;

use Closure;
use Auth;

class Credit
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
    if (Auth::check() && Auth::user()->autorisation != 3  ) {

      foreach ($request['data'] as $key => $value) {
        if($value['sommeRestante']  < 0){
          // dd($value);
          return response()->json([
            'credit' =>true,
          ]);
        }
      }

    }
    return $next($request);
    // else{
    //
    // }
  }
}
