<?php

namespace App\Http\Controllers;
use App\Produit;
use App\Remise;
use App\Prix;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class RemiseController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('permission');
        // $this->middleware('admin');
    }


  public function index(){
    return view('Mes_vues.Remises');
  }

  // renvoier la liste des produits non desactiver aux vues prix
  public function getProduitPrix(){
    $produits = Produit::all();
    $tab = [];

    foreach ($produits as $key => $value) {
      $tab[$key]['id'] = $value ->id;
      $tab[$key]['text'] = $value -> designationProduits;
    }
    return $tab;
  }

  public function getPrix(){
    $prix = Prix::all();
    $tab = [];
    foreach ($prix as $key => $val) {
      $val -> types -> designationClientTypes;
      $val -> produits;
    }
    return $prix;
  }

  public function addPrix(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'clientTypes' => 'required|integer',
      'produits.*' => 'required|integer',
      'produitPrix' => 'required|integer',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    foreach ($request['produits'] as $key => $value) {

      $prix= new Prix();
      $prix -> client_types_id = $request['clientTypes'];
      $prix -> produits_id = $value;
      $prix -> produitPrix = $request['produitPrix'];
      $prix -> save();

    }

    return $prix;
  }

  public function updatePrix(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'idPrix' => 'required|integer',
      'clientTypes' => 'required|integer',
      'produits.*' => 'required|integer',
      'produitPrix' => 'required|integer',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }
    if(count($request['produits']) > 1)
    return response()->json(['fail' =>true,'errors' =>[['veuillez choisir un seul produit.']]]);


    foreach ($request['produits'] as $key => $value) {
      $prix= Prix::find($request['idPrix']);
      $prix -> client_types_id = $request['clientTypes'];
      $prix -> produits_id = $value;
      $prix -> produitPrix = $request['produitPrix'];
      $prix -> save();
    }


    return $prix;
  }

  public function deletePrix(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'idPrix' => 'required|integer',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $prix = Prix::find($request['idPrix']);
    $prix -> delete();

    return $prix;
  }

  public function addRemises(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'data.*.valeurRemises' => 'required|integer',
      'data.*.applicationRemises' => 'required|integer',
      'data.*.seuilMinimumRemises' => 'required|integer',
      'data.*.seuilMaximumRemises' => 'required|integer',
      'data.*.designationRemises' => 'required|unique:remises,designationRemises',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $data = $request['data'];
    foreach ($data as $key => $value) {
      $remise= new Remise();
      $remise -> designationRemises = $value['designationRemises'];
      $remise -> pourcentageRemises = $value['valeurRemises'];
      $remise -> minimumAchatRemises = $value['seuilMinimumRemises'] ;
      $remise -> maximumAchatRemises =  $value['seuilMaximumRemises'] ;
      $remise -> typeRemises =  $value['applicationRemises'] ;
      $remise -> save();
    }


    return $remise;
  }

  public function getRemises(){
    $remises = Remise::all();
    return $remises;
  }

  public function updateRemises(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'data.*.valeurRemises' => 'required|integer',
      'data.*.applicationRemises' => 'required|integer',
      'data.*.idRemises' => 'required|integer',
      'data.*.seuilMinimumRemises' => 'required|integer',
      'data.*.seuilMaximumRemises' => 'required|integer',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $data = $request['data'];
    if(count($data) == 1)

    foreach ($data as $key => $value) {
      $remise= Remise::find($value['idRemises']);
      $remise -> designationRemises = $value['designationRemises'];
      $remise -> pourcentageRemises = $value['valeurRemises'];
      $remise -> typeRemises= $value['applicationRemises'] ;
      $remise -> minimumAchatRemises = $value['seuilMinimumRemises'] ;
      $remise -> maximumAchatRemises = $value['seuilMaximumRemises'] ;
      $remise -> save();
    }
    else
    return response()->json(['fail' =>true,'errors' =>[['erreur  détectée']]]);

    return $remise;

  }

  public function deleteRemises(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'idRemises' => 'required|integer',
    ]);

    dd('ml');
    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }
    $remises = Remise::withTrashed()->where('id',$request['idRemises'])->first();

    if ($remises ->trashed()) {
      $remises -> restore();
    }else{
      $remises -> delete();
    }
    return $remises;
  }



}
