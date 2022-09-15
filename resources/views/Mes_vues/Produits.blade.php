@extends('layouts.main')

@section('style')
<link rel="stylesheet" href="js/plugins/select2/css/select2.min.css">
@endsection

@section('content')

<!-- Page Content -->
<div class="content">
  <nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="javascript:void(0)">GESTION</a>
    <span class="breadcrumb-item active">Page Produits</span>
  </nav>
  <!-- Results -->
  <div class="p-10 bg-white push">
    <ul class="nav nav-pills" data-toggle="tabs" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#produits">Produits</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#familles">Familles Produits</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#marques">Marques Produits</a>
      </li>
    </ul>
  </div>
  <div class="block-content block-content-full tab-content overflow-hidden">
    <!-- produits -->
    <div class="tab-pane fade show active" id="produits" role="tabpanel">
      <div class="row">
        <div class="col-xl-8">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Liste des produits</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <!-- <div class="table-responsive"> -->
                <table id="datatableProduits" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center"></th>
                    <th>Nom</th>
                    <th>Seuil</th>
                    <th>Famille</th>
                    <th>Marque</th>
                    <th class="d-none d-sm-table-cell">Statut</th>
                    <th class="text-center" style="width: 15%;">option</th>
                  </tr>
                </thead>
              </table>
              <!-- </div> -->
            </div>
          </div>
        </div>
        <div class="col-xl-4">
          <div class="block block-themed my-block">
            <div class="block-header">
              <h3 class="block-title text-center"> Nouveau produit</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content" >
              <form class="js-validation-material1" id="formProduits">
                {!! csrf_field() !!}
                <input type="hidden" name="idProduits" id="idProduits">
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="text" id="designationProduits" name="designationProduits" placeholder="Entrez la designation du produit" >
                    <label for="designationProduits">Désignation produits </label>
                  </div>
                </div>

                <div class="form-group">
                  <div class="form-material">
                    <select class="select2 form-control" id="familleProduits" name="familleProduits" style="width: 100%;" >
                      <option></option><!-- Required for data-placeholder attribute to work with Select2 plugin -->
                    </select>
                    <label for="familleProduits">Famille du produit </label>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-material">
                    <select class="select2 form-control" id="marqueProduits" name="marqueProduits" style="width: 100%;" data-placeholder="Faites votre choix..">
                      <option></option><!-- Required for data-placeholder attribute to work with Select2 plugin -->
                    </select>
                    <label for="marqueProduits">Marque du produit</label>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="number" id="seuilAlerte" name="seuilAlerte" placeholder="Definir le seuil d'alerte en bouteille" >
                    <label for="seuilAlerte">Seuil alerte produits </label>
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
    <!-- END produits -->

    <!-- familles produiits -->
    <div class="tab-pane fade show " id="familles" role="tabpanel">
      <div class="row">
        <div class="col-xl-8">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Les familles de produits</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableFamilleProduits" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center"></th>
                    <th>Nom</th>
                    <th class="d-none d-sm-table-cell">Statut</th>
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
              <h3 class="block-title text-center"> Nouvelle famille </h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content" >
              <form class="js-validation-material2" id="formFamilleProduits">
                {!! csrf_field() !!}
                <input type="hidden" name="id" id="id" value="">
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="text" id="nomFamilleProduits" name="nomFamilleProduits" placeholder="Entrez le nom de la famille de produit" >
                    <label for="nomFamilleProduits">Nom famille produits </label>

                  </div>
                </div>

                <div class="form-group">
                  <button type="submit" class="btn btn-alt-primary">Enregistrer</button>
                  <button  class="btn btn-alt-danger"onclick="cleanForm('formFamilleProduits')">Annuler</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END familles produiits -->

    <!-- marques produits -->
    <div class="tab-pane fade show " id="marques" role="tabpanel">
      <div class="row">
        <div class="col-xl-8">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Les marques de produits</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableMarqueProduits" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center"></th>
                    <th>Nom</th>
                    <th class="d-none d-sm-table-cell">Statut</th>
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
                <input type="hidden" name="idMarqueProduits" id="idMarqueProduits" >
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="text" id="nomMarqueProduits" name="nomMarqueProduits" placeholder="Entrez le nom de la marque" required>
                    <label for="nomMarqueProduits">Nom marque produit </label>
                  </div>
                </div>

                <div class="form-group">
                  <button type="submit" class="btn btn-alt-primary">Enregistrer</button>
                  <button class="btn btn-alt-danger" onclick="cleanForm('formMarqueProduits')">Annuler</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END marques produits -->



  </div>
  <!-- END  -->
</div>
<!-- END Page Content -->

@section('script')
<script src="js/plugins/select2/js/select2.full.min.js"></script>
<script src="js/lib/Produits.js"></script>

@endsection

<script type="text/javascript">

var urlGetFamilleProduits = '{{ route('getFamilleProduits')}}';
var urlGetFamilles = '{{ route('getFamilles')}}';
var urlGetMarques = '{{ route('getMarques')}}';
var urlGetProduits = '{{ route('getProduits')}}';
var urlGetMarqueProduits = '{{ route('getMarqueProduits')}}';

</script>

@endsection
