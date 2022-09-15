@extends('layouts.main')

@section('style')
<link rel="stylesheet" href="js/plugins/select2/css/select2.min.css">
@endsection

@section('content')

<!-- Page Content -->
<div class="content">
  <nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="javascript:void(0)">GESTION</a>
    <span class="breadcrumb-item active">Page Remises</span>
  </nav>
  <!-- Results -->
  <div class="p-10 bg-white push">
    <ul class="nav nav-pills" data-toggle="tabs" role="tablist">
      <!-- <li class="nav-item">
        <a class="nav-link active" href="#prix">Prix</a>
      </li> -->
      <li class="nav-item">
        <a class="nav-link active" href="#remises">Remises</a>
      </li>

    </ul>
  </div>
  <div class="block-content block-content-full tab-content overflow-hidden">

    <!-- remise-->
    <div class="tab-pane fade show active" id="remises" role="tabpanel">

      <div class="row">
        <div class="col-lg-7">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Liste des remises</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableRemise" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center"></th>
                    <th>Désignation Remise</th>
                    <th>Seuil</th>
                    <th>Valeur</th>
                    <th class="text-center" style="width: 15%;">option</th>
                  </tr>
                </thead>
              </table>

            </div>
          </div>
        </div>
        <div class="col-lg-5">
          <div class="block block-fx-shadow">
            <ul class="nav nav-tabs nav-tabs-block nav-justified" data-toggle="tabs" role="tablist">
              <li class="nav-item">
                <a class="nav-link " href="#crypto-sell">Remise</a>
              </li>
            </ul>
            <div class="block-content tab-content">
              <div class="tab-pane active" id="crypto-sell">
                <div class="table-responsive">
                  <table class="table table-striped table-vcenter">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>Designation</th>
                        <th >type</th>
                        <th >seuil</th>
                        <th >valeur</th>
                      </tr>
                    </thead>
                    <tbody class="remises">

                    </tbody>
                  </table>
                </div>
                <form id="formRemise" class="js-validation-material2">
                  {!! csrf_field() !!}
                  <input type="hidden" name="idRemises" id="idRemises">
                  <div class="form-group">
                    <div class="form-material">
                      <input class="form-control" type="text" id="designationRemises" name="designationRemises" placeholder="Entrez la designation de la remise" >
                      <label for="designationRemises">Désignation remise</label>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="form-material">
                      <select class="js-select2 form-control" id="applicationRemises" name="applicationRemises[]" style="width: 100%;" data-placeholder="faites votre choix">
                        <option></option>
                        <option value="0">Sur le montant total de l achat</option>
                        <option value="1">sur la frequence d achat</option>
                      </select>
                      <label for="applicationRemises">Application </label>
                    </div>
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-6">
                      <div class="form-material">
                        <input class="form-control" type="number" id="seuilMinimumRemises" name="seuilMinimumRemises" placeholder="La valeur a partir de laquelle appliquer la remise" >
                        <label for="seuilMinimumRemises">Seuil minimum remise </label>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      <div class="form-material">
                        <input class="form-control" type="number" id="seuilMaximumRemises" name="seuilMaximumRemises" placeholder="La valeur a partir de laquelle appliquer la remise" >
                        <label for="seuilMaximumRemises">Seuil maximum remise </label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="form-material">
                      <input class="form-control" type="number" id="valeurRemises" name="valeurRemises" placeholder="Entrez le prix de vente du produit" >
                      <label for="valeurRemises">Valeur remise </label>
                    </div>
                  </div>

                  <div class="form-group row">
                    <div class="col-12 text-center">
                      <div class="btn-group btn-group-sm" role="group" aria-label="btnGroup1">
                        <button type="button" class="btn btn-secondary addRow" >Ajouter ligne</button>
                        <button type="button" class="btn btn-secondary delRow" >Supprimer ligne</button>
                      </div>
                    </div>
                  </div>

                  <hr>
                  <div class="form-group">
                    <button type="button" class="btn btn-alt-primary" id="saveRemise">Enregistrer</button>
                    <button type="reset" class="btn btn-alt-danger btnAnnuler">Annuler</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
    <!-- END remise-->

  </div>
  <!-- END  -->
</div>
<!-- END Page Content -->

@section('script')
<script src="js/plugins/select2/js/select2.full.min.js"></script>
<script>jQuery(function(){ Codebase.helpers([ 'select2']); });</script>

<script src="js/lib/Prix.js"></script>

@endsection

<script type="text/javascript">

var urlGetRemises = '{{ route('getRemises')}}';
var urlGetPrix = '{{ route('getPrix')}}';
var urlGetProduitPrix = '{{ route('getProduitPrix')}}';
var urlGetTypeClients = '{{ route('getTypeClients')}}';

</script>

@endsection
