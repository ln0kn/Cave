@extends('layouts.main')

@section('style')
<link rel="stylesheet" href="js/plugins/select2/css/select2.min.css">
@endsection

@section('content')

<!-- Page Content -->
<div class="content">
  <nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="javascript:void(0)">GESTION</a>
    <span class="breadcrumb-item active">Page Autres</span>
  </nav>
  <!-- Results -->
  <div class="p-10 bg-white push">
    <ul class="nav nav-pills" data-toggle="tabs" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#don">Dons</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#versement">Versements</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#credit">Credits</a>
      </li>
    </ul>
  </div>
  <div class="block-content block-content-full tab-content overflow-hidden">
    <!-- dons -->
    <div class="tab-pane fade show active" id="don" role="tabpanel">
      <div class="row">
        <div class="col-xl-6">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Liste des dons</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableDons" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center"></th>
                    <th>Identifiant Don</th>
                    <th class="text-center" style="width: 15%;">option</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>

        <div class="col-lg-6">
          <div class="block block-fx-shadow">
            <ul class="nav id1 nav-tabs nav-tabs-block nav-justified" data-toggle="tabs" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" href="#crypto-buy">Dons</a>
              </li>
            </ul>
            <div class="block-content tab-content">
              <div class="tab-pane active" id="crypto-buy">
                <div class="table-responsive">
                  <table class="table table-striped table-vcenter">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th >Bénéficiaire</th>
                        <th >Produit</th>
                        <th >Qte</th>
                        <th >Cdt</th>
                      </tr>
                    </thead>
                    <tbody class="dons">

                    </tbody>
                  </table>
                </div>
                <form id="formDons">
                  <div class="form-group row">
                    <div class="col-12 mb-15">
                      <div class="mb-5">
                        <div class="float-right">
                          <a href="javascript:void(0)" id="qteDons"> 0 </a> bouteille(s)
                        </div>
                        <strong>Quantité Total du dons</strong>
                      </div>
                      <div class="progress mb-0" style="height: 5px;">
                        <div class="progress-bar bg-success" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
                      </div>
                    </div>
                  </div>

                  <input type="hidden" name="idDons" id="idDons">
                  <div class="form-group row">
                    <div class="col-sm-12">
                      <div class="form-material">
                        <select class="js-select2 form-control" id="nomClient" name="nomClient" style="width: 100%;" data-placeholder="faites votre choix">
                          @foreach($clients as $val)
                          <option></option>
                          <option value="{{$val -> id}}"> {{$val -> nomClients}} ( {{$val -> telephoneClients}} ) </option>
                          @endforeach
                        </select>
                        <label for="nomClient">Client</label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-6">
                      <div class="form-material">
                        <select class="js-select2 form-control" id="familleProduit" name="familleProduit" style="width: 100%;" data-placeholder="faites votre choix">
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
                    <div class="col-sm-6 border-r">
                      <div class="form-material">
                        <select class="js-select2 form-control" id="conditionnementVentes" name="conditionnementVentes" style="width: 100%;" data-placeholder="faites votre choix">

                          <option > </option>
                          <option value="30">carton de 30</option>
                          <option value="24">carton de 24</option>
                          <option value="12">Pack de 12 </option>
                          <option value="6">Pack de 6 </option>
                          <option value="1">Bouteille</option>
                        </select>
                        <label for="conditionnementVentes">Conditionnement</label>
                      </div>
                    </div>
                    <div class="col-sm-6 my-20">
                      <div class="input-group input-group">
                        <input min="1" type="number" class="form-control" id="quantiteVentes" name="quantiteVentes" placeholder="Quantité">
                        <div class="input-group-append">
                          <span class="input-group-text font-w600">Qte</span>
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
                      <button id="next" class="btn btn-hero btn-lg btn-block btn-alt-primary">Enregistrer</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END clients -->

    <!-- versement-->
    <div class="tab-pane fade show " id="versement" role="tabpanel">
      <div class="row">
        <div class="col-xl-8">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Les Versements</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableVersements" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center"></th>
                    <th>Date</th>
                    <th>Nom</th>
                    <th class="d-none d-sm-table-cell">Montant Versé</th>
                    <!-- <th class="text-center" style="width: 15%;">option</th> -->
                  </tr>
                </thead>
              </table>

            </div>
          </div>
        </div>
        <div class="col-xl-4">
          <div class="block block-themed my-block">
            <div class="block-header">
              <h3 class="block-title text-center"> Nouveau Versement </h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content" >
              <form class="js-validation-material2" id="formVersements">
                {!! csrf_field() !!}
                <input type="text" name="idVersements" id="idVersements" value="">
                <div class="form-group">
                  <div class="form-material">
                    <select class="js-select2 form-control" id="client" name="client" style="width: 100%;" data-placeholder="faites votre choix">
                      <option></option>
                      @foreach($clients as $val)
                        <option value="{{ $val -> id }}"> {{$val -> nomClients}}</option>
                      @endforeach
                    </select>
                    <label for="client">Clients</label>
                  </div>
                </div>

                <div class="form-group">
                  <div class="form-material">
                    <select class="js-select2 form-control" id="typeVersements" name="typeVersements" style="width: 100%;" data-placeholder="faites votre choix">
                      <option></option>
                      <option value="1"> Cash </option>
                      <option value="2"> Chèque </option>
                      <option value="3"> Virement Banquaire </option>
                    </select>
                    <label for="typeVersements">type Versement</label>
                  </div>
                </div>

                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="number" id="montantVersements" name="montantVersements" placeholder="Entrez le montant du versement" >
                    <label for="montantVersements">Montant Versement</label>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-material">
                    <textarea class="form-control" id="infoVersements" name="infoVersements" rows="2" placeholder="Plus d informations sur le versement"></textarea>
                    <label for="infoVersements">infos Versement</label>
                  </div>
                </div>

                <div class="form-group">
                  <button type="submit" class="btn btn-alt-primary">Enregistrer</button>
                  <button type="reset" class="btn btn-alt-danger btnAnnuler">Annuler</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END type clients -->

    <!-- crdits -->
    <div class="tab-pane fade show " id="credit" role="tabpanel">
      <div class="row">
        <div class="col-xl-8">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Les credits</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableCredits" class="table table-bordered table-striped table-vcenter">
              <!-- <table id="datatableCredits" class="table table-bordered table-striped table-vcenter"> -->
                <thead>
                  <tr>
                    <th class="text-center"></th>
                    <th>Nom</th>
                    <th class="d-none d-sm-table-cell">Montant</th>                   
                    <th class="text-center" style="width: 15%;">option</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
        <div class="col-xl-4">
          <div class="block block-themed my-block">
            <div class="block-header">
              <h3 class="block-title text-center"> Nouvelle marque </h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content" >
              <form class="js-validation-material3" id="formMarqueProduits">
                {!! csrf_field() !!}
                <input type="text" name="idMarqueProduits" id="idMarqueProduits" >
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="text" id="nomMarqueProduits" name="nomMarqueProduits" placeholder="Entrez le nom de la marque" required>
                    <label for="nomMarqueProduits">Nom marque produit </label>
                  </div>
                </div>

                <div class="form-group">
                  <button type="submit" class="btn btn-alt-primary">Enregistrer</button>
                  <button type="reset" class="btn btn-alt-danger btnAnnuler">Annuler</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end compte Clients -->



  </div>
  <!-- END  -->
</div>
<!-- END Page Content -->

@section('script')
<script src="js/plugins/select2/js/select2.full.min.js"></script>
<script>jQuery(function(){ Codebase.helpers(['select2']); });</script>

<script src="js/lib/Autres.js"></script>

@endsection

<script type="text/javascript">

var urlGetDons = '{{ route('getDons')}}';
var urlGetVersements = '{{ route('getVersements')}}';
var urlGetCredits = '{{ route('getCredits')}}';
var urlGetFamilleProduits = '{{ route('getProduitFamilles')}}';

</script>

@endsection
