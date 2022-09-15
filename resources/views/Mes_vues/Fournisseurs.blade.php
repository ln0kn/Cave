@extends('layouts.main')

@section('style')
<link rel="stylesheet" href="js/plugins/jquery-tags-input/jquery.tagsinput.min.css">
<link rel="stylesheet" href="js/plugins/select2/css/select2.min.css">
@endsection

@section('content')

<!-- Page Content -->
<div class="content">
  <nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="javascript:void(0)">GESTION</a>
    <span class="breadcrumb-item active">Page Fournisseurs</span>
  </nav>
  <!-- Results -->
  <div class="p-10 bg-white push">
    <ul class="nav nav-pills" data-toggle="tabs" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#fournisseurs">Fournisseurs</a>
      </li>
      <!-- <li class="nav-item">
        <a class="nav-link " href="#activiteFournisseurs">Activité Fournisseurs</a>
      </li> -->

    </ul>
  </div>
  <div class="block-content block-content-full tab-content overflow-hidden">
    <!-- Fournisseurs -->
    <div class="tab-pane fade show active" id="fournisseurs" role="tabpanel">
      <div class="row">
        <div class="col-xl-8">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Liste des fournisseurs</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableFournisseurs" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center"></th>
                    <th>nom fournisseur</th>
                    <th>Téléphone</th>
                    <th>Produit Livrés</th>
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
              <h3 class="block-title text-center"> Nouveau fournisseur</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content" >
              <form class="js-validation-material1" id="formFournisseurs">
                {!! csrf_field() !!}
                <input type="hidden" name="idFournisseurs" id="idFournisseurs">
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="text" id="nomFournisseurs" name="nomFournisseurs" placeholder="Entrez le nom du fournisseur" >
                    <label for="nomFournisseurs">Nom fournisseur </label>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-material">
                    <select multiple class="js-select2 select2 form-control" id="produitFournisseurs" name="produitFournisseurs" style="width: 100%;" data-placeholder="faites votre choix">
                      <!-- Required for data-placeholder attribute to work with Select2 plugin -->
                      @foreach($produits as $produit)
                      <option value="{{$produit -> id}}">{{$produit -> designationProduits}}</option>
                      @endforeach
                    </select>
                    <label for="produitFournisseurs">Produits fournis </label>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-material">
                    <input type="text" class="js-tags-input form-control" data-height="34px" id="telephoneFournisseurs" name="telephoneFournisseurs">
                    <label for="telephoneFournisseurs">Téléphone fournisseur</label>
                  </div>

                </div>
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="text" id="emailFournisseurs" name="emailFournisseurs" placeholder="Entrez l adresse mail du fournisseur" >
                    <label for="emailFournisseurs">Email fournisseur </label>
                  </div>
                </div>

                <div class="form-group">
                  <button type="submit" class="btn btn-alt-primary">Enregistrer</button>
                  <button class="btn btn-alt-danger" onclick="cleanForm('formFournisseurs')">Annuler</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END Fournisseurs -->

    

  </div>
  <!-- END  -->
</div>
<!-- END Page Content -->

@section('script')
<script src="js/plugins/select2/js/select2.full.min.js"></script>
<script src="js/plugins/jquery-tags-input/jquery.tagsinput.min.js"></script>
<script>jQuery(function(){ Codebase.helpers(['tags-inputs', 'select2']); });</script>

<script src="js/lib/Fournisseurs.js"></script>
@endsection

<script type="text/javascript">
var urlGetFournisseurs = '{{ route('getFournisseurs')}}';
</script>

@endsection
