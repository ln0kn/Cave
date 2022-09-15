@extends('layouts.main')

@section('style')
<link rel="stylesheet" href="js/plugins/select2/css/select2.min.css">
@endsection

@section('content')

<!-- Page Content -->
<div class="content">
  <nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="javascript:void(0)">GESTION</a>
    <span class="breadcrumb-item active">Page Approvissionnements</span>
  </nav>
  <!-- Results -->
  <div class="p-10 bg-white push">
    <ul class="nav nav-pills" data-toggle="tabs" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#liste">Liste approvissionnements</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#nouvelle">Nouvelle approvissionnement</a>
      </li>
    </ul>
  </div>
  <div class="block-content block-content-full tab-content overflow-hidden">
    <!-- liste des approvissionnements -->
    <div class="tab-pane fade show active" id="liste" role="tabpanel">
      <div class="row">
        <div class="col-xl-8 offset-xl-2">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Liste des approvissionnements</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableApprovissionnement" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center">#</th>
                    <th>Identifiant Fourniseeur</th>
                    <th class="text-center" style="width: 15%;">option</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END liste des approvissionnements -->

    <!-- nouvelle approvissionnements-->
    <div class="tab-pane fade show " id="nouvelle" role="tabpanel">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="block block-fx-shadow my-block">
            <ul class="nav nav-tabs nav-tabs-block nav-justified" data-toggle="tabs" role="tablist">
              <li class="nav-item">
                <a class="nav-link " href="#crypto-sell">Approvissionnement</a>
              </li>
            </ul>
            <div class="block-content tab-content">
              <div class="tab-pane active" id="crypto-sell">
                <div class="table-responsive">
                  <table class="table table-striped table-vcenter">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>Four.</th>
                        <th >Prod.</th>
                        <th >Cdt</th>
                        <th >Qte</th>
                        <th >P.U.</th>
                        <th >P.T.</th>
                      </tr>
                    </thead>
                    <tbody class="approvissionnements">

                    </tbody>
                  </table>
                </div>
                <form id="formApprovissionnements" class="js-validation-material3">
                  {!! csrf_field() !!}
                  <input type="hidden" name="idApprovissionnements" id="idApprovissionnements">
                  <div class="form-group row">
                    <div class="col-sm-6">
                      <div class="form-material">
                        <select class="js-select2 form-control" id="fournisseurApprovissionnements" name="fournisseurApprovissionnements" style="width: 100%;" data-placeholder="faites votre choix">
                          @foreach($fournisseurs as $val)
                            <option></option>
                            <option value="{{$val -> id}}"> {{$val -> nomFournisseurs}}</option>
                          @endforeach
                        </select>
                        <label for="fournisseurApprovissionnements">Fournisseur</label>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-material">
                        <select class="js-select2 form-control" id="produitApprovissionnements" name="produitApprovissionnements" style="width: 100%;" data-placeholder="faites votre choix">
                          <option></option>
                        </select>
                        <label for="produitApprovissionnements">Produit</label>
                      </div>
                    </div>
                  </div>
                  <hr>
                  <div class="form-group row">
                    <div class="col-sm-4 border-r">
                      <div class="form-material">
                        <select class="js-select2 form-control" id="conditionnement" name="conditionnement" style="width: 100%;" data-placeholder="faites votre choix">
                          <option> </option>
                          <option value="30">carton de 30</option>
                          <option value="24">carton de 24</option>
                          <option value="12">Pack de 12 </option>
                          <option value="6">Pack de 6 </option>
                          <option value="1">Bouteille</option>
                        </select>
                        <label for="conditionnement">Conditionnement</label>
                      </div>
                    </div>
                    <div class="col-sm border-r my-20">
                      <div class="input-group input-group-lg">
                        <input min="1" type="number" class="form-control" id="quantiteApprovissionnements" name="quantiteApprovissionnements" placeholder="Entrez la quantité livrés">
                        <div class="input-group-append">
                          <span class="input-group-text font-w600">Qte</span>
                        </div>
                      </div>
                    </div>
                    <div class="col-sm-4 my-20">
                      <div class="input-group input-group-lg">
                        <input min="1" type="number" class="form-control" id="prixUnitaireApprovissionnements" name="prixUnitaireApprovissionnements" placeholder="Entrez le prix d'achat unitaire">
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
                  <div class="form-group">
                    <button type="submit" class="btn btn-alt-primary">Enregistrer</button>
                    <button onclick="cleanForm('formApprovissionnements')" class="btn btn-alt-danger btnAnnuler">Annuler</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END nouvelle approvissionnement -->


  </div>
  <!-- END  -->
</div>
<!-- END Page Content -->

@section('script')
<script src="js/plugins/select2/js/select2.full.min.js"></script>
<script>jQuery(function(){ Codebase.helpers(['select2']); });</script>
<script src="js/lib/Approvissionnements.js"></script>

@endsection

<script type="text/javascript">

var urlGetFournisseurProduits = '{{ route('getFournisseurProduits')}}';
var urlGetApprovissionnements = '{{ route('getApprovissionnements')}}';
var urlGetTypeClients = '{{ route('getTypeClients')}}';

</script>

@endsection
