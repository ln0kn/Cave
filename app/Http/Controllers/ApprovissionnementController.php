<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Validator;
use App\FournisseurTelephones;
use App\Produit;
use App\Fournisseur;
use App\Stock;
use App\ApprovissionnementFournisseurProduit;
use App\Approvissionnement;

use Illuminate\Http\Request;

class ApprovissionnementController extends Controller
{


  public function __construct()
  {
      $this->middleware('auth');
      $this->middleware('permission');
      $this->middleware('admin');
      // $this->middleware('super');

  }



  public function index(){
    $fournisseurs = Fournisseur::all();
    return view('Mes_vues.Approvissionnements') ->withFournisseurs($fournisseurs);
  }

  public function getFournisseurProduits(Request $request){
    $fournisseurs = Fournisseur::find($request['idFournisseurs']);
    $tab = [];
    foreach ($fournisseurs -> produits as $key => $value) {
      $tab[$key]['id']=  $value -> id;
      $tab[$key]['text']=  $value -> designationProduits;
    }

    return $tab;
  }


  public function addApprovissionnements(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'data' => 'required',
      'data.*.fournisseurApprovissionnements' => 'required|integer',
      'data.*.produitApprovissionnements' => 'required|integer',
      'data.*.quantiteApprovissionnements' => 'required|integer',
      'data.*.prixUnitaireApprovissionnements' => 'nullable|integer',
      'data.*.conditionnement' => 'required|integer',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }


    $timestamp = strtotime(now());
    $day = date('d', $timestamp);
    $month = date('m', $timestamp);
    $year = date('y', $timestamp);
    $results = Approvissionnement::withTrashed()->latest('id')->first();

    $results = 'App/'.$day.'/'.$month.'/'.$year.'/'.(($results)?$results['id']+1:1);

    $approvissionnements = new Approvissionnement();
    $approvissionnements -> date = now();
    $approvissionnements -> identifiant = $results;
    $approvissionnements -> save();

    $data = $request['data'];
    foreach ($data as $key => $value) {
      $appProduit = new ApprovissionnementFournisseurProduit ();
      $appProduit -> prixUnitaire = $value['prixUnitaireApprovissionnements'];
      $appProduit -> quantite = $value['quantiteApprovissionnements'];
      $appProduit -> prixTotal = ($value['prixUnitaireApprovissionnements']? $value['prixUnitaireApprovissionnements']:1) * $value['quantiteApprovissionnements'];
      $appProduit -> fournisseurs_id = $value['fournisseurApprovissionnements'];
      $appProduit -> produits_id = $value['produitApprovissionnements'];
      $appProduit -> conditionnement = $value['conditionnement'];
      $appProduit -> approvissionnements_id = $approvissionnements -> id;
      $appProduit -> save();

      //savoir si le produit existe en stock
      // $stock::where('produit_id',$value['produitApprovissionnements']) -> where('quantiteActuel',' >',0) -> get();
      $qte = Stock::where('produits_id',$value['produitApprovissionnements']) -> latest('id')->first();

      //adding in the stock
      $stock = new Stock ();
      $stock -> quantiteAnterieur = ($qte) ? $qte['quantiteActuel'] : 0;
      $stock -> quantiteActuel = ($qte)? $qte['quantiteActuel'] + ($value['quantiteApprovissionnements'] * $value['conditionnement']):($value['quantiteApprovissionnements'] * $value['conditionnement']);
      $stock -> variationQuantite = $value['quantiteApprovissionnements'] * $value['conditionnement'];
      $stock -> dateApprovissionnement = now();
      $stock -> produits_id = $value['produitApprovissionnements'];
      $stock -> approvissionnements_id = $approvissionnements -> id;
      $stock -> save();

    }

    return $approvissionnements;
  }


  public function updateApprovissionnements(Request $request){
    $valide = Validator::make($request->all(), [
      'data.*.conditionnement' => 'required|integer',
      'data.*.fournisseurApprovissionnements' => 'required|integer',
      'data.*.produitApprovissionnements' => 'required|integer',
      'data.*.quantiteApprovissionnements' => 'required|integer',
      'data.*.prixUnitaireApprovissionnements' => 'nullable|integer',
      'data.*.idApprovissionnements' => 'required|integer',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $next = true;
    $tab = [];

    $data = $request['data'];
    foreach ($data as $key => $value) {
      if($next){
        $app = Approvissionnement::find($value['idApprovissionnements']);
        $app -> produits() ->delete ();
        $app -> stock() ->delete ();
        $next = false;
      }

      $appProduit = new ApprovissionnementFournisseurProduit ();
      $appProduit -> prixUnitaire = $value['prixUnitaireApprovissionnements'];
      $appProduit -> quantite = $value['quantiteApprovissionnements'];
      $appProduit -> prixTotal = ($value['prixUnitaireApprovissionnements']? $value['prixUnitaireApprovissionnements']:1) * $value['quantiteApprovissionnements'];
      $appProduit -> fournisseurs_id = $value['fournisseurApprovissionnements'];
      $appProduit -> conditionnement = $value['conditionnement'];
      $appProduit -> produits_id = $value['produitApprovissionnements'];
      $appProduit -> approvissionnements_id = $value['idApprovissionnements'];
      $appProduit -> save();

      //get stock a modifier
      $st = Stock::withTrashed()-> where('approvissionnements_id',$value['idApprovissionnements'])->where('produits_id',$value['produitApprovissionnements'])-> latest('id')->first();
      // dd($st);

      $qte = Stock::where('produits_id',$value['produitApprovissionnements']) -> latest('id')->first();
      // dd($qte);
      // $tab[$value['produitApprovissionnements']] = $qte['quantiteActuel']  - $st['variationQuantite'] + $value['quantiteApprovissionnements'];;
      // $tab[$value['produitApprovissionnements']]['a'] =($qte)?$qte['quantiteAnterieur']:0  ;
      // $tab[$value['produitApprovissionnements']]['f'] =($qte)? $qte['quantiteActuel'] :0 ;
      // $tab[$value['produitApprovissionnements']]['d'] = ($qte)? $qte['quantiteActuel']  - $st['variationQuantite'] :0;
      // $tab[$value['produitApprovissionnements']]['e'] = ($qte)? $qte['quantiteActuel']  - $st['variationQuantite'] + $value['quantiteApprovissionnements'] : 0;
      // $tab[$value['produitApprovissionnements']]['b'] = $st['variationQuantite'] ;
      // $tab[$value['produitApprovissionnements']]['c'] = $value['quantiteApprovissionnements'];

      // dd($qte);
      //adding in the stock
      $stock = new Stock ();
      $stock -> quantiteAnterieur = ($qte)? $qte['quantiteActuel'] : 0;
      $stock -> quantiteActuel = ($qte)? $qte['quantiteActuel']  - $st['variationQuantite'] +($value['quantiteApprovissionnements'] * $value['conditionnement']) : $value['quantiteApprovissionnements'] * $value['conditionnement'];
      $stock -> variationQuantite = ($value['quantiteApprovissionnements'] * $value['conditionnement']);
      $stock -> dateApprovissionnement = now();
      $stock -> produits_id = $value['produitApprovissionnements'];
      $stock -> approvissionnements_id = $value['idApprovissionnements'];
      $stock -> save();

    }

    return $stock;
    // return $tab;
    // return $app;

  }

  public function getApprovissionnements(Request $request){
    $tab=[];
    $app = Approvissionnement::all();
    foreach ($app as $key => $val) {
      $val -> produits;
      // dd($val -> produits() )  );
      foreach ($val -> produits  as   $value) {

        $value -> fournisseurs;
        $value -> prods ;
      }
    }

    return $app;
  }

  public function deleteApprovissionnements(Request $request){
    $valide = Validator::make($request->all(), [
      'idApprovissionnements' => 'required|integer',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $app = Approvissionnement::find($request['idApprovissionnements']);
    //ajusteer approvissionnement produit
    foreach ( $app -> stock as $key => $value) {
      //savoir si le produit existe en stock
      $qte = Stock::where('produits_id',$value['produits_id']) -> latest('id')->first();

      // dd($value);
      // dd($qte);
      $stock = new Stock ();
      $stock -> quantiteAnterieur = $qte['quantiteActuel'];
      $stock -> quantiteActuel = $qte['quantiteActuel'] - $value['variationQuantite'];
      $stock -> variationQuantite = $value['variationQuantite'];
      $stock -> dateApprovissionnement = now();
      $stock -> produits_id = $value['produits_id'];
      $stock -> approvissionnements_id = $value['idApprovissionnements'];
      $stock -> save();

    }

    $app -> stock() -> delete();
    $app -> produits () ->delete ();
    $app -> delete ();

    return $app;
  }

}
