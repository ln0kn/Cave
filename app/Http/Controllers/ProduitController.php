<?php

namespace App\Http\Controllers;
use App\FamilleProduit;
use App\MarqueProduit;
use App\Produit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProduitController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('permission');
        // $this->middleware('admin');
    }

    public function index(){

      return view('Mes_vues.Produits') ;
    }

    //ajouter une nouvelle famille de produit
    public function add(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'nomFamilleProduits' => 'required|unique:famille_produits,nomFamilleProduits',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $nomFamilleProduits= new FamilleProduit();
      $nomFamilleProduits -> nomFamilleProduits = $request['nomFamilleProduits'];
      $nomFamilleProduits -> save();

      return $nomFamilleProduits;
    }

    //get tous les enregistrement de la table famille des produits
    public function get(){

      $produits = FamilleProduit::withTrashed()->get();
      return $produits;
    }

    //fn utiliser pour modifier une famille de produit
    public function update(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'nomFamilleProduits' => 'required|unique:famille_produits,nomFamilleProduits,'.$request['id'].',id,deleted_at,NULL',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $familles = FamilleProduit::find($request['id']);
      $familles -> nomFamilleProduits = $request['nomFamilleProduits'];
      $familles -> save ();

      return $familles;
    }

    //function use to desactiver ou activer une famille de produit
    public function delete(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'id' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $famille = FamilleProduit::withTrashed()->where('id',$request['id'])->first();

      if ($famille ->trashed()) {
        $famille -> restore();
      }else{
        $famille -> delete();
      }
      return $famille;
    }


    //function utliser pour ajouter de nouvelles marques
    public function addMarque(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'nomMarqueProduits' => 'required|unique:marque_produits,nomMarqueProduits',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $nomMarqueProduits= new MarqueProduit();
      $nomMarqueProduits -> nomMarqueProduits = $request['nomMarqueProduits'];
      $nomMarqueProduits -> save();

      return $nomMarqueProduits;
    }

    //get tous les enregistrement de la table famille des produits
    public function getMarque(){
      $marques = MarqueProduit::withTrashed()->get();

      return $marques;
    }

    //fn utiliser pour modifier une famille de produit
    public function updateMarque(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'nomMarqueProduits' => 'required|unique:marque_produits,nomMarqueProduits,'.$request['id'].',id,deleted_at,NULL',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $marque = MarqueProduit::find($request['idMarqueProduits']);
      $marque -> nomMarqueProduits = $request['nomMarqueProduits'];
      $marque -> save ();

      return $marque;
    }

    //function use to desactiver ou activer une famille de produit
    public function deleteMarque(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'idMarqueProduits' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $marque = MarqueProduit::withTrashed()->where('id',$request['idMarqueProduits'])->first();

      if ($marque ->trashed()) {
        $marque -> restore();
      }else{
        $marque -> delete();
      }
      return $marque;
    }


    //function utliser pour ajouter de nouvelles marques
    public function addProduits(Request $request){
      $valide = $validator = Validator::make($request->all(), [
        'designationProduits' => 'required|unique:produits,designationProduits',
        'familleProduits' => 'required|integer',
        'marqueProduits' => 'required|integer',
        'seuilAlerte' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $Produits= new Produit();
      $Produits -> designationProduits = $request['designationProduits'];
      $Produits -> famille_produits_id = $request['familleProduits'];
      $Produits -> marque_produits_id = $request['marqueProduits'];
      $Produits -> seuilAlerte = $request['seuilAlerte'];
      $Produits -> save();

      return $Produits;
    }

    // obtenir toutes les familles de profuits pout le formulaire nouveau produit
    public function getFamilles(){
      $tab = [];
      $famille = FamilleProduit::all();
      foreach ($famille as $key => $value) {
        $tab[$key]['id']=$value -> id;
        $tab[$key]['text']=$value -> nomFamilleProduits;
      }
      return $tab;
    }

    // obtenir toutes les marques de profuits pout le formulaire nouveau produit
    public function getMarques(){
      $tab = [];
      $marque = MarqueProduit::all();
      foreach ($marque as $key => $value) {
        $tab[$key]['id']=$value -> id;
        $tab[$key]['text']=$value -> nomMarqueProduits;
      }
      return $tab;
    }

    //data pour le datatable de produits
    public function getProduits(){
      $tab=[];
      $produit = Produit::withTrashed()->get();
      foreach($produit as $key => $val){
         $val ->marque;
         $val ->famille;
        $tab[$key] = $val;
      }
      return $tab;
    }

    //fn utiliser pour modifier  produit
    public function updateProduits(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'designationProduits' => 'required|unique:produits,designationProduits,'.$request['idProduits'].',id,deleted_at,NULL',
      'familleProduits' => 'required|integer',
      'marqueProduits' => 'required|integer',
      'seuilAlerte' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $produit = Produit::find($request['idProduits']);
      $produit -> designationProduits = $request['designationProduits'];
      $produit -> famille_produits_id = $request['familleProduits'];
      $produit -> marque_produits_id = $request['marqueProduits'];
      $produit -> seuilAlerte = $request['seuilAlerte'];
      $produit -> save ();

      return $produit;
    }


    //function use to desactiver ou activer une famille de produit
    public function deleteProduits(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'idProduits' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $produit = Produit::withTrashed()->where('id',$request['idProduits'])->first();

      if ($produit ->trashed()) {
        $produit -> restore();
      }else{
        $produit -> delete();
      }
      return $produit;
    }

}
