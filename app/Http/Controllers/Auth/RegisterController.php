<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Enrollement;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('super');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {

        return Validator::make($data, [
            'username' => 'nullable|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
            'droit.*' => 'required|integer',
            'autorisation' => 'required|integer',
            'employe' => 'required|integer',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {

      $emp = Enrollement::find($data['employe']);
      $emp -> statut = 1;
      $emp -> save();

      $droit =0 ;
      foreach ($data['droit'] as $key => $value) {
        $droit +=$value;
      }

        $user = User::create([
            'username' => $data['username'],
            'email' => $data['email'],
            'droit' => $droit,
            'enrolle_id' => $data['employe'],
            'autorisation' => $data['autorisation'],
            'password' => bcrypt($data['password']),
        ]);
        return $user;
    }


    public function getUser(){
      // $tab;
      $user = User::all();
      foreach ($user as $key => $value) {
        // $tab[$key] = $value;
        $value -> enrolle -> nomEnrolle.' '.$value -> enrolle -> prenomEnrolle ;
      }
      return $user;
    }

    public function deleteUser(Request $request){
      $user = User::find($request['id']);
      $employe = Enrollement::find($user['enrolle_id']);
      if($user -> statut == 0){
        $user -> statut = 1;
        $employe -> statut = 0;

      }
      else{
        $user -> statut = 0;
        $employe -> statut = 0;

      }
      $user -> save();
      $employe -> save();

      return $user;
    }

    protected function updateUser(Request $request){
      $valide = $validator = Validator::make($request->all(), [
        'username' => 'required|',
        'email' => 'required|email',
        'droit.*' => 'required|integer',
        'autorisation' => 'required|integer',
        'password' => 'nullable|string|min:6|confirmed',
        ]);

      if ($valide->fails()) {
        return response()->json([
          'fail' =>true,
          'errors' => $valide->errors()
        ]);
      }

      $user = User::find($request['id']);
      $droit =0 ;
      foreach ($request['droit'] as $key => $value) {
        $droit +=$value;
      }
      if ($request['password']) {
        $user -> password = bcrypt($request['password']);
      }
      $user -> username = $request['username'];
      $user -> email = $request['email'];
      $user -> droit = $droit;
      $user -> autorisation = $request['autorisation'];
      $user -> enrolle_id  = $request['employe'];
      $user -> save() ;

      return $user;
    }

}
