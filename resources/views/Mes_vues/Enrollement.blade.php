@extends('layouts.main')

@section('style')
<link rel="stylesheet" href="js/plugins/select2/css/select2.min.css">
@endsection

@section('content')

<!-- Page Content -->
<div class="content">
  <nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="javascript:void(0)">GESTION</a>
    <span class="breadcrumb-item active">Page Enrollement</span>
  </nav>
  <!-- Results -->
  <div class="p-10 bg-white push">
    <ul class="nav nav-pills" data-toggle="tabs" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#liste">Les enrollés</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#poste">Poste</a>
      </li>
    </ul>
  </div>
  <div class="block-content block-content-full tab-content overflow-hidden">
    <!-- liste des enreolles -->
    <div class="tab-pane fade show active" id="liste" role="tabpanel">
      <div class="row">
        <div class="col-xl-8">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Liste des enrollés</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableEnrolles" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center"> # </th>
                    <th class="text-center" >Nom</th>
                    <th>Téléphone</th>
                    <th>poste</th>
                    <th>statut</th>
                    <th class="text-center"  style="width: 15%;">option</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
        <div class="col-xl-4">
          <div class="block block-themed my-block">
            <div class="block-header">
              <h3 class="block-title text-center"> Nouvel enrollement</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content" >
              <form class="js-validation-material3" id="formEnrolles">
                {!! csrf_field() !!}
                <input type="hidden" name="id" id="id" value="">
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="text" id="nomEnrolles" name="nomEnrolles" placeholder="Entrez le nom de l'enrollé" >
                    <label for="nomEnrolles">Nom </label>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="text" id="prenomEnrolles" name="prenomEnrolles" placeholder="Entrez le prénom de l'enrollé" >
                    <label for="prenomEnrolles">Prénom </label>
                  </div>
                </div>

                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="number" id="telephoneEnrolles" name="telephoneEnrolles" placeholder="Entrez le(s) numéro(s) de téléphone de l'enrollé" >
                    <label for="telephoneEnrolles">N° Téléphone</label>
                  </div>
                </div>

                <div class="form-group">
                  <div class="form-material">
                    <select class="form-control select2" id="posteEnrolles" name="posteEnrolles" style="width: 100%;" data-placeholder="faites votre choix">
                    </select>
                    <label for="posteEnrolles">Poste </label>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-material">
                    <select class="js-select2 select2 form-control" id="sexeEnrolles" name="sexeEnrolles" style="width: 100%;" data-placeholder="faites votre choix">
                      <option value="0"> Femme </option>
                      <option value="1"> Homme </option>
                    </select>
                    <label for="sexeEnrolles">Poste </label>
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
    <!-- END liste enrolle   -->

    <!-- psotes -->
    <div class="tab-pane fade show " id="poste" role="tabpanel">
      <div class="row">
        <div class="col-xl-8">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title text-center">Liste des postes</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatablePostes" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center"></th>
                    <th >Designation poste</th>
                    <th class="d-none d-sm-table-cell">Statut</th>
                    <th data-priority="1" >option</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
        <div class="col-xl-4">
          <div class="block block-themed my-block">
            <div class="block-header">
              <h3 class="block-title text-center"> Nouveau Poste </h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content" >
              <form class="js-validation-material1" id="formPostes">
                {!! csrf_field() !!}
                <input type="hidden" name="id" id="id" >
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="text" id="designationPostes" name="designationPostes" placeholder="Désignation du poste" required>
                    <label for="designationPostes">Désignation poste</label>
                  </div>
                </div>

                <div class="form-group">
                  <button type="submit" class="btn btn-alt-primary">Enregistrer</button>
                  <button class="btn btn-alt-danger" onclick="cleanForm('formPostes')">Annuler</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end postes -->



  </div>
  <!-- END  -->
</div>
<!-- END Page Content -->

@section('script')
<script src="js/plugins/select2/js/select2.full.min.js"></script>
<script>jQuery(function(){ Codebase.helpers(['select2']); });</script>

<script src="js/lib/Enrollements.js"></script>

@endsection

<script type="text/javascript">

var urlGetPostes = '{{ route('getPostes')}}';
var urlGetPosteEnrolles = '{{ route('getPosteEnrolles')}}';
var urlGetEnrolles = '{{ route('getEnrolles')}}';

</script>

@endsection
