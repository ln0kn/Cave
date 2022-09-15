$(function(){
  $(".nav a").on("shown.bs.tab", function (e) {
    // console.log( 'show tab' );
    $($.fn.dataTable.tables(true)).DataTable()
    .columns.adjust()
    .responsive.recalc();
  });


  //remplir le select2js famille produits de noouveau produit
  $('#familleProduits').select2({
    placeholder: 'Faites votre choix',
    ajax: {
      url: urlGetFamilles,
      dataType: 'json',
      processResults: function(data) {
        return {
          results: data
        };
      },
      cache: true
    }
  })

  //remplir le select2js marque produits de noouveau produit
  $('#marqueProduits').select2({
    placeholder: 'Faites votre choix',
    ajax: {
      url: urlGetMarques,
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

  // envoie du formulaire famille produit
  $('#formFamilleProduits').submit(function(e){
    e.preventDefault();
    // $this.valid()
    // console.log('obj');
    if($('#id').val() > 0)
    validateForm('formFamilleProduits', 'updateFamilleProduits', 'PUT')
    else
    validateForm('formFamilleProduits', 'addFamilleProduits', 'POST')

    //rechargera le datatable
    FamilleProduit_table.ajax.reload()
  })

  // envoie du formulaire marque produit
  $('#formMarqueProduits').submit(function(e){
    e.preventDefault();
    if($('#idMarqueProduits').val() > 0)
    validateForm('formMarqueProduits', 'updateMarqueProduits', 'PUT')
    else
    validateForm('formMarqueProduits', 'addMarqueProduits', 'POST')

    //rechargera le datatable
    MarqueProduit_table.ajax.reload()
  })

  // envoie du formulaire  produit
  $('#formProduits').submit(function(e){
    e.preventDefault();
    if($('#idProduits').val() > 0)
    validateForm('formProduits', 'updateProduits', 'PUT')
    else
    validateForm('formProduits', 'addProduits', 'POST')

    //rechargera le datatable
    Produit_table.ajax.reload()
  })
  ////////////////////////////////////Fin envoie des formulaires//////////////////////////////////


  //////////////////////////////////////// initialisation des datatables ////////////////////////

  ///initialisation du datatable de famille produit
  var FamilleProduit_table = $('#datatableFamilleProduits').DataTable({
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
      "url": urlGetFamilleProduits,
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
      "data": "nomFamilleProduits"
    },
    {
      "data": ""
    },
    {
      "data": ""
    }
  ],
});

  ///initialisation du datatable de marque produit
  var MarqueProduit_table = $('#datatableMarqueProduits').DataTable({
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
      "url": urlGetMarqueProduits,
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
      "data": "nomMarqueProduits"
    },
    {
      "data": ""
    },
    {
      "data": ""
    }
  ],
  });

  ///initialisation du datatable de  produit
  var Produit_table = $('#datatableProduits').DataTable({
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
      "url": urlGetProduits,
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
      // { responsivePriority: 1, targets: 1 },
      // { responsivePriority: 1, targets: -1 },
      { responsivePriority: 10005, targets: 1 },
      { responsivePriority: 10007, targets: 2 },
      { responsivePriority: 10009, targets: 3 },
      { responsivePriority: 10004, targets: 4 },
      // { responsivePriority: 10008, targets: 6 },

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
        "targets": 5,
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
      "data": "designationProduits"
    },
    {
      "data": "seuilAlerte"
    },
    {
      "data": "famille.nomFamilleProduits"
    },
    {
      "data": "marque.nomMarqueProduits"
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

  //click sur le boutton modifier de famille produit
  $('#datatableFamilleProduits tbody ').on('click', '.modifier', function() {

    //obtenir les donnees de la ligne cliquée
    var data = FamilleProduit_table.row($(this).parents('tr')).data();
    $('#nomFamilleProduits').val(data.nomFamilleProduits)
    $('#id').val(data.id)
  })

  //click sur le button desactiver de famille produit
  $('#datatableFamilleProduits tbody ').on('click', '.toggle', function() {

    //obtenir les donnée de la ligne cliquée
    var data = FamilleProduit_table.row($(this).parents('tr')).data();
    $('#id').val(data.id)
    reqAjax('formFamilleProduits', 'deleteFamilleProduits', 'DELETE')
    FamilleProduit_table.ajax.reload();
  })

  //click sur le boutton modifier de marque produit
  $('#datatableMarqueProduits tbody ').on('click', '.modifier', function() {

    //obtenir les donnees de la ligne cliquée
    var data = MarqueProduit_table.row($(this).parents('tr')).data();
    $('#nomMarqueProduits').val(data.nomMarqueProduits)
    $('#idMarqueProduits').val(data.id)
  })

  //click sur le button desactiver de marque produit
  $('#datatableMarqueProduits tbody ').on('click', '.toggle', function() {

    //obtenir les donnée de la ligne cliquée
    var data = MarqueProduit_table.row($(this).parents('tr')).data();
    $('#idMarqueProduits').val(data.id)
    reqAjax('formMarqueProduits', 'deleteMarqueProduits', 'DELETE')
    MarqueProduit_table.ajax.reload();
  })

  //click sur le button desactiver de  produit
  $('#datatableProduits tbody ').on('click', '.toggle', function() {

    //obtenir les donnée de la ligne cliquée
    var data = Produit_table.row($(this).parents('tr')).data();
    $('#idProduits').val(data.id)
    reqAjax('formProduits', 'deleteProduits', 'DELETE')
    Produit_table.ajax.reload();
  })

  //click sur le button modifier de  produit
  $('#datatableProduits tbody ').on('click', '.modifier', function() {

    //obtenir les donnée de la ligne cliquée
    var data = Produit_table.row($(this).parents('tr')).data();
    console.log(data.famille['nomFamilleProduits']);
    $('#idProduits').val(data.id)
    $('#designationProduits').val(data.designationProduits)
    $('#seuilAlerte').val(data.seuilAlerte)

    //remplir le select2 famille produits de nouveau produit
    var newOption = new Option(data.famille['nomFamilleProduits'], data.famille['id'], false, true);
    $('#familleProduits').append(newOption).trigger('change');

    //remplir le select2 marque produits de nouveau produit
    var newOption = new Option(data.marque['nomMarqueProduits'], data.marque['id'], false, true);
    $('#marqueProduits').append(newOption).trigger('change');

  })

////////////////////end datatable button /////////////////

  //click sur le btn annuler
  $('.btnAnnuler').click(function(){
    cleanForm('formFamilleProduits')
    // cleanForm('')
  })

})
