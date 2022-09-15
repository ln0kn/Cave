@extends('layouts.main')

@section('style')
<link rel="stylesheet" href="js/plugins/select2/css/select2.min.css">
@endsection

@section('content')

<!-- Page Content -->
<div class="content">
  <nav class="breadcrumb bg-white push">
    <a class="breadcrumb-item" href="javascript:void(0)">GESTION</a>
    <span class="breadcrumb-item active">Page Utilisateur</span>
  </nav>
  <!-- Results -->
  <div class="p-10 bg-white push">
    <ul class="nav nav-pills" data-toggle="tabs" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#liste">Les utilisateurs</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#users">Nouvel utilisateur</a>
      </li>
    </ul>
  </div>
  <div class="block-content block-content-full tab-content overflow-hidden">
    <!-- dons -->
    <div class="tab-pane fade show active" id="liste" role="tabpanel">
      <div class="row">
        <div class="col-xl-10 offset-xl-1">
          <div class="block block-themed">
            <div class="block-header ">
              <h3 class="block-title">Liste des utilisateurs</h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content block-content-full">
              <!-- DataTables functionality is initialized with .js-dataTable-full class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
              <table id="datatableUser" class=" table table-bordered table-striped table-vcenter ">
                <thead>
                  <tr>
                    <th class="text-center"></th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Rôle</th>
                    <th>Autorisation</th>
                    <th>Statut</th>
                    <th class="text-center" style="width: 15%;">option</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END clients -->

    <!-- nouvel users-->
    <div class="tab-pane fade show " id="users" role="tabpanel">
      <div class="row">
        <div class="col-xl-6 offset-xl-3">
          <div class="block block-themed my-block">
            <div class="block-header">
              <h3 class="block-title text-center"> Nouvel utilisateur </h3>
              <div class="block-options">

                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="fullscreen_toggle"></button>
                <button type="button" class="btn-block-option" data-toggle="block-option" data-action="content_toggle"></button>
              </div>
            </div>
            <div class="block-content" >
              <form class="js-validation-material3" id="formUtilisateurs">
                {!! csrf_field() !!}
                <input type="hidden" name="id" id="id" value="">

                <div class="form-group row">
                  <div class="col-sm-12">
                    <div class="form-material">
                      <select class="form-control select2" id="employe" name="employe" style="width: 100%;" data-placeholder="faites votre choix">
                      </select>
                      <label for="employe">Employé</label>
                    </div>
                  </div>
                </div>

                <div class="form-group row">
                  <div class="col-sm-6">
                    <div class="form-material">
                      <input type="text" class="form-control" id="username" name="username" placeholder="Entrez le nom d'utilisateur">
                      <label for="username">Nom utilisateur</label>
                    </div>
                  </div>
                  <div class="col-sm-6">
                    <div class="form-material">
                      <input type="text" class="form-control" id="email" name="email" placeholder="Entrez l email de l'utilisateur">
                      <label for="email">Email utilisateur</label>
                    </div>
                  </div>
                </div>

                <div class="form-group row">
                  <div class="col-sm-6">
                    <div class="form-material">
                      <select class="js-select2 select2 form-control" id="droit" name="droit[]" multiple style="width: 100%;" data-placeholder="faites votre choix">
                        <option></option>
                        <option value="1">Ajouter</option>
                        <option value="2">Modifier</option>
                        <option value="4">Désactiver | Supprimer</option>
                      </select>
                      <label for="droit">Droit utilisateur</label>
                    </div>
                  </div>
                  <div class="col-sm-6">
                    <div class="form-material">
                      <select class="js-select2 select2 form-control" id="autorisation" name="autorisation" style="width: 100%;" data-placeholder="faites votre choix">
                        <option></option>
                        <option value="1">Utiliateur</option>
                        <option value="2">Administrateur</option>
                        <option value="3">Super - Administrateur</option>
                      </select>
                      <label for="autorisation">Type Utilisateur</label>
                    </div>
                  </div>
                </div>

                <div class="form-group row">
                  <div class="col-sm-6">
                    <div class="form-material">
                      <input type="password" class="form-control" id="password" name="password" placeholder="Entrez lemot de passe">
                      <label for="password">Mot de passe</label>
                    </div>
                  </div>
                  <div class="col-sm-6">
                    <div class="form-material">
                      <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" placeholder="Re-Entrez le mot de passe">
                      <label for="password_confirmation">mot de passe Cofirmation</label>
                    </div>
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
    <!-- END users -->

  </div>
  <!-- END  -->
</div>
<!-- END Page Content -->

@section('script')
<script src="js/plugins/select2/js/select2.full.min.js"></script>
<script>jQuery(function(){ Codebase.helpers(['select2']); });</script>

<script src="js/lib/register.js"></script>

@endsection

<script type="text/javascript">

var urlRegister = '{{ route('register')}}';
var urlGetUsers = '{{ route('getUserEmp')}}';


</script>

@endsection
