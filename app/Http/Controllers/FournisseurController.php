<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Validator;
use App\FournisseurTelephones;
use App\Fournisseur;
use App\Produit;
use Illuminate\Http\Request;

class FournisseurController extends Controller
{

  public function __construct()
  {
      $this->middleware('auth');
      $this->middleware('permission');
      // $this->middleware('admin');
  }

  public function index(){
    $produit = Produit::all();

    return view('Mes_vues.Fournisseurs') -> withProduits($produit);
  }

  public function getFournisseurs(){
    $fournisseurs = Fournisseur::withTrashed()-> get();
    $tab =[];

    foreach ($fournisseurs as $key => $value) {
      $tab[$key]=$value;
      $tabT='';
      foreach ($value -> telephones  as $val) {
        $tabT .= $val -> numeroFournisseurTelephone .', ';
      }
      $tabP='';
      // dd($value -> produits);
      foreach ($value -> produits  as $val) {
        $tabP.= $val -> designationProduits .', ';
      }
      $tabT = substr($tabT,0,15);
      $tabP = substr($tabP,0,15);
      $tab[$key]['tel']=$tabT.' ...' ;
      $tab[$key]['pro']=$tabP.' ...' ;
    }

    return $tab;
  }

  //fn utiliser pour ajouter  un nouveau fournisseur
  public function addFournisseurs(Request $request){
    $valide = $validator = Validator::make($request->all(), [
    'emailFournisseurs' => 'nullable|email|unique:fournisseurs,emailFournisseurs',
    'data.nomFournisseurs' => 'required|string',
    'produitFournisseurs.*' => 'required|integer',
    'telephoneFournisseurs.*' => 'required|digits:8|integer|unique:fournisseurs',
    ]);

    if ($valide->fails()) {
      return response()->json([
      'fail' =>true,
      'errors' => $valide->errors()
      ]);
    }
    // dd($request['data']);
    $fournisseur = new Fournisseur();
    $fournisseur -> nomFournisseurs  = $request['data']['nomFournisseurs'];
    $fournisseur -> emailFournisseurs = $request['data']['emailFournisseurs'];
    $fournisseur -> save ();


    // enregistrer les produits vendu par le fournisseur
    $fournisseur->produits()->attach($request['data']['produitFournisseurs']);

    // enregistrer les numeros de telephone du fournisseur
    // enregistrements des numero de telephone
    $nums = $request['data']['telephoneFournisseurs'];
    foreach ($nums as $num) {
        $tel = new FournisseurTelephones();
        $tel ->numeroFournisseurTelephone = $num;
        $tel ->fournisseurs_id =  $fournisseur -> id;
        $tel -> save();
      }

    return $fournisseur;
  }


  //fn utiliser pour modifier un fournisseur
  public function updateFournisseurs(Request $request){
    $valide = Validator::make($request->all(), [
    // 'data.emailFournisseurs' => 'nullable|email|unique:fournisseurs,emailFournisseurs,'.$request['idFournisseurs'].',id,deleted_at,NULL',
    'data.idFournisseurs' => 'required|integer',
    // 'data.nomFournisseurs' => 'required|unique:fournisseurs,nomFournisseurs,'.$request['idFournisseurs'].',id,deleted_at,NULL',
    'data.produitFournisseurs.*' => 'required|integer',
    'data.telephoneFournisseurs.*' => 'required|digits:8|integer',
    ]);

    if ($valide->fails()) {
      return response()->json([
      'fail' =>true,
      'errors' => $valide->errors()
      ]);
    }

    dd(' ');
    $fournisseur = Fournisseur ::find($request['data']['idFournisseurs']);
    $fournisseur -> nomFournisseurs  = $request['data']['nomFournisseurs'];
    $fournisseur -> emailFournisseurs = $request['data']['emailFournisseurs'];
    $fournisseur -> save();

    $fournisseur -> telephones ()->delete();
    // enregistrer les numeros de telephone du fournisseur
    // enregistrements des numero de telephone
    $nums = $request['data']['telephoneFournisseurs'];
    foreach ($nums as $num) {
        $tel = new FournisseurTelephones();
        $tel ->numeroFournisseurTelephone = $num;
        $tel ->fournisseurs_id =  $fournisseur -> id;
        $tel -> save();
      }
      // enregistrer les produits vendu par le fournisseur
        $fournisseur->produits()->sync($request['data']['produitFournisseurs']);


        return $fournisseur;




  }

  //function use to desactiver ou activer unFournisseur
  public function deleteFournisseurs(Request $request){
    $valide = $validator = Validator::make($request->all(), [
    'idFournisseurs' => 'required|integer',
    ]);

    if ($valide->fails()) {
      return response()->json([
      'fail' =>true,
      'errors' => $valide->errors()
      ]);
    }

    $fournisseurs = Fournisseur::withTrashed()->where('id',$request['idFournisseurs'])->first();

    if ($fournisseurs ->trashed()) {
      $fournisseurs -> restore();
    }else{
      $fournisseurs -> delete();
    }
    return $fournisseurs;
  }



}
