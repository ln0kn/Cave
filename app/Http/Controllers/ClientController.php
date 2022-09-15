<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\ClientTypes;
use App\Client;

class ClientController extends Controller
{
  public function __construct()
  {
      $this->middleware('auth');
      $this->middleware('permission');
      // $this->middleware('admin');
  }
    public function Index(){
      return view('Mes_vues.Clients');
    }

    //ajouter une nouveau type de client
    public function addClientTypes(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'designationClientTypes' => 'required|unique:client_types,designationClientTypes',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $type= new ClientTypes();
      $type -> designationClientTypes = $request['designationClientTypes'];
      $type -> save();

      return $type;
    }

    //get tous les enregistrement de la table type client pour la daatatable de typeClient
    public function getClientTypes(){

      $clients = ClientTypes::withTrashed()->get();
      return $clients;
    }

    //fn utiliser pour modifier un type de client
    public function updateClientTypes(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'designationClientTypes' => 'required|unique:client_types,designationClientTypes,'.$request['idClientTypes'].',id,deleted_at,NULL',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $type = ClientTypes::find($request['idClientTypes']);
      $type -> designationClientTypes = $request['designationClientTypes'];
      $type -> save ();

      return $type;
    }

    //function use to desactiver ou activer une type de client
    public function deleteClientTypes(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'idClientTypes' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $types = ClientTypes::withTrashed()->where('id',$request['idClientTypes'])->first();

      if ($types ->trashed()) {
        $types -> restore();
      }else{
        $types -> delete();
      }
      return $types;
    }

    //get type Client pour select2 de nouveau client
    public function getTypeClients(){
      $type = ClientTypes ::all();
      $tab = [];
      foreach ($type as $key => $val) {
        $tab[$key]['id'] = $val -> id;
        $tab[$key]['text'] = $val -> designationClientTypes;
      }
      return $tab;
    }

    //fn use to add new Clients
    public function addClients(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'telephoneClients' => 'required|digits:8|integer|unique:clients,telephoneClients',
      'emailClients' => 'nullable|email|unique:clients,emailClients',
      'nomClients' => 'required',
      'clientTypes' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $client = new Client ();
      $client -> nomClients = $request['nomClients'];
      $client -> telephoneClients = $request['telephoneClients'];
      $client -> emailClients = $request['emailClients'];
      $client -> clientTypes_id = $request['clientTypes'];
      $client -> save();

      return $client;
    }

    //fn use to update  Clients
    public function updateClients(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'telephoneClients' => 'required|integer|unique:clients,telephoneClients,'.$request['idClients'].',id,deleted_at,NULL',
      'emailClients' => 'nullable|email|unique:clients,emailClients,'.$request['idClients'].',id,deleted_at,NULL',
      'nomClients' => 'required',
      'clientTypes' => 'required|integer',
      'idClients' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $client =  Client::find ($request['idClients']);
      $client -> nomClients = $request['nomClients'];
      $client -> telephoneClients = $request['telephoneClients'];
      $client -> emailClients = $request['emailClients'];
      $client -> clientTypes_id = $request['clientTypes'];
      $client -> save();

      return $client;
    }

    //fn use to delete Clients
    public function deleteClients(Request $request){
      $valide = $validator = Validator::make($request->all(), [
      'idClients' => 'required|integer',
      ]);

      if ($valide->fails()) {
        return response()->json([
        'fail' =>true,
        'errors' => $valide->errors()
        ]);
      }

      $client = Client::withTrashed()->where('id',$request['idClients'])->first();

      if ($client ->trashed()) {
        $client -> restore();
      }else{
        $client -> delete();
      }
      return $client;
    }


    //fn use to get Clients data for datatable
    public function getClients(Request $request){
      $clients = Client::withTrashed()->get();
      foreach ($clients as $key => $val) {
        $val ->type;
      }

      return $clients;
    }
}
