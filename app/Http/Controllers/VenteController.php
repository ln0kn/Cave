<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Remise;
use App\ClientTypes;
use App\Client;
use App\ClientCompte;
use App\Caisse;
use App\FamilleProduit;
use App\ProduitVente;
use App\Produit;
use App\Stock;
use App\Credit;
use App\Vente;
use App\Devi;
use App\DeviProduits;
use App\ClotureJournee;
use PDF;
use Auth;
use View;
use Illuminate\Support\Facades\Validator;
class VenteController extends Controller
{

  public function __construct()
  {
    //$this->middleware('auth');
    //$this->middleware('permission');
    //$this->middleware('credit')->only(['addVentes','updateVentes']);
    // $this->middleware('admin');
  }


  public function index(){
    $familleProduit = FamilleProduit::all();
    $typeClients = ClientTypes::all();
    return view('Mes_vues.Ventes') ->withFamilles($familleProduit)->withTypes($typeClients);
  }

  public function getProduitFamilles(Request $request){
    $familles = FamilleProduit::find($request['idProduit']);
    $tab = [] ;
    foreach ($familles -> produits  as $key => $value) {
      $tab[$key]['id'] = $value -> id ;
      $tab[$key]['text'] = $value -> designationProduits;
    }
    return $tab;
  }

  public function getClientVentes(Request $request){
    $type = ClientTypes::find($request['idType']);
    $tab = [];
    foreach ($type -> clients as $key => $value) {
      $tab[$key]['id'] = $value -> id ;
      $tab[$key]['text'] = $value -> nomClients. ' ( '.$value -> telephoneClients.' )';
      $tab[$key]['hz'] = $value -> frequenceClients;
    }

    return $tab;
  }

  public function getRemiseVentes(){
    $remises = Remise::all();
    $tab = [];
    foreach ($remises as $key => $value) {
      $tab[$key]['id']=$value -> id ;
      $tab[$key]['text']=$value -> designationRemises ;
      $tab[$key]['cent']=$value -> pourcentageRemises ;
      $tab[$key]['min']=$value -> minimumAchatRemises ;
      $tab[$key]['max']=$value -> maximumAchatRemises ;
      $tab[$key]['hrz']=$value -> frequences ;
      $tab[$key]['type']=$value -> typeRemises ;
    }

    return $tab;
  }

  public function addVentes(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'data.*.mtn' => 'required|integer',
      'data.*.familleProduit' => 'required|integer',
      'data.*.quantiteVentes' => 'required|integer',
      'data.*.produitVentes' => 'required|integer',
      'data.*.mtn' => 'required|integer',
      'data.*.conditionnementVentes' => 'required|integer',
      'data.*.sommePayer' => 'required|integer',
      'data.*.sommeAPayer' => 'required|integer',
      'data.*.sommeRestante' => 'required|integer',
      'data.*.typeClient' => 'required|integer',
      'data.*.nomClient' => 'required',
      'data.*.idClient' => 'nullable',
      'data.*.typeVersement' => 'required|integer',
      'data.*.infoVersement' => 'nullable|string',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }
    // dd('po');
    $timestamp = strtotime(now());
    $day = date('d', $timestamp);
    $month = date('m', $timestamp);
    $year = date('y', $timestamp);
    $results = Vente::withTrashed()->latest('id')->first();
    $results = 'Vte/'.$day.'/'.$month.'/'.$year.'/'.(($results)?$results['id']+1:1);


    $next=true; //permettre detre executer une fois dans le foreach
    $data = $request['data'];
    foreach ($data as $key => $value) {
      //dd($value);

      // if($value['typeClient'] == 3)
      //   return response()->json(['fail' =>true,'errors' =>[['Credit impossible pour les clients ordinaires']]]);

      // checksi le stock est suffissant pour effectuer cette coomande
      $stock = Stock::where('produits_id',$value['produitVentes'])-> latest('id')->first();

      if($stock['quantiteActuel'] >= $value['quantiteVentes']*$value['conditionnementVentes'] ){
        if($next){

          //check if client isn t ordianry and have an account
          if($value['typeClient'] != 1){
            //incrementer la frequence d achat du client
            $client = Client::find($value['idClient']);
            $client -> increment('frequenceClients',1);
            $client -> increment('achatTotalClients',$value['mtn']);
            $client -> save ();
          }
          // creation d un client semi grossiste
          else{
            $client = new Client ();
            $client -> nomClients = $value['nomClient'];
            $client -> clientTypes_id = 2;
            $client -> frequenceClients = 1;
            $client -> achatTotalClients = $value['mtn'];
            $client -> save();
          }

          $vente= new Vente ();
          $vente -> identifiantVentes = $results;
          $vente -> dateVentes = now();
          $vente -> nomClients = $value['nomClient'];
          $vente -> clients_id = $client -> id ;
          $vente -> client_types_id = ($value['typeClient'] == 1 )? 2 : $value['typeClient'];
          $vente -> remises_id = $value['idRemise'];
          $vente -> sommePayer = ($value['sommePayer'])?$value['sommePayer']:0;
          $vente -> sommeAPayer = $value['sommeAPayer'];
          $vente -> sommeRestante =  $value['sommeRestante'];
          $vente -> infoVersement = $value['infoVersement'];
          $vente -> versement = $value['typeVersement'];
          $vente -> montantVente = $value['mtn'];
          $vente -> save() ;

          //mettre l argent dans la caisse
          $ca = Caisse ::where('typeVersment',$value['typeVersement'])->latest('id')->first();

          $caisse = new Caisse();
          $caisse -> typeVersment = $value['typeVersement'];
          $caisse -> sommeAnterieurCaisse = ($ca)?$ca['sommeActuelCaisse']:0;
          $caisse -> sommeActuelCaisse = ($ca)? $ca['sommeActuelCaisse'] + $value['sommePayer']: $value['sommePayer'];
          $caisse -> variatioCaisse = $value['sommePayer'];
          $caisse -> dateOperation = now();
          $caisse -> ventes_id = $vente -> id;
          $caisse -> save();



          //notifier la vente dans le compte du client
          $cpt = ClientCompte::where('clients_id',$client -> id)->latest('id')->first();
          // dd($value);
          $compte= new ClientCompte();
          $compte -> sommeAnterieur = ($cpt)? $cpt['sommeActuel'] : 0;
          $compte -> sommeActuel = ($cpt)? $cpt['sommeActuel'] + $value['sommeAPayer'] : $value['sommeAPayer'] ;
          $compte -> variation = $value['sommeAPayer'];
          $compte -> typeVersement = $value['typeVersement'];
          $compte -> date = now();
          $compte -> ventes_id = $vente -> id;
          $compte -> clients_id = $client -> id ;
          $compte -> save();

          //dd($client -> id);

          //notifier sil ya credit
          //$cred = Credit::find(1);
          $cred = Credit::where('clients_id',$client -> id)->latest('id')->first();
          //printf($cred);
          $cre = new Credit();
          $cre -> sommeActuel = ($cred)? $cred['sommeActuel'] + $value['sommeAPayer']-$value['sommePayer'] : $value['sommeAPayer']-$value['sommePayer'];
          $cre -> sommeAnterieur = ($cred)? $cred['sommeActuel'] : 0;
          $cre -> variation = $value['sommeAPayer']-$value['sommePayer'];
          $cre -> typeVersement = $value['typeVersement'];
          $cre -> ventes_id = $vente -> id ;
          $cre -> clients_id = $client -> id;
          $cre -> save();
          
          

          $next = false;
        }
        //notifier les produits vendus
        $produitVente = new ProduitVente();
        $produitVente -> prixUnitaireProduitVentes = $value['prixUnitaireVentes'];
        $produitVente -> quantiteProduitVentes = $value['quantiteVentes'];
        $produitVente -> prixTotalProduitVentes = $value['quantiteVentes'] *  $value['prixUnitaireVentes'];
        $produitVente -> conditionnement = $value['conditionnementVentes'];
        $produitVente -> produits_id = $value['produitVentes'];
        $produitVente -> ventes_id = $vente -> id ;
        $produitVente ->  save();



        // checksi le stock est suffissant pour effectuer cette coomande
        $stock = Stock::where('produits_id',$value['produitVentes'])-> latest('id')->first();

        // if($stock['quantiteActuel'] >= $value['quantiteVentes']*$value['conditionnementVentes'] ){
        //diminuer le stock
        $stocks = new Stock();
        $stocks -> quantiteAnterieur = $stock['quantiteActuel'];
        // $stocks -> quantiteAnterieur = $stock['quantiteActuel'];
        $stocks -> quantiteActuel = $stock['quantiteActuel'] - ($value['quantiteVentes']*$value['conditionnementVentes']);
        $stocks -> variationquantite = $value['quantiteVentes']*$value['conditionnementVentes'];
        $stocks -> dateApprovissionnement= now() ;
        $stocks -> produits_id = $value['produitVentes'];
        $stocks -> ventes_id = $vente -> id;
        $stocks -> save();
      }
      else{
        return response()->json(['fail' =>true,'errors' =>[['Stock inssuffisant pour effectuer cette vente']]]);
      }
    }

    return $vente;
  }

  public function getVentes(){
    $ventes = Vente::all();
    foreach ($ventes as $key => $value) {
      $value -> produits;
      $value -> remise;
      foreach ($value -> produits as $key => $val) {
        $val -> prods;
      }
    }
    return $ventes;
  }

  public function updateVentes(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'data.*.mtn' => 'required|integer',
      // 'data.*.familleProduit' => 'required|integer',
      'data.*.quantiteVentes' => 'required|integer',
      'data.*.produitVentes' => 'required|integer',
      'data.*.mtn' => 'required|integer',
      'data.*.conditionnementVentes' => 'required|integer',
      'data.*.sommePayer' => 'nullable|integer',
      'data.*.sommeAPayer' => 'required|integer',
      'data.*.sommeRestante' => 'required|integer',
      'data.*.typeClient' => 'required|integer',
      // 'data.*.nomClient' => 'required',
      'data.*.typeVersement' => 'required|integer',
      'data.*.infoVersement' => 'nullable|string',
      'data.*.idVentes' => 'required|integer',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $data = $request['data'];
    $stock ;
    $next = true;
    foreach ($data as $key => $value) {
      if($next){
        //get vente record to update;
        $ventes = Vente::find($value['idVentes']);
        $ventes -> produits() -> delete();
        $ventes -> caisse() -> delete();
        $ventes -> clientCompte() -> delete();
        $next = false;//empecher de rentrer dans le if + de 2 fois


        //remettre les stocks avant la vente a modifier
        foreach ($ventes -> stock as $key => $val) {
          // obtenir le stock actuel du produit
          $lastSt =  Stock::where('produits_id',$val -> produits_id)->latest('id')->first();

          //verifier si le stock va suffir pour la vente
          $state = $lastSt['quantiteActuel'] + $val -> variationQuantite - ($value['quantiteVentes'] * $value['conditionnementVentes']);
          if ( $state > 0) {

            $stocks = new Stock();
            $stocks -> quantiteAnterieur = $lastSt['quantiteActuel'];
            $stocks -> quantiteActuel = $lastSt['quantiteActuel'] + $val -> variationQuantite;
            $stocks -> variationquantite = $val -> variationQuantite;
            $stocks -> dateApprovissionnement= now() ;
            $stocks -> produits_id = $val -> produits_id;
            $stocks -> ventes_id = $val -> ventes_id;
            $stocks -> save();

            $val -> delete();
          }
          else{
            return response()->json(['fail' =>true,'errors' =>[['Stock inssuffisant pour effectuer cette modification']]]);
          }


        }

        //decrement le nombre d achat et le montant des achat d un client
        $client = Client::find($ventes['clients_id']);
        $client -> decrement('frequenceClients',1);
        $client -> decrement('achatTotalClients',$ventes['montantVente']);
        $client -> save ();

        $ventes -> nomClients = $value['nomClient'];
        $ventes -> clients_id = ($value['idClient'])? $value['idClient'] : NULL;
        $ventes -> client_types_id = ($value['typeClient'])?$value['typeClient'] : NULL;
        $ventes -> remises_id = ($value['idRemise'])?$value['idRemise']:NULL;
        $ventes -> sommePayer = $value['sommePayer'];
        $ventes -> sommeAPayer = $value['sommeAPayer'];
        $ventes -> sommeRestante =  $value['sommeRestante'];
        $ventes -> infoVersement = ($value['infoVersement']?$value['infoVersement'] : Null);
        $ventes -> versement = $value['typeVersement'];
        $ventes -> montantVente = $value['mtn'];
        $ventes -> save() ;


        //mettre l argent dans la caisse
        $lastCa = Caisse::withTrashed()->latest('id')->first();
        // dd($lastCa);
        $ca = Caisse ::where('ventes_id',$ventes -> id)->latest('id')->first();
        $caisse = new Caisse();
        $caisse -> typeVersment = $value['typeVersement'];
        $caisse -> sommeAnterieurCaisse = $lastCa['sommeActuelCaisse'];
        $caisse -> sommeActuelCaisse =$lastCa['sommeActuelCaisse'] - $ca['variatioCaisse'] + $value['sommePayer'] ;
        $caisse -> variatioCaisse = ($value['sommePayer'] > $ca['variationCasse']) ?$value['sommePayer'] - $ca['variationCaisse']:$ca['variationCaisse'] - $value['sommePayer'];
        $caisse -> dateOperation = now();
        $caisse -> ventes_id = $ventes -> id;
        $caisse -> save();

        //check if client have an account
        if($value['typeClient'] != 3){
          //incrementer la frequence d achat du client
          $client = Client::find($value['idClient']);
          $client -> increment('frequenceClients',1);
          $client -> increment('achatTotalClients',$value['mtn']);
          $client -> save ();

          //notifier la vente dans le compte du client
          $cpt = ClientCompte::where('clients_id',$value['idClient'])->latest('id')->first();
          $compte= new ClientCompte();
          $compte -> sommeAnterieur = ($cpt)? $cpt['sommeActuel'] : 0;
          $compte -> sommeActuel = ($cpt)? $cpt['sommeActuel'] + $value['sommeAPayer'] : $value['sommeAPayer'] ;
          $compte -> variation = $value['sommeAPayer'];
          $compte -> typeVersement = $value['typeVersement'];
          $compte -> date = now();
          $compte -> ventes_id = $ventes -> id;
          $compte -> clients_id = $value['idClient'];
          $compte -> save();

          //notifier sil ya credit
          $cred = Credit::where('clients_id',$client -> id)->latest('id')->first();
          $lastCred = Credit::where('ventes_id',$value['idVentes'])->latest('variation')->first();

          //dd($cred);
          //dd($lastCred['id']);
          $cre = new Credit();
          $cre -> sommeActuel = $cred['sommeActuel'] - $lastCred['variation'] + $value['sommeAPayer']-$value['sommePayer'];
          $cre -> sommeAnterieur = $cred['sommeActuel'];
          $cre -> variation = $value['sommeAPayer']-$value['sommePayer']- $cred['variation'];
          $cre -> typeVersement = $value['typeVersement'];
          $cre -> ventes_id = $ventes -> id ;
          $cre -> clients_id = $value['idClient'];
          $cre -> save();
          $lastCred -> delete();

        }
 

        $next = false;
        // return $ ;
      }

      //notifier les produits vendus
      $produitVente = new ProduitVente();
      $produitVente -> prixUnitaireProduitVentes = $value['prixUnitaireVentes'];
      $produitVente -> quantiteProduitVentes = $value['quantiteVentes'];
      $produitVente -> prixTotalProduitVentes = $value['quantiteVentes'] *  $value['prixUnitaireVentes'];
      $produitVente -> conditionnement = $value['conditionnementVentes'];
      $produitVente -> produits_id = $value['produitVentes'];
      $produitVente -> ventes_id = $ventes -> id ;
      $produitVente ->  save();

      //diminuer le stock
      $stock =  Stock::where('produits_id',$value['produitVentes'])->latest('id')->first();

      $stocks = new Stock();
      $stocks -> quantiteAnterieur = $stock['quantiteActuel'];
      // $stocks -> quantiteAnterieur = $stock['quantiteActuel'];
      $stocks -> quantiteActuel = $stock['quantiteActuel'] - ($value['quantiteVentes']*$value['conditionnementVentes']);
      $stocks -> variationquantite = $value['quantiteVentes']*$value['conditionnementVentes'];
      $stocks -> dateApprovissionnement= now() ;
      $stocks -> produits_id = $value['produitVentes'];
      $stocks -> ventes_id = $ventes -> id;
      $stocks -> save();



    }
    return $stock;
  }



  public function addDevis (Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'data.*.mtn' => 'required|integer',
      // 'data.*.familleProduit' => 'required|integer',
      'data.*.quantiteVentes' => 'required|integer',
      'data.*.produitVentes' => 'required|integer',
      'data.*.mtn' => 'required|integer',
      'data.*.conditionnementVentes' => 'required|integer',
      'data.*.sommePayer' => 'nullable|integer',
      'data.*.sommeAPayer' => 'required|integer',
      'data.*.sommeRestante' => 'required|integer',
      'data.*.typeClient' => 'required|integer',
      // 'data.*.nomClient' => 'required',
      'data.*.typeVersement' => 'required|integer',
      'data.*.infoVersement' => 'nullable|string',
      // 'data.*.idVentes' => 'required|integer',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $pack = [];
    $apck[1] = 'Bouteille';
    $apck[6] = 'demi-pack';
    $apck[12] = 'pack';
    $timestamp = strtotime(now());
    $day = date('d', $timestamp);
    $month = date('m', $timestamp);
    $year = date('y', $timestamp);
    $results = Devi::withTrashed()->latest('id')->first();
    $results = '#DEV/'.$day.'/'.$month.'/'.$year.'/'.(($results)?$results['id']+1:1);

    $next=true; //permettre detre executer une fois dans le foreach
    $tab = [];
    $tab2 = [];
    $prod = [];
    $data = $request['data'];
    $produit = Produit::all();
    foreach ($produit as $key => $value) {
      $tab2[$value -> id] = $value -> designationProduits;
    }

    foreach ($data as $key => $value) {
      if($next){
        $vente= new Devi ();
        $vente -> identifiantDevis = $results;
        $vente -> dateDevis = now();
        $vente -> nomClients = $value['nomClient'];
        $vente -> clients_id = $value['idClient'];
        $vente -> client_types_id = $value['typeClient'];
        // $vente -> remises_id = $value['idRemise'];
        $vente -> sommeAPayer = $value['sommeAPayer'];
        $vente -> montantDevis = $value['mtn'];
        $vente -> save() ;

        $tab['nomClients'] = $value['nomClient'];
        $tab['date'] = now();
        $tab['sommeAPayer'] = $value['sommeAPayer'];
        $tab['montantDevis'] = $value['mtn'];
        $tab['reduction'] = $value['mtn']-$value['sommeAPayer'];
        $tab['pourcentage'] = ($value['mtn']-$value['sommeAPayer']) / $value['mtn'];
        $tab['identifiantDevis'] = $results;
        $tab['vendeur'] = Auth::user()->enrolle -> nomEnrolle .' '.Auth::user()->enrolle -> prenomEnrolle ;


        $next = false;
      }

      //notifier les produits  du devis
      $produitVente = new DeviProduits();
      $produitVente -> prixUnitaireDevis = $value['prixUnitaireVentes'];
      $produitVente -> quantiteDevis = $value['quantiteVentes'];
      $produitVente -> prixTotalDevis = $value['quantiteVentes'] *  $value['prixUnitaireVentes'];
      $produitVente -> conditionnement = $value['conditionnementVentes'];
      $produitVente -> produits_id = $value['produitVentes'];
      $produitVente -> devis_id = $vente -> id ;
      $produitVente ->  save();

      $prod[$key]['prixU'] = $value['prixUnitaireVentes'] ;
      $prod[$key]['qte'] = $value['quantiteVentes'];
      $prod[$key]['prixT'] = $value['quantiteVentes'] *  $value['prixUnitaireVentes'] ;
      $prod[$key]['pack'] = $apck[$value['conditionnementVentes']];
      $prod[$key]['prod'] = $tab2[$value['produitVentes']];
    }

    // dd($prod);
    $pdf = PDF::loadView('Mes_vues.Devis', ['prod'=>$prod,'tab'=>$tab]);
    return $pdf->download($results.'.pdf');
  }


  public function addClotures(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'dateJourneeClotures' => 'required',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $timestamp = strtotime($request['dateJourneeClotures']);

    $day = date('d', $timestamp);
    // dd($timestamp);
    // dd($day);
    $month = date('m', $timestamp);
    $year = date('y', $timestamp);
    $results = '#CL/'.$day.'/'.$month.'/'.$year;

    $cloture = new ClotureJournee ();
    $cloture -> dateJourneeClotures = $request['dateJourneeClotures'];
    $cloture -> idenfiantClotures = $results;
    $cloture -> save();

    return $cloture;

  }


  public function getClotures(){
    $cl = ClotureJournee::all();
    return $cl;
  }


  public function cancelVentes(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'data' => 'required|integer',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $tab = [];
    $tab2 = [];
    $ventes = Vente::find($request['data']);

    foreach ($ventes -> caisse as $key => $value) {
      $lastCC = Caisse::latest()->first();

      $ventes -> caisse() -> delete();
      // dd($lastCC);
      $caisse = new Caisse();
      $caisse -> typeVersment = $lastCC['typeVersment'];
      $caisse -> sommeAnterieurCaisse = $lastCC['sommeActuelCaisse'];
      $caisse -> sommeActuelCaisse = $lastCC['sommeActuelCaisse']- $value['VariatioCaisse'];
      $caisse -> variatioCaisse = $value['VariatioCaisse'];
      $caisse -> dateOperation = now();
      $caisse -> save();

    }


    $cred = Credit::where('clients_id',$ventes -> clients_id)->latest('id')->first();
    $lastCred = Credit::where('ventes_id',$request['data'])->latest('id')->first();

    ///remettre les stocks avant la la vente
    foreach ($ventes -> produits as $key => $val) {
      $tab[$val -> id ] =$val-> prods -> id ;
    }
    $ventes -> produits() -> delete();

    foreach ($ventes -> stock as $key => $val) {
      if (in_array($val -> produits_id, $tab)){

        // $ventes -> clientCompte() -> delete();

        //stock actuel
        $lastSt =  Stock::where('produits_id',$val -> produits_id)->latest('id')->first();

        $stocks = new Stock();
        $stocks -> quantiteAnterieur = $lastSt['quantiteActuel'];
        $stocks -> quantiteActuel = $lastSt['quantiteActuel'] + $val -> variationQuantite;
        $stocks -> variationquantite = $val -> variationQuantite;
        $stocks -> dateApprovissionnement= now() ;
        $stocks -> produits_id = $val -> produits_id;
        $stocks -> ventes_id = $val -> ventes_id;
        $stocks -> save();
        $tab2[$val -> produits_id]=$lastSt['quantiteActuel'] + $val -> variationQuantite;

        $val -> delete();
      }
    }

    //notifier sil ya credit
    

    //dd($cred);
    //dd($lastCred);
    $cre = new Credit();
    $cre -> sommeActuel = $cred['sommeActuel'] - $lastCred['variation'] ;
    $cre -> sommeAnterieur = $cred['sommeActuel'];
    $cre -> variation = $cred['variation'];
    $cre -> typeVersement = $lastCred['typeVersement'];
    $cre -> ventes_id = $ventes -> id ;
    $cre -> clients_id = $lastCred['clients_id'];
    $cre -> save();
    $lastCred -> delete();



  return $tab2 ;
  }

}
