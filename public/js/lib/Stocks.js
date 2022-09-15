$(function(){

  $(".nav a").on("shown.bs.tab", function (e) {
    // console.log( 'show tab' );
    $($.fn.dataTable.tables(true)).DataTable()
    .columns.adjust()
    .responsive.recalc();
  });



  //remplir le select2js produit de rebuts
  $('#produitRebuts').select2({
    placeholder: 'Faites votre choix',
    ajax: {
      url: urlGetProduitVentes,
      dataType: 'json',
      data: function(params) {
        return {
          idVente: $('#idVentes').val()
        };
      },
      processResults: function(data) {
        return {
          results: data
        };
      },
      cache: true
    }
  })

  ///initialisation du datatable du stock
  var Stock_table = $('#datatableStock').DataTable({
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
      "url": urlGetStocks,
      "deferRender": true,
      "dataSrc": ""
    },
    "order": [
      [1, "desc"]
    ],
    "columnDefs": [
      //cache la colonne des id
      // {
      //   "targets": 0,
      //   "visible": false
      // },
      { responsivePriority: 1, targets: 0 },
      { responsivePriority: 2, targets: -1 },
      {
        "targets": 1,
        "data": null,
        "render": function(data, type, row, meta) {
          if (row.quantiteActuel != null)
          return row.quantiteActuel;
          else
          return '0';
        }
      },
      {
        "targets": -1,
        "data": null,
        "render": function(data, type, row, meta) {
          return "<button class='btn btn-square btn-alt-info Ajustement'>Ajustement </button>";

        }
      },

    ],
    "columns": [
      {
        "data": "designationProduits"
      },
      {
        "data": ""
      },
      {
        "data": ""
      },


    ],
  });

  ///initialisation du datatable des ajustements
  var Ajustement_table = $('#datatableAjustement').DataTable({
    // responsive: true,
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
      "url": urlGetAjustements,
      "deferRender": true,
      "dataSrc": ""
    },
    "order": [
      [1, "desc"]
    ],
    "columnDefs": [
      //cache la colonne des id
      // {
      //   "targets": 0,
      //   "visible": false
      // },


    ],
    "columns": [
      {
        "data": "created_at"
      },
      {
        "data": "prods.designationProduits"
      },
      {
        "data": "stockPhysique"
      },
      {
        "data": "stockNumerique"
      },
    ],
  });



  ///initialisation du datatable des rebuts
  var Rebut_table = $('#datatableRebut').DataTable({
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
      "url": urlGetRebuts,
      "deferRender": true,
      "dataSrc": ""
    },
    "order": [
      [1, "desc"]
    ],
    "columnDefs": [
      //cache la colonne des id
      // {
      //   "targets": 0,
      //   "visible": false
      // },

      {
        "targets": 2,
        "data": null,
        "render": function(data, type, row, meta) {
          if (row.conditionnementRebuts == 1)
          return row.quantiteRebuts+" btl ";

          if (row.conditionnementRebuts == 6)
          return row.quantiteRebuts+" demi Pack ";
          if (row.conditionnementRebuts == 12)
          return row.quantiteRebuts+" Pack ";


        }
      },

    ],
    "columns": [
      {
        "data": "created_at"
      },
      {
        "data": "identifiantVentes"
      },
      {
        "data": ""
      },

    ],
  });


  //////////////////////ajustement du stock
  $('#datatableStock tbody ').on('click', '.Ajustement', function() {


    //obtenir les donnees de la ligne cliquée
    var data = Stock_table.row($(this).parents('tr')).data();
    $('#stockPhysique').val(' ')
    if(data.produits_id){
      $('#produitAjustements').val(data.produits_id).trigger('change');
      $('#stockNumerique').val(data.quantiteActuel)
    }else{
      $('#stockNumerique').val(0)
      $('#produitAjustements').val( data.id);
      $('#produitAjustements').trigger("change");


    }


    // $('#stockNumerique').val(data.quantiteActuel)
    $('.nav a:eq(1)').tab('show');
    console.log(data);

  })

  $('#formAjustements').submit(function(e){
    e.preventDefault();

    validateForm('formAjustements', 'addAjustements', 'POST')

    //rechargera le datatable
    Ajustement_table.ajax.reload()
    Stock_table.ajax.reload()

  })


  //////////////////////////////////validation du rebuts
  $('#formRebuts').submit(function(e){
    e.preventDefault();
    var labelVentes = document.getElementById('idVentes')[document.getElementById('idVentes').selectedIndex].innerHTML;
    $('#identifiantVentes').val(labelVentes);
    validateForm('formRebuts', 'addRebuts', 'POST')

    //rechargera le datatable
    Rebut_table.ajax.reload()
  })

})
