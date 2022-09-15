$(function() {
  var Send ={} ;
  ligne = 0;
  //remplir le select2js client type de noouveau prix
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

  //remplir le select2js produit de noouveau prix
  $('#produits').select2({
    placeholder: 'Faites votre choix',
    ajax: {
      url: urlGetProduitPrix,
      dataType: 'json',
      processResults: function(data) {
        return {
          results: data
        };
      },
      cache: true
    }
  })

  // envoie du formulaire type client
  $('#formPrix').submit(function(e) {
    e.preventDefault();

    if ($('#idPrix').val() > 0)
    validateForm('formPrix', 'updatePrix', 'PUT')
    else
    validateForm('formPrix', 'addPrix', 'POST')

    //rechargera le datatable
    Prix_table.ajax.reload()
  })

  //////////////////////////////////////// initialisation des datatables ////////////////////////
  ///initialisation du datatable de type client
//   var Prix_table = $('#datatablePrix').DataTable({
//     responsive: true,
//     bLengthChange: false,
//     searching: false,
//     autoWidth: !1,
//     language: {
//       searchPlaceholder: 'Chercher...',
//       sSearch: '',
//       lengthMenu: '_MENU_ lignes/page',
//       oPaginate: {
//         "sFirst": "Premier",
//         "sLast": "Dernier",
//         "sNext": "Suivant",
//         "sPrevious": "Précédent"
//       },
//       sZeroRecords: "Aucun résultat trouvé",
//       sEmptyTable: "Aucune donnée disponible",
//       sInfo: "Lignes _START_ à _END_ sur _TOTAL_",
//     },
//
//     "ajax": {
//       "url": urlGetPrix,
//       "deferRender": true,
//       "dataSrc": ""
//     },
//     "order": [
//       [0, "desc"]
//     ],
//     "columnDefs": [
//       //cache la colonne des id
//       {
//         "targets": 0,
//         "visible": false
//       },
//       {
//         "targets": -1,
//         "data": null,
//         "render": function(data, type, row, meta) {
//           if (row.deleted_at == null)
//           return " <button data-toggle='dropdown' class='btn btn-square btn-outline-primary'>Autres <i class='fa fa-caret-down fa-1x'></i> </button>" +
//           "<div class='dropdown-menu'>" +
//           "<a href='#' class='dropdown-item modifier' >MODIFIER</a>" +
//           "<a href='#' class='dropdown-item toggle'>DÉSACTIVER</a>" +
//           "</div>";
//
//           else
//           return " <button class='btn btn-outline-success toggle'>ACTIVER </button>";
//
//         }
//       },
//       // {
//       //   "targets": 4,
//       //   "data": null,
//       //   "render": function(data, type, row, meta) {
//       //     if (row.deleted_at != null)
//       //     return 'Désactivé';
//       //     else
//       //     return 'Activé';
//       //   }
//       // }
//     ],
//     "columns": [{
//       "data": "id"
//     },
//     {
//       "data": "types.designationClientTypes"
//     },
//     {
//       "data": "produits.designationProduits"
//     },
//     {
//       "data": "produitPrix"
//     }
//
//     , {
//       "data": ""
//     }
//   ],
// });


///initialisation du datatable de remise
var Remise_table = $('#datatableRemise').DataTable({
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
    "url": urlGetRemises,
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
    },
    {
      "targets": 2,
      "data": null,
      "render": function(data, type, row, meta) {
        return '[ '+row.minimumAchatRemises +' - '+row.maximumAchatRemises+' ]';
      }
    }
  ],
  "columns": [{
    "data": "id"
  },
  {
    "data": "designationRemises"
  },
  {
    "data": ""
  },
  {
    "data": "pourcentageRemises"
  }

  , {
    "data": ""
  }
],
});
////////////////////////////////////////////////////////////////////////////

/////////////////datatable booutoon///////////////////////////////////
//click sur le boutton modifier de prix
$('#datatablePrix tbody ').on('click', '.modifier', function() {


  //obtenir les donnees de la ligne cliquée
  var data = Prix_table.row($(this).parents('tr')).data();
  $('#designationPrix').val(data.designationPrix)
  $('#idPrix').val(data.id)
  $('#produitPrix').val(data.produitPrix)
  console.log(data);
  //remplir le select2 type client de nouveau prix
  var newOption = new Option(data.types['designationClientTypes'], data.types['id'], false, true);
  $('#clientTypes').append(newOption).trigger('change');

  //vider les select2
  // $('#produits').html('').select2();
  $('#produits').empty();;


  //remplir le select des produits
  var newOption = new Option(data.produits['designationProduits'], data.produits['id'], true, true);
  $('#produits').append(newOption).trigger('change');

})

//click sur le button desactiver de prix
$('#datatablePrix tbody ').on('click', '.toggle', function() {

  //obtenir les donnée de la ligne cliquée
  var data = Prix_table.row($(this).parents('tr')).data();
  $('#idPrix').val(data.id)
  reqAjax('formPrix', 'deletePrix', 'DELETE')
  Prix_table.ajax.reload();
})
////////////////////end datatable button /////////////////



//click sur le boutton modifier de remises
$('#datatableRemise tbody ').on('click', '.modifier', function() {

  //obtenir les donnees de la ligne cliquée
  var data = Remise_table.row($(this).parents('tr')).data();

  $('#applicationRemises').val(data.typeRemises).trigger('change');
  $('#seuilMinimumRemises').val(data.minimumAchatRemises)
  $('#seuilMaximumRemises').val(data.maximumAchatRemises)
  $('#designationRemises').val(data.designationRemises)
  $('#idRemises').val(data.id)
  $('#valeurRemises').val(data.pourcentageRemises)



})

//click sur le button desactiver de prix
$('#datatableRemise tbody ').on('click', '.toggle', function() {

  //obtenir les donnée de la ligne cliquée
  var data = Remise_table.row($(this).parents('tr')).data();
  console.log(data);
  $('#idRemises').val(data.id)
  reqAjax('formRemises', 'deleteRemises', 'DELETE')
  // reqAjax('formFamilleProduits', 'deleteFamilleProduits', 'DELETE')

  Remise_table.ajax.reload();
})
////////////////////end datatable button /////////////////
//////////////////////////////////js pour la partie remise /////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////

$('.addRow').click(function(e) {

  // e.preventDefault();

  var designationRemises = $('#designationRemises').val()
  var valeurRemises = $('#valeurRemises').val()
  var applicationRemises = $('#applicationRemises').val()
  var  min = $('#seuilMinimumRemises').val()
  var  max = $('#seuilMaximumRemises').val()
  var labelApplication = document.getElementById('applicationRemises')[document.getElementById('applicationRemises').selectedIndex].innerHTML;
  var markup = "<tr onclick=editLigne(" + ligne + ")><td><input type='checkbox' name='record' id=" + ligne + "></td><td>" + designationRemises + "</td><td>" + labelApplication + "</td><td>" + min  +" - "+max+ "</td><td>" + valeurRemises + "</td></tr>";
  if (designationRemises && valeurRemises && applicationRemises && min && max ) {
    $(".remises").append(markup);
    Send[ligne] = {
      'designationRemises': $('#designationRemises').val(),
      'valeurRemises': $('#valeurRemises').val(),
      'applicationRemises': $('#applicationRemises').val(),
      'seuilMinimumRemises': $('#seuilMinimumRemises').val(),
      'seuilMaximumRemises': $('#seuilMaximumRemises').val(),
      'idRemises': $('#idRemises').val(),
    }

    $('#designationRemises').val(' ')
    $('#valeurRemises').val(' ')
    $('#applicationRemises').val(' ')
    // $('#seuilRemises').val(' ')
    document.getElementById('seuilMinimumRemises').value=''
    document.getElementById('seuilMaximumRemises').value=''


    console.log(Send);
    // cleanForm('formRemise')
    ligne++;
  }
})

//pour supprimer une ligne de remises
$('.delRow').click(function(e) {
  $(".remises").find('input[name="record"]').each(function() {
    if ($(this).is(":checked")) {
      $(this).parents("tr").remove();

      // console.log(Send[this.id]);
      delete Send[this.id];
      // console.log(Send);
    }
  })
})

$('#saveRemise').click(function(e) {
  e.preventDefault();
  if (ligne > 0) {
    console.log(Send);
    if ($('#idRemises').val() > 0)
    reqAjax('formRemise', 'updateRemises', 'PUT',Send)
    else
    reqAjax('formRemise', 'addRemises', 'POST', Send)

    $(".remises").find('input[name="record"]').each(function() {
        $(this).parents("tr").remove();
        delete Send[this.id];
    })

  }
  //rechargera le datatable
  Remise_table.ajax.reload()
})
})
