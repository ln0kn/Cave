<?php

namespace App\Http\Controllers;
 
use Illuminate\Http\Request;
use App\Stock;
use App\Don;
use App\DonProduit;
use App\Caisse;
use App\Credit;
use App\Client;
use App\ClientCompte;
use App\Versement;
use App\FamilleProduit;
use DB;
use Illuminate\Support\Facades\Validator;
class AutreController extends Controller
{

  public function __construct()
  {
      $this->middleware('auth');
      $this->middleware('permission');
      // $this->middleware('admin');
  }


  public function index(){
    $client = Client::all();
    $famille = FamilleProduit::all();
    return view('Mes_vues.Autres') -> withClients($client) -> withFamilles($famille);
  }


  public function addVersements(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'client' => 'required|integer',
      'typeVersements' => 'required|integer',
      'montantVersements' => 'required|integer',
      'infoVersements' => 'nullable|string',

    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $vers = new Versement();
    $vers -> dateVersements = now();
    $vers -> montantVersement = $request['montantVersements'];
    $vers -> typeVersements_id = $request['typeVersements'];
    $vers -> infoVerseur = $request['infoVersements'];
    $vers -> clients_id = $request['client'];
    $vers -> save();

    $lastCa = Caisse::latest('id')->first();
    // dd($lastCa);
    ///ajouter la somme verser dans la caisse
    $caisse = new Caisse();
    $caisse -> sommeAnterieurCaisse  = $lastCa['sommeActuelCaisse'];
    $caisse -> sommeActuelCaisse  = $lastCa['sommeActuelCaisse'] + $request['montantVersements'];
    $caisse -> variatioCaisse = $request['montantVersements'];
    $caisse -> dateOperation = now ();
    $caisse -> versements_id = $vers -> id ;
    $caisse -> typeVersment = $request['typeVersements'] ;
    $caisse ->  save();


  

    //notifier le versement
    $cred = Credit::where('clients_id',$request['client'])->latest('id')->first();
    //printf($cred);
    $cre = new Credit();
    $cre -> sommeActuel = ($cred) ? $cred['sommeActuel'] - $request['montantVersements']: $request['montantVersements'];
    $cre -> sommeAnterieur = ($cred)? $cred['sommeActuel'] : 0;
    $cre -> variation = $request['montantVersements'];
    $cre -> typeVersement = $request['typeVersements'];
    $cre -> versements_id = $vers -> id ;
    $cre -> clients_id = $request['client'];
    $cre -> save();


    return $vers ;
  }


  public function getVersements(){
    $vers = Versement::all();
    foreach ($vers as $key => $value) {
      $value -> client;
    }

    return $vers;
  }


  public function getCredits(){

    $i = 0;
    $tab = [];
    $tab2 = [];
    $cred = DB::table('clients')
    // ->select('agence_numeros.id', 'raisonSocial', 'agence_numeros.indirect_id', 'cnibPartenaire', 'numeroAgent')
    ->join('credits', 'credits.clients_id', '=', 'clients.id')
    -> get();
    //dd($cred);

    foreach ($cred as $key => $val) {
      $tab[$val -> clients_id]= $val ;
    }

    foreach ($tab as $key => $value) {
      $tab2[$i] = $value;
      $i++;
    }

    return $tab2;
  }


  public function addDons(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'data.*.familleProduit' => 'required|integer',
      'data.*.produitVentes' => 'required|integer',
      'data.*.quantiteVentes' => 'required|integer',
      'data.*.client' => 'required|integer',
      'data.*.conditionnementVentes' => 'required|integer',
      'data.*.mtn' => 'required|string',

    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $next = true;
    $timestamp = strtotime(now());
    $day = date('d', $timestamp);
    $month = date('m', $timestamp);
    $year = date('y', $timestamp);
    $results = Don::withTrashed()->latest('id')->first();




    foreach ($request['data'] as $key => $val) {
      //verifier si le stock est suffisant pour le don
      $stock = Stock::where('produits_id',$val['produitVentes'])-> latest('id')->first();
      if($stock['quantiteActuel'] >= $val['quantiteVentes']*$val['conditionnementVentes'] ){

        if($next){
          $results = 'Don/'.$day.'/'.$month.'/'.$year.'/'.(($results)?$results['id']+1:1);
          $don = new Don ();
          $don -> identifiantDons = $results;
          $don -> dateDons = now();
          $don -> save();

          $next = false;
        }

        $produit = new DonProduit ();
        $produit -> quantiteProduitDons = $val['quantiteVentes'] ;
        $produit -> conditionnement = $val['conditionnementVentes'] ;
        $produit -> clients_id = $val['client'] ;
        $produit -> produits_id = $val['produitVentes'] ;
        $produit -> dons_id = $don -> id ;
        $produit ->  save();

        //diminuer le stock de la quantite a diminuer
        $stocks = new Stock();
        $stocks -> quantiteAnterieur = $stock['quantiteActuel'];
        // $stocks -> quantiteAnterieur = $stock['quantiteActuel'];
        $stocks -> quantiteActuel = $stock['quantiteActuel'] - ($val['quantiteVentes']*$val['conditionnementVentes']);
        $stocks -> variationquantite = $val['quantiteVentes']*$val['conditionnementVentes'];
        $stocks -> dateApprovissionnement= now() ;
        $stocks -> produits_id = $val['produitVentes'];
        $stocks -> dons_id = $don -> id;
        $stocks -> save();


      }
      else{
        return response()->json(['fail' =>true,'errors' =>[['Stock inssuffisant pour effectuer cet don']]]);
      }


    }

    return $produit;
  }

  public function getDons(){
    $tab = [];
    $dons = Don::all();
    foreach ($dons as $key => $value) {
      // $value -> produits ;
      foreach ($value -> produits  as $k => $val) {
        $val -> prod;
        $val -> client;
        // $tab[$key][$k]['identifiant']= $value -> identifiantDons ;
        // $tab[$key][$k]['familleProduits_id']= $val -> prod -> famille_produits_id ;
        // $tab[$key][$k]['produits_id']= $val -> prod -> id ;
        // $tab[$key][$k]['produit']= $val -> prod -> designationProduits ;
        // $tab[$key][$k]['quantiteProduitDons']= $val -> quantiteProduitDons ;
        // $tab[$key][$k]['conditionnement']= $val -> conditionnement ;
        // $tab[$key][$k]['clients_id']= $val -> client -> id ;
      }
    }

    return $dons;
  }

  public function updateDons(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'data.*.produitVentes' => 'required|integer',
      'data.*.quantiteVentes' => 'required|integer',
      'data.*.client' => 'required|integer',
      'data.*.idDons' => 'required|integer',
      'data.*.conditionnementVentes' => 'required|integer',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $data = $request['data'];
    $next = true;
    foreach ($data as $key => $val) {
      if($next){
        $don = Don::find($val['idDons']);

        //avoir le stock de produit a augmenter suit a lamodif du don
        foreach ($don -> produits as $key => $value) {
          $st = Stock::where('produits_id',$value -> produits_id)->latest('id')->first();
          $stocks = new Stock();
          $stocks -> quantiteAnterieur = $st['quantiteActuel'];
          $stocks -> quantiteActuel = $st['quantiteActuel'] + ($value -> quantiteProduitDons * $value -> conditionnement);
          $stocks -> variationquantite = $value -> quantiteProduitDons * $value -> conditionnement;
          $stocks -> dateApprovissionnement= now() ;
          $stocks -> produits_id = $value -> produits_id;
          $stocks -> save();

        }

        $don -> produits() -> delete ();
        $next = false;
      }

      //add dons produits
      $produit = new DonProduit ();
      $produit -> quantiteProduitDons = $val['quantiteVentes'] ;
      $produit -> conditionnement = $val['conditionnementVentes'] ;
      $produit -> clients_id = $val['client'] ;
      $produit -> produits_id = $val['produitVentes'] ;
      $produit -> dons_id = $val ['idDons'] ;
      $produit ->  save();


      //diminuer lqte du stock de la  vente modifier
      // get la quantite acutel du produit a modifier
        $lastSt =  Stock::where('produits_id',$val ['produitVentes'])->latest('id')->first();
        // dd($val -> variationQuantite);
        // dd($val);
        $stocks = new Stock();
        $stocks -> quantiteAnterieur = $lastSt['quantiteActuel'];
        $stocks -> quantiteActuel = $lastSt['quantiteActuel'] - ($val['quantiteVentes'] * $val['conditionnementVentes']) ;
        $stocks -> variationquantite = $val['quantiteVentes'] * $val['conditionnementVentes'];
        $stocks -> dateApprovissionnement= now() ;
        $stocks -> produits_id = $val ['produitVentes'];
        $stocks -> save();

        // $val -> delete();
      }

      return $don;
    }




}
