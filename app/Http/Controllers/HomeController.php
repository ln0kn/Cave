<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\User;
use App\Vente;
use App\Client;
use App\Produit;
use App\ProduitVente;
use App\Enrollement;
use DB;
use PDF;
use Auth ;
use Hash;

class HomeController extends Controller
{
  /**
  * Create a new controller instance.
  *
  * @return void
  */
  public function __construct()
  {
    // $this->middleware('auth');
  }

  /**
  * Show the application dashboard.
  *
  * @return \Illuminate\Http\Response
  */
  public function index()
  {
    return view('home');
  }

  public function stats()
  {
    return view('Mes_vues.Stats');
  }

  public function chart(Request $request){
    $valide = $validator = Validator::make($request->all(), [
      'typeStats' => 'required|integer',
      'date1' => 'nullable|date',
      'date2' => 'nullable|date',
      'date3' => 'nullable|date',
      'date4' => 'nullable|date',
    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $date ;
    if(!empty($request['date1']))
    $date = $request['date1'];

    if(!empty($request['date2']))
    $date = $request['date3'];

    if(!empty($request['date3']))
    $date = $request['date3'];


    if(!empty($request['date4']))
    $date = $request['date4'];

    //verifer que les champs requis ont ete remplis
    if(!empty($date) && $request['typeStats']){
      $timestamp = strtotime($date);
      $day = date('d', $timestamp);
      $month = date('m', $timestamp);
      $year = date('Y', $timestamp);

      $tab1 = [];
      $tab2 = [];
      switch ($request['typeStats']) {
        //state journaliere
        case 1:
          $number = cal_days_in_month(CAL_GREGORIAN, $month, $year);
          for ($i=1; $i <= $number ; $i++) {
            $tab1[$i]=$i;
            $newDate =$year.'-'.$month.'-'.$i;
            $prod = DB::table('ventes')
            ->whereDate('created_at', $newDate)
            ->sum('sommePayer');

            $tab2[$i]=$prod;
          }
          break;

        //state mensuel
        case 2:
          $tab1=['Jan','Fev','Mar','Avr','Mai','Jui','Jlt','Aou','Sept','Oct','Nov','Dec'];
            for ($i=1; $i <= 12 ; $i++) {

              // echo $year;
              $newDate =$year.'-'.$i;
              $prod = DB::table('ventes')
              ->whereYear('created_at', $year)
              ->whereMonth('created_at', $i)
              ->sum('sommePayer');
              // ->get();

              $tab2[$i]=$prod;
            }
          break;

        //state annuel
        default:
          $tab1=['2019','2020','2021','2022','2023','2024','2025','2026','2027','2028','2029','2030'];
            for ($i=2019; $i <= 2030 ; $i++) {
              // echo $i;
              // echo $year;
              $prod = DB::table('ventes')
              ->whereYear('created_at', $i)
              ->sum('sommePayer');
              // ->get();

              $tab2[$i]=$prod;
            }
          break;
      }

    }

    return [$tab2,$tab1];
  }

  public function UserEmp(){

    $user =Enrollement::where('statut',0)->get();
    $tab = [];
    foreach ($user as $key => $value) {
      $tab[$key]['id'] = $value -> id ;
      $tab[$key]['text'] = $value -> nomEnrolle.' '. $value -> prenomEnrolle ;
    }


    return $tab;
  }


  public function mkFacture(Request $request){
    $prod=[];
    $pack = [];
    $pack[1]= 'bouteille';
    $pack[6]= 'Pack de 6';
    $pack[12]= 'Pack de 12';
    $pack[24]= 'carton de 24';
    $pack[30]= 'carton de 30';
    $vente = Vente::find($request['id']);
    foreach ($vente -> produits as $key => $value) {
      // dd($value);
      $prod[$key]['prod'] = $value -> prods -> designationProduits;
      $prod[$key]['pack'] = $pack[$value['conditionnement']] ;
      $prod[$key]['qte'] = $value['quantiteProduitVentes'];
      $prod[$key]['prixT'] = $value['prixTotalProduitVentes'];
      $prod[$key]['prixU'] = $value['prixUnitaireProduitVentes'];
    }

    $tab['nomClients'] = $vente -> nomClients;
    $tab['date'] = $vente -> dateVentes;
    $tab['sommeAPayer'] = $vente -> sommeAPayer;
    $tab['montantDevis'] = $vente -> montantVente ;
    $tab['reduction'] = $vente -> montantVente - $vente -> sommeAPayer;
    $tab['pourcentage'] = ($vente -> montantVente - $vente -> sommeAPayer ) / $vente -> montantVente ;
    $tab['identifiantDevis'] = $vente -> identifiantVentes;
    $tab['vendeur'] = $vente -> vendeur ->enrolle -> nomEnrolle.' '.$vente -> vendeur ->enrolle -> prenomEnrolle;

    // dd($tab);

    $pdf = PDF::loadView('Mes_vues.Devis', ['prod'=>$prod,'tab'=>$tab]);
    return $pdf->download($vente -> identifiantVentes.'.pdf');

  }


  public function bilanCloture(Request $request){
    // $vente = Vente::where('dateVentes',$request['id'])->get();
    //
    $tab = [];
    $tab2 = [];
    $tab3 = [];
    $qte =0;
    $vte =0;
    $somme = 0;
    $timestamp = strtotime($request['date']);
    $day = date('d', $timestamp);
    $month = date('m', $timestamp);
    $year = date('Y', $timestamp);
    $date = $year.'-'.$month.'-'.$day;

    $prod = Vente::whereDate('dateVentes',$date)->get();
    foreach ($prod as $key => $value) {
      foreach ($value -> produits as $key => $val) {
        // $tab[$val -> prods -> designationProduits ] = 1;
        $tab[$val -> prods -> id ] = 0;
        $tab2[$val -> prods -> id ] = 0;
        $tab3[$val -> prods -> id ] = 0;
      }
      $somme += $value -> sommePayer ;
    }
    foreach ($prod as $key => $value) {
      foreach ($value -> produits as $key => $val) {
        $tab[$val -> prods -> id ] = $tab[$val -> prods -> id ] + $val -> prixTotalProduitVentes;
        $tab2[$val -> prods -> id ] = $tab2[$val -> prods -> id ] + ($val -> quantiteProduitVentes * $val -> conditionnement);
        $tab3[$val -> prods -> id ] = $val -> prods -> designationProduits;
        $qte += $val -> quantiteProduitVentes * $val -> conditionnement ;
        $vte += $val -> prixTotalProduitVentes ;
      }
    }

    $pdf = PDF::loadView('Mes_vues.Clotures', ['somme'=>$somme,'qte'=>$qte,'vte'=>$vte,'tab2'=>$tab2,'tab'=>$tab,'tab3'=>$tab3]);
    return $pdf->download('venteidentifiantVentes.pdf');


  }

  public function plus(){
    $tab = [];
    $produits = Produit::all();
    foreach ($produits as $key => $value) {
      $k =($value -> stocks()) ? $value -> stocks() -> latest('id')->first() : 0 ;
      $tab[$key]= $value -> designationProduits.' '.$k['quantiteActuel'];
    }
    return $tab;

  }


  public function markAsRead(){
    $user = \App\User::find(1);

    foreach ($user->unreadNotifications as $notification) {
        $notification->markAsRead();
    }

    return $user;
  }


  public function unreadNotif(){
    $users = User::all();
    $tab = [];
    foreach ($users as $key => $user) {
      foreach ($user->unreadNotifications  as $key => $val) {
        // dd($val['data']['data2']);
        $tab[$val['data']['data2']] = $val['data']['data'];
      }
    }

    return $tab;
  }


  public function ChangePassword(Request $request)
  {

    $valide = $validator = Validator::make($request->all(), [
      'mdpActuel' => 'required',
      'mdpNew' => 'required|min:6|confirmed',
      // 'mdpNew_confirmation' => 'required|min:6|confirmed',

    ]);

    if ($valide->fails()) {
      return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
      ]);
    }

    $user = User::find(Auth::id());

      if (strcmp($request['mdpActuel'], $request['mdpNew']) == 0) {
          //Current password and new password are same
          return response()->json(['fail' =>true,'errors' =>[['L\' ancien et le nouveau mot de passe sont identiques']]]);
        }

      //Change Password
      $user = Auth::user();
      $user->password = bcrypt($request['mdpNew']);
      $user->save();
      return $user;
  }

}
