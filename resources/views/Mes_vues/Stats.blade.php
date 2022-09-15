@extends('layouts.main')

@section('style')
<link rel="stylesheet" href="js/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="js/plugins/select2/css/select2.min.css">
@endsection

@section('content')

<!-- Page Content -->
<div class="content">
  <nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="javascript:void(0)">GESTION</a>
    <span class="breadcrumb-item active">Page Statistique</span>
  </nav>
  <!-- Results -->
  <div class="p-10 bg-white push">
    <ul class="nav nav-pills" data-toggle="tabs" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#don"> Statistique </a>
      </li>
    </ul>
  </div>
  <div class="block-content block-content-full tab-content overflow-hidden">
    <!-- dons -->
    <div class="tab-pane fade show active" id="don" role="tabpanel">
      <div class="row">

        <div class="col-lg-12">
          <div class="block block-fx-shadow my-block">
            <ul class="nav id1 nav-tabs nav-tabs-block nav-justified" data-toggle="tabs" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" href="#crypto-buy">Dons</a>
              </li>
            </ul>
            <div class="block-content tab-content">
              <div class="tab-pane active" id="crypto-buy">
                <form id="formStats" class="js-validation-material3">
                  <!-- <input type="text" name="periode"> -->
                  <div class="form-group row">
                    <div class="col-sm-5">
                      <div class="form-material">
                        <select class="js-select2 form-control" id="typeStats" name="typeStats" style="width: 100%;" data-placeholder="faites votre choix">
                          <option></option>
                          <option value="1">Journalière</option>
                          <option value="2">Mensuel</option>
                          <option value="3">Annuel</option>
                        </select>
                        <label for="typeStats">Type </label>
                      </div>
                    </div>
                    <div class="col-sm-5">
                      <div class="form-material">
                        <input type="text" class="datepicker form-control" id="date1" name="date1" data-week-start="1" data-autoclose="true" data-today-highlight="true" data-date-format="dd/mm/yy" placeholder="dd/mm/yy" >
                        <input type="text" class="datepicker form-control" id="date3" name="date3" data-week-start="1" data-autoclose="true" data-today-highlight="true" data-date-format="dd/mm/yy" placeholder="dd/mm/yy">
                        <input type="text" class="datepicker form-control" id="date4" name="date4" data-week-start="1" data-autoclose="true" data-today-highlight="true" data-date-format="dd/mm/yy" placeholder="dd/mm/yy">
                      </div>
                    </div>
                    <div class="col-sm-2">
                      <button class="btn btn-hero btn-sm btn-block btn-alt-primary">Enregistrer</button>

                    </div>
                  </div>
                  <hr>

                  <!-- <div class="form-group row">
                    <div class="col-12">
                      <button id="next" class="btn btn-hero btn-lg btn-block btn-alt-primary">Enregistrer</button>
                    </div>
                  </div> -->
                </form>

                <canvas id="myChart" width="200" height="200"></canvas>
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
              <table id="datatableCredits" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center"></th>
                    <th>Nom</th>
                    <th class="d-none d-sm-table-cell">Statut</th>
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
<script src="js/plugins/chartjs/Chart.bundle.min.js"></script>
<script src="js/plugins/select2/js/select2.full.min.js"></script>
<script src="js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script>jQuery(function(){ Codebase.helpers(['datepicker','select2']); });</script>
<script src="js/lib/Stats.js"></script>
@endsection

<script type="text/javascript">

var urlGetDons = '{{ route('getDons')}}';
var urlGetVersements = '{{ route('getVersements')}}';
var urlGetCredits = '{{ route('getCredits')}}';
var urlGetFamilleProduits = '{{ route('getProduitFamilles')}}';

</script>

@endsection
