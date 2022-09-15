@extends('layouts.main')

@section('style')
<link rel="stylesheet" href="js/plugins/select2/css/select2.min.css">
@endsection

@section('content')

<!-- Page Content -->
<div class="content">
  <nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="javascript:void(0)">GESTION</a>
    <span class="breadcrumb-item active">Page Clients</span>
  </nav>
  <!-- Results -->
  <div class="p-10 bg-white push">
    <ul class="nav nav-pills" data-toggle="tabs" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#clients">Clients</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#typeClients">Type Clients</a>
      </li>
      <!-- <li class="nav-item">
        <a class="nav-link " href="#compteClients">Compte Clients</a>
      </li> -->
    </ul>
  </div>
  <div class="block-content block-content-full tab-content overflow-hidden">
    <!-- clients -->
    <div class="tab-pane fade show active" id="clients" role="tabpanel">
      <div class="row">
        <div class="col-xl-8">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Liste des clients</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableClients" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center"></th>
                    <th>Type Client</th>
                    <th>nom</th>
                    <th>Téléphone</th>
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
              <h3 class="block-title text-center"> Nouveau client</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content" >
              <form class="js-validation-material1" id="formClients">
                {!! csrf_field() !!}
                <input type="hidden" name="idClients" id="idClients">
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="text" id="nomClients" name="nomClients" placeholder="Entrez le nom du client" >
                    <label for="nomClients">Nom client </label>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-material">
                    <select class="select2 form-control" id="clientTypes" name="clientTypes" style="width: 100%;" >
                      <option></option><!-- Required for data-placeholder attribute to work with Select2 plugin -->
                    </select>
                    <label for="clientTypes">Type Client </label>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="text" id="telephoneClients" name="telephoneClients" placeholder="Entrez le n° téléphone du client" >
                    <label for="telephoneClients">Téléphone Client</label>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="text" id="emailClients" name="emailClients" placeholder="Entrez l adresse mail du client" >
                    <label for="emailClients">Email client </label>
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
    <!-- END clients -->

    <!-- type Clients -->
    <div class="tab-pane fade show " id="typeClients" role="tabpanel">
      <div class="row">
        <div class="col-xl-8">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Les types de clients</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableClientTypes" class=" table table-bordered table-striped table-vcenter ">
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
              <h3 class="block-title text-center"> Nouveau type de client </h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content" >
              <form class="js-validation-material2" id="formClientTypes">
                {!! csrf_field() !!}
                <input type="hidden" name="idClientTypes" id="idClientTypes" value="">
                <div class="form-group">
                  <div class="form-material">
                    <input class="form-control" type="text" id="designationClientTypes" name="designationClientTypes" placeholder="Entrez la désignation du type de client" >
                    <label for="designationClientTypes">Désignation type de client </label>

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

    



  </div>
  <!-- END  -->
</div>
<!-- END Page Content -->

@section('script')
<script src="js/plugins/select2/js/select2.full.min.js"></script>
<script src="js/lib/Clients.js"></script>

@endsection

<script type="text/javascript">

var urlGetClientTypes = '{{ route('getClientTypes')}}';
var urlGetClients = '{{ route('getClients')}}';
var urlGetTypeClients = '{{ route('getTypeClients')}}';

</script>

@endsection
