<?php

namespace App\Http\Middleware;

use Closure;
use Auth;
class Permission
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

    if ($request->method() == 'GET') {
      return $next($request);
    } else {
      switch (Auth::user()->droit) {
        case 1:
        // dd($request['data']);
        if ($request->method() == 'POST') {
          return $next($request);
        } else {
          return response()->json([
            'accredidation' =>true,
          ]);
        }
        break;
        case 2:
        if ($request->method() == 'PUT') {
          return $next($request);
        } else {
          return response()->json([
            'accredidation' =>true,
          ]);
        }
        break;

        case 3:
        if ($request->method() == 'PUT' || $request->method() =='POST') {
          return $next($request);
        } else {
          return response()->json([
            'accredidation' =>true,
          ]);
        }
        break;

        case 4:
        if ($request->method() == 'DELETE') {
          return $next($request);
        } else {
          return response()->json([
            'accredidation' =>true,
          ]);
        }
        break;

        case 5:
        if ($request->method() == 'DELETE' || $request->method() =='POST') {
          return $next($request);
        } else {
          return response()->json([
            'accredidation' =>true,
          ]);
        }
        break;

        case 6:
        if ($request->method() == 'DELETE' || $request->method() =='PUT') {
          return $next($request);
        } else {
          return response()->json([
            'accredidation' =>true,
          ]);
        }
        break;

        case 8:
        if ($request->method() == 'DELETE' || $request ->method() == 'PUT' || $request->method() =='POST') {
          return $next($request);
        } else {
          return response()->json([
            'accredidation' =>true,
          ]);
        }
        break;

      }
    }

    return $next($request);
  }
}
