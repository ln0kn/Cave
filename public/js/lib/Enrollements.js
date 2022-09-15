$(function(){
  //////////////////////////////////////////////////////////////postes
  ////////////////////////////////////////////////////// submit postes form
  $('#formPostes').submit(function(e){
    e.preventDefault();

    if ($('#id').val() > 0)
    validateForm('formPostes', 'updatePostes', 'PUT')
    else
    validateForm('formPostes', 'addPostes', 'POST')

    Poste_table.ajax.reload();
  })

  ///initialisation du datatable de versement
  var Poste_table = $('#datatablePostes').DataTable({
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
      "url": urlGetPostes,
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
      {
        "targets": -1,
        "data": null,
        "render": function(data, type, row, meta) {
          if (row.deleted_at == null)
          return " <button data-toggle='dropdown' class='btn btn-square btn-outline-primary'>Autres <i class='fa fa-caret-down fa-1x'></i> </button>" +
          "<div class='dropdown-menu'>" +
          "<a href='#' class='dropdown-item modifier' >MODIFIER</a>" +
          "<a href='#' class='dropdown-item toggle'>DÉSACTIVER</a>" +
          "</div>";

          else
          return " <button class='btn btn-outline-success toggle'>ACTIVER </button>" ;

        }
      },
      {
        "targets":2 ,
        "data": null,
        "render": function(data, type, row, meta) {
          if (row.deleted_at != null)
          return 'Désactivé';
          else
          return 'Activé';
        }
      },

    ],
    "columns": [{
      "data": "id"
    },
    {
      "data": "designationPostes"
    },
    {
      "data": ""
    },
    {
      "data": ""
    }
    ],
  });

  //modifier le postes
  $('#datatablePostes tbody ').on('click', '.modifier', function() {

    //obtenir les donnees de la ligne cliquée
    var data =Poste_table.row($(this).parents('tr')).data();
      $('#id').val(data.id)
      $('#designationPostes').val(data.designationPostes)
  })

  //desactiver le postes
  $('#datatablePostes tbody ').on('click', '.toggle', function() {

    //obtenir les donnees de la ligne cliquée
    var data =Poste_table.row($(this).parents('tr')).data();
      $('#id').val(data.id)
      reqAjax('formPostes', 'deletePostes', 'DELETE')
      Poste_table.ajax.reload();
  })

  ///////////////////////////////////////////////////////fin id

  /////////////////////////////////////////////////////////////////////////////// enrolles
  /////////////////////////////////////////////////// ////////////////////////

  //remplir lees postes de enrolles
  $('#posteEnrolles').select2({
    placeholder: 'Faites votre choix',
    ajax: {
      url: urlGetPosteEnrolles,
      dataType: 'json',
      processResults: function(data) {
        return {
          results: data
        };
      },
      cache: true
    }
  })

  //form enrolle sending
  $('#formEnrolles').submit(function(e){
    e.preventDefault();

    if ($('#id').val() > 0)
    validateForm('formEnrolles', 'updateEnrolles', 'PUT')
    else
    validateForm('formEnrolles', 'addEnrolles', 'POST')

    Enrolle_table.ajax.reload();
  })

  ///initialisation du datatable de versement
  var Enrolle_table = $('#datatableEnrolles').DataTable({
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
      "url": urlGetEnrolles,
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
          if (row.deleted_at == null)
          return " <button data-toggle='dropdown' class='btn btn-square btn-outline-primary'>Autres <i class='fa fa-caret-down fa-1x'></i> </button>" +
          "<div class='dropdown-menu'>" +
          "<a href='#' class='dropdown-item modifier' >MODIFIER</a>" +
          "<a href='#' class='dropdown-item toggle'>DÉSACTIVER</a>" +
          "</div>";

          else
          return " <button class='btn btn-outline-success toggle'>ACTIVER </button>" ;

        }
      },
      {
        "targets":1 ,
        "data": null,
        "render": function(data, type, row, meta) {
        return row.nomEnrolle +' '+row.prenomEnrolle
        }
      }
      ,{
        "targets":4 ,
        "data": null,
        "render": function(data, type, row, meta) {
          if (row.deleted_at != null)
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
      "data": ""
    },
    {
      "data": "telephoneEnrolle"
    },
    {
      "data": "poste.designationPostes"
    },
    {
      "data": ""
    }
    ,{
      "data": ""
    }
    ],
  });

    //modifier le postes
    $('#datatableEnrolles tbody ').on('click', '.modifier', function() {

      //obtenir les donnees de la ligne cliquée
      var data =Enrolle_table.row($(this).parents('tr')).data();
        $('#id').val(data.id)
        $('#nomEnrolles').val(data.nomEnrolle)
        $('#prenomEnrolles').val(data.prenomEnrolle)
        $('#telephoneEnrolles').val(data.telephoneEnrolle)
        $('#sexeEnrolles').val(data.sexeEnrolle).trigger('change');

        //remplir le select2 de poste
        var newOption = new Option(data.poste['designationPostes'], data.poste['id'], false, true);
        $('#posteEnrolles').append(newOption).trigger('change');

        // document.getElementById(data.sexeEnrolle).checked = true;
    })

    //desactiver le postes
    $('#datatableEnrolles tbody ').on('click', '.toggle', function() {

      //obtenir les donnees de la ligne cliquée
      var data =Enrolle_table.row($(this).parents('tr')).data();
        $('#id').val(data.id)
        reqAjax('formEnrolles', 'deleteEnrolles', 'DELETE')
        Enrolle_table.ajax.reload();
    })

    ///////////////////////////////////////////////////////fin enrollements




})
