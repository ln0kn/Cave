<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Poste;
use App\Enrollement;
use Illuminate\Support\Facades\Validator;

class EnrollementController extends Controller
{

  public function __construct()
  {
      $this->middleware('auth');
      $this->middleware('permission');
      // $this->middleware('admin');
  }

    public function index(){
      return view('Mes_vues.Enrollement');
    }

    public function addPostes(Request $request){
      $valide = $validator = Validator::make($request->all(), [
        'designationPostes' => 'required|unique:postes,designationPostes|string',
      ]);

      if ($valide->fails()) {
        return response()->json([
          'fail' =>true,
          'errors' => $valide->errors()
        ]);
      }

      $poste = new Poste ();
      $poste -> designationPostes =$request['designationPostes'];
      $poste -> save ();

      return $poste;
    }

    public function updatePostes(Request $request){
      $valide = $validator = Validator::make($request->all(), [
        'designationPostes' => 'required|string|unique:postes,designationPostes,'.$request['id'].',id,deleted_at,NULL',
      ]);

      if ($valide->fails()) {
        return response()->json([
          'fail' =>true,
          'errors' => $valide->errors()
        ]);
      }

      $poste = Poste::find($request['id']);
      $poste -> designationPostes = $request['designationPostes'];
      $poste -> save ();

      return $poste;
    }

    public function getPostes(){
      $poste = Poste::withTrashed()->get();
      return $poste;
    }



    public function deletePostes(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'id' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $poste = Poste::withTrashed()->where('id',$request['id'])->first();

      if ($poste ->trashed()) {
        $poste -> restore();
      }else{
        $poste -> delete();
      }
      return $poste;
    }

    //////////////////////////////////Enrolles
    //get poste available for enrolles
    public function getPosteEnrolles(){
      $tab = [];
      $poste = Poste::all();
      foreach ($poste as $key => $value) {
        $tab[$key]['id'] = $value -> id;
        $tab[$key]['text'] = $value -> designationPostes;
      }
      return $tab;
    }

    public function addEnrolles(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'nomEnrolles' => 'required|string',
      'prenomEnrolles' => 'required|string',
      'telephoneEnrolles' => 'required|integer|digits:8|unique:enrollements,telephoneEnrolle',
      'posteEnrolles' => 'required|integer',
      'sexeEnrolles' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $enrolle = new Enrollement();
      $enrolle -> nomEnrolle = $request['nomEnrolles'];
      $enrolle -> prenomEnrolle = $request['prenomEnrolles'];
      $enrolle -> telephoneEnrolle = $request['telephoneEnrolles'];
      $enrolle -> sexeEnrolle = $request['sexeEnrolles'];
      $enrolle -> postes_id = $request['posteEnrolles'];
      $enrolle -> save ();

      return $enrolle;
    }

    public function updateEnrolles(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'nomEnrolles' => 'required|string',
      'prenomEnrolles' => 'required|string',
      'telephoneEnrolles' => 'required|integer|unique:enrollements,telephoneEnrolle,'.$request['id'].',id,deleted_at,NULL',
      'posteEnrolles' => 'required|integer',
      'sexeEnrolles' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $enrolle = Enrollement :: find($request['id']);
      $enrolle -> nomEnrolle = $request['nomEnrolles'];
      $enrolle -> prenomEnrolle = $request['prenomEnrolles'];
      $enrolle -> telephoneEnrolle = $request['telephoneEnrolles'];
      $enrolle -> sexeEnrolle = $request['sexeEnrolles'];
      $enrolle -> postes_id = $request['posteEnrolles'];
      $enrolle -> save ();

      return $enrolle;
    }

    public function getEnrolles(){
      $enrolle = Enrollement::withTrashed()->get();
      foreach ($enrolle as $key => $value) {
        $value -> poste;
      }
      return $enrolle;
    }

    public function deleteEnrolles(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'id' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $Enrolle = Enrollement::withTrashed()->where('id',$request['id'])->first();

      if ($Enrolle ->trashed()) {
        $Enrolle -> restore();
      }else{
        $Enrolle -> delete();
      }
      return $Enrolle;
    }



}
