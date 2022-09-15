@extends('layouts.main')

@section('style')
<link rel="stylesheet" href="js/plugins/select2/css/select2.min.css">
<link rel="stylesheet" href="js/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">

@endsection

@section('content')

<!-- Page Content -->
<div class="content">
  <nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="javascript:void(0)">GESTION</a>
    <span class="breadcrumb-item active">Page ventes</span>
  </nav>
  <!-- Results -->
  <div class="p-10 bg-white push">
    <ul class="nav nav-pills" data-toggle="tabs" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#liste">Liste ventes</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#nouvelle">Nouvelle vente</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#cloture">Cloture journée</a>
      </li>
    </ul>
  </div>
  <div class="block-content block-content-full tab-content overflow-hidden">
    <!-- liste des ventes -->
    <div class="tab-pane fade show active" id="liste" role="tabpanel">
      <div class="row">
        <div class="col-xl-8 offset-xl-2">
          <div class="block block-themed my-block">
            <div class="block-header ">
              <h3 class="block-title">Liste des ventes</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableVente" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center">#</th>
                    <th>Identifiant Vente</th>
                    <th>Client</th>
                    <th>Statut</th>
                    <th class="text-center" style="width: 15%;">Option</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END liste des ventes -->

    <!-- nouvelle ventes-->
    <div class="tab-pane fade show " id="nouvelle" role="tabpanel">
      <div class="row">
        <div class="col-lg-6 offset-lg-3">
          <div class="block block-fx-shadow my-block">
            <ul class="nav id1 nav-tabs nav-tabs-block nav-justified" data-toggle="tabs" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" href="#crypto-buy">Produits</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link " href="#crypto-sell">Entete</a>
              </li>
            </ul>
            <div class="block-content tab-content">
              <div class="tab-pane active" id="crypto-buy">
              <div class="table-responsive">
                  <table class="table table-striped table-vcenter">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th >produit</th>
                        <th >par</th>
                        <th >Qte</th>
                        <th >P.U.</th>
                        <th >P.T.</th>
                      </tr>
                    </thead>
                    <tbody class="ventes">

                    </tbody>
                  </table>
                </div>
                <form action="be_pages_crypto_buy_sell.html" method="post" onsubmit="return false;">
                  <div class="form-group row">
                    <div class="col-12 mb-15">
                      <div class="mb-5">
                        <div class="float-right">
                          <a href="javascript:void(0)" id="mtnVente"> 0</a> cfa
                        </div>
                        <strong>Montant Total de la commande</strong>
                      </div>
                      <div class="progress mb-0" style="height: 5px;">
                        <div class="progress-bar bg-success" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
                      </div>
                    </div>
                  </div>

                  <input type="hidden" name="idVentes" id="idVentes">
                  <div class="form-group row">
                    <div class="col-sm-6">
                      <div class="form-material">
                        <select class="js-select2 select2 form-control" id="familleProduit" name="familleProduit" style="width: 100%;" data-placeholder="faites votre choix">
                          @foreach($familles as $val)
                          <option></option>
                          <option value="{{$val -> id}}"> {{$val -> nomFamilleProduits}}</option>
                          @endforeach
                        </select>
                        <label for="familleProduit">Famille produit</label>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-material">
                        <select class="form-control" id="produitVentes" name="produitVentes" style="width: 100%;" data-placeholder="faites votre choix">
                          <option></option>
                        </select>
                        <label for="produitVentes">Produit</label>
                      </div>
                    </div>
                  </div>
                  <hr>
                  <div class="form-group row">
                    <div class="col-sm-4 border-r">
                      <div class="form-material">
                        <select class="js-select2 select2 form-control" id="conditionnementVentes" name="conditionnementVentes" style="width: 100%;" data-placeholder="faites votre choix">
                          <option> </option>
                          <option value="30">carton de 30</option>
                          <option value="24">carton de 24</option>
                          <option value="12">Pack de 12</option>
                          <option value="6">Pack de 6</option>
                          <option value="1">Bouteille</option>
                        </select>
                        <label for="conditionnementVentes">Conditionnement</label>
                      </div>
                    </div>
                    <div class="col-sm-4 my-20">
                      <div class="input-group input-group">
                        <input min="1" type="number" class="form-control" id="quantiteVentes" name="quantiteVentes" placeholder="Quantité">
                        <div class="input-group-append">
                          <span class="input-group-text font-w600">Qte</span>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-4 my-20">
                      <div class="input-group input-group">
                        <input min="1" type="number" class="form-control" id="prixUnitaireVentes" name="prixUnitaireVentes" placeholder="P .unitaire">
                        <div class="input-group-append">
                          <span class="input-group-text font-w600">P.U.</span>
                        </div>
                      </div>
                    </div>
                  </div>
                  <hr>
                  <div class="form-group row">
                    <div class="col-12 text-center">
                      <div class="btn-group btn-group-sm my-5" role="group" aria-label="btnGroup1">
                        <button type="button" class="btn btn-secondary addRow" >Ajouter ligne</button>
                        <button type="button" class="btn btn-secondary delRow" >Supprimer ligne</button>
                      </div>
                      <div class="font-size-sm text-muted">
                        <i class="fa fa-repeat"></i> <em>Actualiser</em>
                      </div>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-12">
                      <button id="next" class="btn btn-hero btn-lg btn-block btn-alt-primary">Suivant</button>
                    </div>
                  </div>
                </form>
              </div>
              <div class="tab-pane disabled" id="crypto-sell">
                <form id="formVentes">
                  <div class="form-group row">
                    <div class="col-sm-6">
                      <div class="form-material">
                        <select class="js-select2 select2 form-control" id="typeClient" name="typeClient" style="width: 100%;" data-placeholder="faites votre choix">
                          @foreach($types as $val)
                          <option></option>
                          <option value="{{$val -> id}}"> {{$val -> designationClientTypes}}</option>
                          @endforeach
                        </select>
                        <label for="typeClient">typeClient</label>
                      </div>
                    </div>
                    <div class="col-sm-6 client1">
                      <div class="form-material">
                        <select class="form-control select2" id="client" name="client" style="width: 100%;" data-placeholder="faites votre choix">
                          <option></option>
                        </select>
                        <label for="client">Client</label>
                      </div>
                    </div>
                    <div class="col-sm-6 client2">
                      <div class="form-material">
                        <input type="text" class="form-control" id="nomClient" name="nomClient" placeholder="Entrez le nom du client">
                        <label for="nomClient">Nom client</label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-6">
                      <div class="form-material">
                        <select class="form-control select2" id="remiseVentes" name="remiseVentes" style="width: 100%;" data-placeholder="faites votre choix">

                        </select>
                        <label for="remiseVentes">Remises</label>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-material">
                        <input type="number" class="form-control" id="sommeAPayer" name="sommeAPayer" disabled>
                        <label for="sommeAPayer">Montant à payer</label>
                      </div>
                    </div>
                  </div>
                  <hr>
                  <div class="form-group row">
                    <div class="col-sm-6">
                      <div class="form-material">
                        <input min= 0 type="number" class="form-control" id="sommePayer" name="sommePayer" placeholder="somme versee">
                        <label for="sommePayer">Somme payer</label>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-material">
                        <input min=0 type="number" class="form-control" id="sommeRestante" name="sommeRestante" disabled>
                        <label for="sommeRestante">Somme restante</label>
                      </div>
                    </div>
                  </div>
                  <hr>
                  <div class="form-group row">
                    <div class="col-sm-6 my-15">
                      <div class="form-material">
                        <select class="js-select2 select2 form-control" id="typeVersement" name="typeVersement" style="width: 100%;" data-placeholder="faites votre choix">
                          <option></option>
                          <option value="1"> Cash </option>
                          <option value="2"> Chèque </option>
                          <option value="3"> Virement Banquaire </option>
                        </select>
                        <label for="typeVersement">type Versement</label>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-material">
                        <textarea class="form-control" id="infoVersement" name="infoVersement" rows="2" placeholder="Plus d informations sur le versement"></textarea>
                        <label for="infoVersement">infos Versement</label>
                      </div>
                    </div>
                  </div>
                  <hr>

                  <div class="form-group row">
                    <div class="col-12 text-center">
                      <button type="submit" class="btn btn-alt-success mr-5 mb-5">Vendre</button>
                      <button type="button" class="btn btn-alt-info mr-5 mb-5" id="devis">Devis</button>
                      <button type="button" class="btn btn-alt-warning mr-5 mb-5">Annuler</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
    <!-- END nouvelle ventes -->

    <!--Cloture la journee-->
    <div class="tab-pane fade show " id="cloture" role="tabpanel">
      <div class="row">
        <div class="col-xl-8">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Journées cloturés</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableCloture" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th> </th>
                    <th>Identifiant Cloture</th>
                    <th>date</th>
                    <th >Option</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
        <div class="col-xl-4">
          <div class="block block-themed" id="my-block">
            <div class="block-header">
              <h3 class="block-title text-center"> Cloturé journée</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content" >
              <form class="js-validation-material3" id="formJourneeClotures">
                {!! csrf_field() !!}

                <div class="form-group">
                  <div class="form-material input-group">
                    <input type="text" class="form-control" id="dateJourneeClotures" name="dateJourneeClotures" data-week-start="1" data-autoclose="true" data-today-highlight="true" placeholder="choix de la journée a cloturer">
                    <label for="dateJourneeClotures">Date Cloture</label>
                  </div>
                </div>

                <div class="form-group">
                  <button type="submit" class="btn btn-alt-primary">Enregistrer</button>
                  <button type="reset" class="btn btn-alt-danger">Annuler</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

    </div>
    <!-- END cloture la journee -->


  </div>
  <!-- END  -->
</div>
<!-- END Page Content -->

@section('script')
<script src="js/plugins/select2/js/select2.full.min.js"></script>
<script src="js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

<script>jQuery(function(){ Codebase.helpers(['select2','datepicker']); });</script>
<script src="js/lib/Ventes.js"></script>


@endsection

<script type="text/javascript">

var urlGetFamilleProduits = '{{ route('getProduitFamilles')}}';
var urlGetClientVentes = '{{ route('getClientVentes')}}';
var urlGetTypeClients = '{{ route('getTypeClients')}}';
var urlGetRemiseVentes = '{{ route('getRemiseVentes')}}';
var urlGetVentes = '{{ route('getVentes')}}';
var urlGetClotures = '{{ route('getClotures')}}';

</script>

@endsection
