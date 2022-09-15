$(function(){

  //////////////////////////////////envoie des formulaires/////////////////////////////////////////

  // envoie du formulaire nouveau fournisseur
  $('#formFournisseurs').submit(function(e){
    e.preventDefault();
    var dataToSend={};
    var tab = [];
    produit = $('#telephoneFournisseurs').val();
    tab = produit.split(",");

    //get form fournisseur daata
    dataToSend.idFournisseurs = $('#idFournisseurs').val()
    dataToSend.nomFournisseurs = $('#nomFournisseurs').val()
    dataToSend.emailFournisseurs = $('#emailFournisseurs').val()
    dataToSend.produitFournisseurs = $('#produitFournisseurs').val()
    dataToSend.telephoneFournisseurs = tab
    dataToSend._token = $('meta[name="csrf-token"]').attr('content')


    if($('#idFournisseurs').val() > 0)
    validateForm('formFournisseurs', 'updateFournisseurs', 'PUT',dataToSend)
    else
    validateForm('formFournisseurs', 'addFournisseurs', 'POST',dataToSend)

    //rechargera le datatable
    Fournisseur_table.ajax.reload()
  })

  ///////////////////////////////////////////////////////////////////////////////////////////////

  //////////////////////////////////////// initialisation des datatables ////////////////////////

  ///initialisation du datatable de type client
  var Fournisseur_table = $('#datatableFournisseurs').DataTable({
    responsive: true,
    bLengthChange: false,
    searching: true,
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
      "url": urlGetFournisseurs,
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
      { responsivePriority: 0, targets: 4 },
      { responsivePriority: 2, targets: 0 },
      { responsivePriority: 3, targets: -1 },
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
      "data": "nomFournisseurs"
    },
    {
      "data": "tel"
    },
    {
      "data": "pro"
    }
    ,{
      "data": ""
    }
    ,{
      "data": ""
    }
  ],
  });

  ////////////////////////////// fin initialisation des datatables /////////////////////////////////////////


  /////////////////datatable booutoon///////////////////////////////////

    //click sur le button desactiver de client
    $('#datatableFournisseurs tbody ').on('click', '.toggle', function() {

      //obtenir les donnée de la ligne cliquée
      var data = Fournisseur_table.row($(this).parents('tr')).data();
      $('#idFournisseurs').val(data.id)
      reqAjax('formFournisseurs', 'deleteFournisseurs', 'DELETE')
      Fournisseur_table.ajax.reload();
    })

    //click sur le boutton modifier de client
    $('#datatableFournisseurs tbody ').on('click', '.modifier', function() {

      $('#produitFournisseurs').val(null).trigger('change');
      // $('#telephoneFournisseurs').tagsinput('removeAll');


      //obtenir les donnees de la ligne cliquée
      var data = Fournisseur_table.row($(this).parents('tr')).data();
      console.log(data);
      $('#nomFournisseurs').val(data.nomFournisseurs)
      // $('#telephoneFournisseurs').val(data.telephoneFournisseurs)
      $('#emailFournisseurs').val(data.emailFournisseurs)
      $('#idFournisseurs').val(data.id)

      var tableau = [];
      //remplir le select2
      $.each(data.produits, function (key, value) {
        var newOption = new Option(value['designationProduits'], value['id'], false, true);
        tableau[key] = value['id']

        // $('#produitFournisseurs').append(newOption).trigger('change');
      });
      console.log(tableau);
      $('#produitFournisseurs').val(tableau).trigger('change');

      //remplir les numeros de telephones
      $.each(data.telephones, function (key, value) {
        console.log(value['numeroFournisseurTelephone']);
        $('#telephoneFournisseurs').addTag(value['numeroFournisseurTelephone']);
      });

    })

  ////////////////////end datatable button /////////////////



})
