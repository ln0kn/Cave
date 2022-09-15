
$(function(){
console.log('obj1');

  var ligne = 0;
  var Send = {};
  var dataToSend = {};
  // var remise;
  //for montant total de la vente
  var mtn = 0;
  // sera utiliser comme index pour mettre les info des clients
  var first = 0;

  ////////////////////////////////////////////////// versement traitement
  ///////////////////////////// form versement envoie
  $('#formVersements').submit(function(e){
    e.preventDefault();

    if($('#idVersements').val() > 0)
    validateForm('formVersements', 'updateVersements', 'PUT')
    else
    validateForm('formVersements', 'addVersements', 'POST')

    //rechargera le datatable
    Versement_table.ajax.reload()
  })

  ///initialisation du datatable de versement
  var Versement_table = $('#datatableVersements').DataTable({
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
      "url": urlGetVersements,
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
      // {
      //   "targets": -1,
      //   "data": null,
      //   "render": function(data, type, row, meta) {
      //     if (row.deleted_at == null)
      //     return " <button data-toggle='dropdown' class='btn btn-square btn-outline-primary'>Autres <i class='fa fa-caret-down fa-1x'></i> </button>" +
      //     "<div class='dropdown-menu'>" +
      //     "<a href='#' class='dropdown-item modifier' >MODIFIER</a>" +
      //     "<a href='#' class='dropdown-item toggle'>DÉSACTIVER</a>" +
      //     "</div>";
      //
      //     else
      //     return " <button class='btn btn-outline-success toggle'>ACTIVER </button>" ;
      //
      //   }
      // },
      {
        "targets": 2,
        "data": null,
        "render": function(data, type, row, meta) {

          return row.client.nomClients +' - '+ row.client.telephoneClients;
        }
      }
    ],
    "columns": [{
      "data": "id"
    },
    {
      "data": "dateVersements"
    },
    {
      "data": "client.nomClients"
    },
    {
      "data": "montantVersement"
    },

  ],
});


  ///initialisation du datatable de versement
  var Credit_table = $('#datatableCredits').DataTable({
    responsive: true,
    // bLengthChange: false,
    // searching: false,
    // autoWidth: !1,
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
      "url": urlGetCredits,
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
        "targets": 1,
        "data": null,
        "render": function(data, type, row, meta) {

          return row.nomClients ;
          // return row.client.nomClients +' - '+ row.client.telephoneClients;
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
      "data": "sommeActuel"
    },  
    {
      "data": ""
    }
  ],
  });
  //
  // $($.fn.dataTable.tables(true)).DataTable().columns.adjust();




  ////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////// dons

  //
  $('#familleProduit').change(function() {
  $('#produitVentes').val(null).trigger('change');
})

  //remplir le select2js produit vendus
  $('#produitVentes').select2({
    placeholder: 'Faites votre choix',
    ajax: {
      url: urlGetFamilleProduits,
      dataType: 'json',
      data: function(params) {
        return {
          idProduit: $('#familleProduit').val()
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

  //ajouter un ligne au tableau des produits a donner
  $('.addRow').click(function(e) {
    first = ligne;
    var sommeTotal = 0;
    var familleProduit = $('#familleProduit').val()
    var produitVentes = $('#produitVentes').val()
    var conditionnementVentes = $('#conditionnementVentes').val()
    var quantiteVentes = $('#quantiteVentes').val()
    sommeTotal = parseInt(quantiteVentes * conditionnementVentes)
    mtn += sommeTotal
    console.log(mtn);
    console.log(sommeTotal);

    var labelPack = document.getElementById('conditionnementVentes')[document.getElementById('conditionnementVentes').selectedIndex].innerHTML;
    var labelProduit = document.getElementById('produitVentes')[document.getElementById('produitVentes').selectedIndex].innerHTML;
    var labelClient = document.getElementById('nomClient')[document.getElementById('nomClient').selectedIndex].innerHTML;

    var markup = "<tr><td><input type='checkbox' name='record' id=" + ligne + "></td><td>" + labelClient + "</td><td>" + labelProduit + "</td><td>" + quantiteVentes + "</td><td>" + labelPack + "</td></tr>";
    if (produitVentes && conditionnementVentes && sommeTotal > 1 && labelClient) {
      $(".dons").append(markup);
      $('#qteDons').html(mtn);
      Send[ligne] = {
        'familleProduit': familleProduit,
        'produitVentes': produitVentes,
        'quantiteVentes': quantiteVentes,
        'client': $('#nomClient').val(),
        'conditionnementVentes': conditionnementVentes,
        'mtn': sommeTotal,
        'idDons': $('#idDons').val(),
        // 'infoVersement': $('#infoVersement').val(),

      }
      console.log(Send);


      $('#familleProduit').val(null).trigger('change');
      $('#conditionnementVentes').val(null).trigger('change');

      $('#produitVentes').val(null).trigger('change');
      $('#quantiteVentes').val(' ')
      // $('#nomClient').val(null)
      ligne++;
    }
  })


  //submit le formulaire des Dons
  $('#formDons').submit(function(e){
    e.preventDefault();

    if(ligne > 0){
      if ($('#idDons').val() > 0)
      reqAjax('formDons', 'updateDons', 'PUT', Send)
      else
      reqAjax('formDons', 'addDons', 'POST', Send)

      Don_table.ajax.reload();
      $(".dons").find('input[name="record"]').each(function() {
        $(this).parents("tr").remove();
        $('#qteDons').html(0)
        delete Send[this.id];
      })
    }
  })

  //supprimer ligne quand on clique sur supprimer ligne
  //pour supprimer un ligne du tableau des produits a vendre
  $('.delRow').click(function(e){
    $(".dons").find('input[name="record"]').each(function() {
      if ($(this).is(":checked")) {
        $(this).parents("tr").remove();

        sm = Send[this.id]['quantiteVentes'] * Send[this.id]['conditionnementVentes']
        smm = parseInt($('#qteDons').html()) - parseInt(sm)

        $('#qteDons').html(smm)
        mtn = smm;
        console.log(mtn);

        delete Send[this.id];
      }
    })
  })

    ///initialisation du datatable de type client
  var Don_table = $('#datatableDons').DataTable({
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
        "url": urlGetDons,
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
            return " <button class='btn btn-outline-success toggle'>ACTIVER </button>";

          }
        }

      ],
      "columns": [{
        "data": "id"
      },
      {
        "data": "identifiantDons"
      },
      {
        "data": ""
      }
    ],
    });

    //modifier le don
  $('#datatableDons tbody ').on('click', '.modifier', function() {
      // $('#qteDons').html(0);
      var st =0
      ligne = 0;
      var cashConditionnement = [];
      cashConditionnement[30] = 'carton de 30';
      cashConditionnement[24] = 'carton de 24';
      cashConditionnement[12] = 'Pack de 12';
      cashConditionnement[6] = 'Pack de 6';
      cashConditionnement[1] = 'Bouteille';

      $(".dons").find('input[name="record"]').each(function() {
        $(this).parents("tr").remove();
        delete Send[this.id];
      })


    //obtenir les donnees de la ligne cliquée
    var data = Don_table.row($(this).parents('tr')).data();
    console.log(data);

    $('#idDons').val(data.id)

    //create line of product buy
    $.each(data.produits, function(key, value) {
      console.log(value);
      var markup = "<tr><td><input type='checkbox' name='record' id=" + ligne + "></td><td>" + value.client['nomClients']  + "</td><td>" +value.prod['designationProduits']  + "</td><td>" + value['quantiteProduitDons'] + "</td><td>" +cashConditionnement[value['conditionnement']]  + "</td></tr>";
      $(".dons").append(markup);
      st += value['conditionnement'] * value['quantiteProduitDons']
      // $('nomClient').val(value['clients_id'])


      Send[ligne] = {
        'familleProduit': ' ',
        'produitVentes': value['produits_id'],
        'quantiteVentes': value['quantiteProduitDons'],
        'client': value['clients_id'],
        'conditionnementVentes': value['conditionnement'],
        // 'mtn': sommeTotal,
        'idDons': $('#idDons').val(),
      }

      ligne++;
    })
      $('#qteDons').html(st);
  })



})
