$(function(){


  $('#formUtilisateurs').submit(function(e){
    e.preventDefault();

    if ($('#id').val() > 0)
    reqAjax('formUtilisateurs', 'updateUser', 'PUT')
    else
    reqAjax('formUtilisateurs',urlRegister, 'POST')


    User_table.ajax.reload();
  })

  //remplir lees postes de enrolles
  $('#employe').select2({
    placeholder: 'Faites votre choix',
    ajax: {
      url: urlGetUsers,
      dataType: 'json',
      processResults: function(data) {
        return {
          results: data
        };
      },
      cache: true
    }
  })

  //charger la liste des utilidateurs
  var User_table = $('#datatableUser').DataTable({
    responsive: true,
    bLengthChange: false,
    searching: false,
    autoWidth: !1,
    language: {
      searchPlaceholder: 'Chercher...',
      sSearch: '',
      lengthMenu: '_MENU_ lignes/page',
      oPaginate: {
        "sFirst": "Premier",
        "sLast": "Dernier",
        "sNext": "Suivant",
        "sPrevious": "Précédent"
      },
      sZeroRecords: "Aucun résultat trouvé",
      sEmptyTable: "Aucune donnée disponible",
      sInfo: "Lignes _START_ à _END_ sur _TOTAL_",
    },

    "ajax": {
      "url": 'getUser',
      "deferRender": true,
      "dataSrc": ""
    },
    "order": [
      [0, "desc"]
    ],
    "columnDefs": [
      //cache la colonne des id
      {
        "targets": 0,
        "visible": false
      },
      { responsivePriority: 1, targets: 0 },
      { responsivePriority: 2, targets: -1 },
      {
        "targets": -1,
        "data": null,
        "render": function(data, type, row, meta) {
          if (row.statut == 0)
            return " <button data-toggle='dropdown' class='btn btn-square btn-outline-primary'>Autres <i class='fa fa-caret-down fa-1x'></i> </button>" +
              "<div class='dropdown-menu'>" +
              "<a href='#' class='dropdown-item modifier' >MODIFIER</a>" +
              "<a href='#' class='dropdown-item toggle'>DÉSACTIVER</a>" +
              "</div>";

          else
            return " <button class='btn btn-outline-success toggle'>ACTIVER </button>";

        }
      },
      {
        "targets": 3,
        "data": null,
        "render": function(data, type, row, meta) {
          if (row.autorisation == 1)
          return 'Utilisateur';
          else
            if (row.autorisation == 2)
              return 'Adminitrateur';
            else
              return 'Super - Administrateur';
        }
      },
      {
        "targets": 4,
        "data": null,
        "render": function(data, type, row, meta) {
          switch (row.droit) {
            case 1:
            return "<span class='tx-12 badge badge-info'>Ajouter</span>";

            break;
            case 2:
            return "<span class='tx-12 badge badge-warning'>Modifier</span>";
            break;
            case 3:
            return "<span class='badge tx-12 badge badge-info'>Ajouter</span> <span class='tx-12 badge badge-warning'>Modifier</span> ";
            break;
            case 4:
            return "<span class='tx-12 badge badge-danger'>Supprimer</span>";
            break;
            case 5:
            return "<span class='tx-12 badge badge-info'>Ajouter</span>"+
            "<span class='tx-12 badge badge-danger'>Supprimer</span>";
            break;
            case 6:
            return "<span class='tx-12 badge badge-warning'>Modifier</span> <span class='tx-12 badge badge-danger'>Supprimer</span>";
            break;
            case 7:
            return "<span class='badge tx-12 badge badge-info'>Ajouter</span> <span class='tx-12 badge badge-warning'>Modifier</span> <span class='tx-12 badge badge-danger'>Supprimer</span>";
            break;


          }
        }
      },
      {
        "targets": 5,
        "data": null,
        "render": function(data, type, row, meta) {
          if(row.statut != 0)
          return 'Désactivé';
          else
          return 'Activé';
        }
      }
    ],
    "columns": [{
        "data": "id"
      },
      {
        "data": "username"
      },
      {
        "data": "email"
      },
      {
        "data": ""
      },
      {
        "data": ""
      },
      {
        "data": ""
      },
      {
        "data": ""
      }
    ],
  });

  //dsactiver un utlisateur
  $('#datatableUser tbody ').on('click', '.toggle', function() {
    //obtenir les donnees de la ligne cliquée
    var data = User_table.row($(this).parents('tr')).data();
    $('#id').val(data.id)
    reqAjax('formUtilisateurs', 'deleteUser', 'DELETE')
    User_table.ajax.reload();
  })

  //modifier un utlisateur
  $('#datatableUser tbody ').on('click', '.modifier', function() {
    //obtenir les donnees de la ligne cliquée
    var data = User_table.row($(this).parents('tr')).data();
    $('#id').val(data.id)
    // reqAjax('formUtilisateurs', 'deleteUser', 'DELETE')

    var newOption2 = new Option(data.enrolle.nomEnrolle+' '+data.enrolle.prenomEnrolle, data.enrolle_id, false, true);
    $('#employe').append(newOption2).trigger('change');

    $('#username').val(data.username)
    $('#email').val(data.email)
    $('#autorisation').val(data.autorisation).trigger('change')

    switch (data.droit) {
      case 1:
        $('#droit').val(1).trigger('change')
        break;

      case 2:
        $('#droit').val(2).trigger('change')
        break;

      case 3:
        $('#droit').val([1,2]).trigger('change')
        break;

      case 4:
        $('#droit').val([4]).trigger('change')
        break;

      case 5:
        $('#droit').val([1,4]).trigger('change')
        break;

      case 6:
        $('#droit').val([2,4]).trigger('change')
        break;

      case 7:
        $('#droit').val([1,2,4]).trigger('change')
        break;
      }
        $('.nav a:eq(1)').tab('show');
    // User_table.ajax.reload();
  })

})
