$(function(){

  //remplir le select2js client type de noouveau client
  $('#clientTypes').select2({
    placeholder: 'Faites votre choix',
    ajax: {
      url: urlGetTypeClients,
      dataType: 'json',
      processResults: function(data) {
        return {
          results: data
        };
      },
      cache: true
    }
  })

  //////////////////////////////////envoie des formulaires/////////////////////////////////////////

  // envoie du formulaire type client
  $('#formClientTypes').submit(function(e){
    e.preventDefault();
    // $this.valid()
    // console.log('obj');
    if($('#idClientTypes').val() > 0)
    validateForm('formClientTypes', 'updateClientTypes', 'PUT')
    else
    validateForm('formClientTypes', 'addClientTypes', 'POST')

    //rechargera le datatable
    ClientType_table.ajax.reload()
  })

  // envoie du formulaire nouveau client
  $('#formClients').submit(function(e){
    e.preventDefault();
    if($('#idClients').val() > 0)
    validateForm('formClients', 'updateClients', 'PUT')
    else
    validateForm('formClients', 'addClients', 'POST')

    //rechargera le datatable
    Client_table.ajax.reload()
  })

  ///////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////// initialisation des datatables ////////////////////////

  ///initialisation du datatable de type client
  var ClientType_table = $('#datatableClientTypes').DataTable({
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
      "url": urlGetClientTypes,
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
      { responsivePriority: 2, targets: 0 },
      { responsivePriority: 2, targets: 3 },
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
        "targets": 2,
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
      "data": "designationClientTypes"
    },
    {
      "data": ""
    },
    {
      "data": ""
    }
  ],
  });

  ///initialisation du datatable de type client
  var Client_table = $('#datatableClients').DataTable({
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
      "url": urlGetClients,
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
        "targets": 4,
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
      "data": "type.designationClientTypes"
    },
    {
      "data": "nomClients"
    },
    {
      "data": "telephoneClients"
    },
    {
      "data": ""
    },
    {
      "data": ""
    }
  ],
  });


  ////////////////////////////// fin initialisation des datatables /////////////////////////////////////////



  /////////////////datatable booutoon///////////////////////////////////

    //click sur le boutton modifier de type client
    $('#datatableClientTypes tbody ').on('click', '.modifier', function() {

      //obtenir les donnees de la ligne cliquée
      var data = ClientType_table.row($(this).parents('tr')).data();
      $('#designationClientTypes').val(data.designationClientTypes)
      $('#idClientTypes').val(data.id)
    })

    //click sur le button desactiver de type client
    $('#datatableClientTypes tbody ').on('click', '.toggle', function() {

      //obtenir les donnée de la ligne cliquée
      var data = ClientType_table.row($(this).parents('tr')).data();
      $('#idClientTypes').val(data.id)
      reqAjax('formClientTypes', 'deleteClientTypes', 'DELETE')
      ClientType_table.ajax.reload();
    })

    //click sur le button desactiver de client
    $('#datatableClients tbody ').on('click', '.toggle', function() {

      //obtenir les donnée de la ligne cliquée
      var data = Client_table.row($(this).parents('tr')).data();
      $('#idClients').val(data.id)
      reqAjax('formClients', 'deleteClients', 'DELETE')
      Client_table.ajax.reload();
    })

    //click sur le boutton modifier de client
    $('#datatableClients tbody ').on('click', '.modifier', function() {

      //obtenir les donnees de la ligne cliquée
      var data = Client_table.row($(this).parents('tr')).data();
      console.log('obj');
      $('#nomClients').val(data.nomClients)
      $('#telephoneClients').val(data.telephoneClients)
      $('#emailClients').val(data.emailClients)
      $('#idClients').val(data.id)

      //remplir le select2 type client de nouveau client
      var newOption = new Option(data.type['designationClientTypes'], data.type['id'], false, true);
      $('#clientTypes').append(newOption).trigger('change');

    })

  ////////////////////end datatable button /////////////////



})
