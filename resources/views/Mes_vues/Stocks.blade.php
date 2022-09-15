@extends('layouts.main')

@section('style')
<link rel="stylesheet" href="js/plugins/select2/css/select2.min.css">

@endsection

@section('content')

<!-- Page Content -->
<div class="content">
  <nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="javascript:void(0)">GESTION</a>
    <span class="breadcrumb-item active">Page Stocks</span>
  </nav>
  <!-- Results -->
  <div class="p-10 bg-white push">
    <ul class="nav nav-pills" data-toggle="tabs" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#stocks">Stocks</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#ajustements">Ajustements</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#rebuts">Rebuts</a>
      </li>
    </ul>
  </div>
  <div class="block-content block-content-full tab-content overflow-hidden">
    <!-- liste des ajustements -->
    <div class="tab-pane fade show active" id="stocks" role="tabpanel">
      <div class="row">
        <div class="col-xl-8 offset-xl-2">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">État du stock</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableStock" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th>Produit</th>
                    <th >Quantité</th>
                    <th >Stock</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END liste des ajustements -->

    <!-- liste des ajustement produits -->
    <div class="tab-pane fade show " id="ajustements" role="tabpanel">
      <div class="row">
        <div class="col-xl-8">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Ajustements réalisés</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableAjustement" class="table table-bordered table-striped table-vcenter  dt-responsive" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th>date</th>
                    <th>Produit</th>
                    <th >Stock physique</th>
                    <th >Stock numerique</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>

        <div class="col-xl-4">
          <div class="block block-themed" id="my-block">
            <div class="block-header">
              <h3 class="block-title text-center"> Nouvel ajustment </h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content" >
              <form class="js-validation-material3" id="formAjustements">
                {!! csrf_field() !!}

                <input type="hidden" name="idAjustements" id="idAjustements">
                <div class="form-group">
                  <div class="form-material">
                    <select class="js-select2 form-control" id="produitAjustements" name="produitAjustements" style="width: 100%;" data-placeholder="Choose one..">
                      @foreach($produits as $val)
                        <option></option><!-- Required for data-placeholder attribute to work with Select2 plugin -->
                        <option value="{{$val -> id}}">{{ $val -> designationProduits }}</option>
                      @endforeach
                    </select>
                    <label for="produitAjustements">Produit</label>
                  </div>

                </div>

                <div class="form-group">
                  <div class="form-material input-group">
                    <input class="form-control" type="text" id="stockNumerique" name="stockNumerique">
                    <label for="stockNumerique">Stock numerique</label>
                  </div>
                </div>

                <div class="form-group">
                  <div class="form-material input-group">
                    <input class="form-control" type="text" id="stockPhysique" name="stockPhysique" placeholder="stock physique constaté">
                    <label for="stockPhysique">Stock physique</label>
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
    <!-- END liste des ajustement produits -->

    <!-- liste des rebuts -->
    <div class="tab-pane fade show " id="rebuts" role="tabpanel">
      <div class="row">
        <div class="col-xl-8">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Liste des rebuts</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableRebut" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th>date</th>
                    <th>Id Vente</th>
                    <th >Quantite</th>
                    <!-- <th >Option</th> -->
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
        <div class="col-xl-4">
          <div class="block block-themed" id="my-block">
            <div class="block-header">
              <h3 class="block-title text-center"> Nouveau rebut</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content" >
              <form class="js-validation-material2" id="formRebuts">
                {!! csrf_field() !!}

                <input type="hidden" name="idRebuts" id="idRebuts">
                <input type="hidden" name="identifiantVentes" id="identifiantVentes">
                <div class="form-group">
                  <div class="form-material">
                    <select class="js-select2 form-control" id="idVentes" name="idVentes" style="width: 100%;" data-placeholder="Choose one..">
                      @foreach($ventes as $val)
                        <option></option><!-- Required for data-placeholder attribute to work with Select2 plugin -->
                        <option value="{{$val -> id}}">{{ $val -> identifiantVentes }}</option>
                      @endforeach
                    </select>
                    <label for="idVentes">Réf. Vente</label>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-material">
                    <select class="form-control" id="produitRebuts" name="produitRebuts" style="width: 100%;" data-placeholder="Choose one..">
                      @foreach($produits as $val)
                        <option></option><!-- Required for data-placeholder attribute to work with Select2 plugin -->
                        <option value="{{$val -> id}}">{{ $val -> designationProduits }}</option>
                      @endforeach
                    </select>
                    <label for="produitRebuts">Produit</label>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-material input-group">
                    <select class="js-select2 form-control" id="conditionnement" name="conditionnement" style="width: 100%;" data-placeholder="Choose one..">
                        <option></option>
                        <option value="12">Pack</option>
                        <option value="6">Demi - Pack</option>
                        <option value="1">Bouteille</option>
                    </select>
                    <label for="conditionnement">Conditionnement</label>
                  </div>
                </div>

                <div class="form-group">
                  <div class="form-material input-group">
                    <input class="form-control" type="number" id="quantiteRebuts" name="quantiteRebuts" placeholder="stock physique constaté">
                    <label for="quantiteRebuts">Quantite rebuts</label>
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
    <!-- END liste des rebuts -->



  </div>
  <!-- END  -->
</div>
<!-- END Page Content -->


@section('script')
<script src="js/plugins/select2/js/select2.full.min.js"></script>
<script>jQuery(function(){ Codebase.helpers(['select2']); });</script>
<script src="js/lib/Stocks.js"></script>

@endsection

<script type="text/javascript">

var urlGetAjustements = '{{ route('getAjustements')}}';
var urlGetStocks = '{{ route('getStocks')}}';
var urlGetApprovissionnements = '{{ route('getApprovissionnements')}}';
var urlGetRebuts = '{{ route('getRebuts')}}';
var urlGetProduitVentes = '{{ route('getProduitVentes')}}';

</script>

@endsection
