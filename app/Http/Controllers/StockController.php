<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Stock;
use App\Produit;
use App\ProduitVente;
use App\Rebut;
use App\Vente;
use App\Ajustement;
use Illuminate\Support\Facades\Validator;

class StockController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('permission');
        // $this->middleware('admin');
        $this->middleware('super');
    }

    public function index(){
      $produits = Produit::all();
      $ventes = Vente::all();
      foreach ($ventes as $key => $value) {
        $value -> produits ;
      }
      // dd($produits);
      return view('Mes_vues.Stocks') -> withProduits($produits) -> withVentes($ventes);
    }

    public function getStocks(){
      $tab = [];
      $produits = Produit::all();
      foreach ($produits as $key => $value) {
        $tab[$key] =($value -> stocks()) ? $value -> stocks() -> latest('id')->first() : 0 ;
        $tab[$key]['designationProduits']= $value -> designationProduits;
        $tab[$key]['id']= $value -> id;
      }
      return $tab;
    }

    public function addAjustements(Request $request){
      $valide = Validator::make($request->all(), [
        'stockPhysique' => 'required|integer',
        'stockNumerique.*' => 'required|integer',
        'produitAjustements' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
          'fail' =>true,
          'errors' => $valide->errors()
        ]);
      }

      $ajst = Stock::where('produits_id', $request['produitAjustements'])->latest('id')->first();

      if($ajst){
        $aj = new Ajustement ();
        $aj -> stockPhysique = $request['stockPhysique'];
        $aj -> stockNumerique = $request['stockNumerique'];
        $aj -> produits_id = $request['produitAjustements'];
        $aj -> save();

        // dd($ajst);
        $ajustement = new Stock ();
        $ajustement -> quantiteAnterieur = ($ajst['quantiteActuel']?$ajst['quantiteActuel'] : 0);
        $ajustement -> quantitePhysique = $request['stockPhysique'];
        $ajustement -> quantiteActuel = $request['stockPhysique'];
        $ajustement -> variationQuantite = ($request['stockPhysique'] > $ajst['quantiteActuel']) ? $request['stockPhysique'] - $ajst['quantiteActuel'] : $ajst['quantiteActuel'] - $request['stockPhysique'];
        $ajustement -> dateApprovissionnement = ($ajst['dateApprovissionnement']?$ajst['dateApprovissionnement'] : now());
        $ajustement -> produits_id = $ajst['produits_id'];
        $ajustement -> approvissionnements_id = $ajst['approvissionnements_id'];
        $ajustement -> ventes_id = $ajst['ventes_id'];
        $ajustement -> users_id = $ajst['users_id'];
        $ajustement -> save ();
      }
      else{
        return response()->json(['fail' =>true,'errors' =>[['Stock inexistant pour ce produit.Impossible de réaliser cette action.Veuillez d abord approvissionner le produit.']]]);
      }
      return $ajst;
    }


    public function getAjustements(){
      $produit = Ajustement::all();

      foreach ($produit as $key => $value) {
        $value -> prods -> designationProduits;
      }

      return $produit;
    }


    public function getRebuts(){
      $rebuts = Rebut::all();
      return $rebuts;
    }

      //pour remplir les produits vendus selon la reference de la vente pour rebuts produits
    public function getProduitVentes(Request $request){
      $produits = ProduitVente ::where('ventes_id',$request['idVente'])->get();

      foreach ($produits as $key => $value) {
        $tab[$key]['id'] = $value -> prods -> id ;
        $tab[$key]['text'] = $value -> prods -> designationProduits;

      }
      return $tab;
    }


    public function addRebuts(Request $request){
      $valide = Validator::make($request->all(), [
        'idVentes' => 'required|integer',
        'produitRebuts' => 'required|integer',
        'conditionnement' => 'required|integer',
        'quantiteRebuts' => 'required|integer',
        'identifiantVentes' => 'required',
      ]);

      if ($valide->fails()) {
        return response()->json([
          'fail' =>true,
          'errors' => $valide->errors()
        ]);
      }

      $rebuts = new Rebut ();
      $rebuts -> identifiantVentes = $request['identifiantVentes'];
      $rebuts -> conditionnementRebuts = $request['conditionnement'];
      $rebuts -> quantiteRebuts = $request['quantiteRebuts'];
      $rebuts -> produits_id = $request['produitRebuts'];
      $rebuts -> ventes_id = $request['idVentes'];
      $rebuts -> save();

      //diminuer la qantite retourner dans le stock
      // checksi le stock est suffissant pour effectuer cette coomande
      $stock = Stock::where('produits_id',$request['produitRebuts'])-> latest('id')->first();
      if($stock['quantiteActuel'] >= $request['quantiteRebuts']*$request['conditionnement'] ){
        //diminuer le stock
        $stocks = new Stock();
        $stocks -> quantiteAnterieur = $stock['quantiteActuel'];
        // $stocks -> quantiteAnterieur = $stock['quantiteActuel'];
        $stocks -> quantiteActuel = $stock['quantiteActuel'] - ($request['quantiteRebuts']*$request['conditionnement']);
        $stocks -> variationquantite = $request['quantiteRebuts']*$request['conditionnement'];
        $stocks -> dateApprovissionnement= now() ;
        $stocks -> produits_id = $request['produitRebuts'];
        // $stocks -> ventes_id = $ventes -> id;
        $stocks -> save();
      }
      else{
        return response()->json(['fail' =>true,'errors' =>[['Stock inssuffisant pour effectuer pour effectuer ce retourd']]]);
      }

      return $rebuts;
    }

}
