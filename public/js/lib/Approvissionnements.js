$(function(){
  var ligne = 0;
  var Send ={};


  //remplir le select2js fournisseurs produits de noouvelle approvissionnements
  $('#produitApprovissionnements').select2({
    placeholder: 'Faites votre choix',
    ajax: {
      url: urlGetFournisseurProduits,
      dataType: 'json',
      data: function(params) {
        return {
          idFournisseurs: $('#fournisseurApprovissionnements').val()
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


  $('.addRow').click(function(e){
    var pu = sommeTotal= 0;
    var fournisseurApprovissionnements = $('#fournisseurApprovissionnements').val()
    var produitApprovissionnements = $('#produitApprovissionnements').val()
    var quantiteApprovissionnements = $('#quantiteApprovissionnements').val()
    var prixUnitaireApprovissionnements  = $('#prixUnitaireApprovissionnements').val()
    var conditionnement  = $('#conditionnement').val()
    pu =(prixUnitaireApprovissionnements >0)? prixUnitaireApprovissionnements:1;
    sommeTotal = parseInt(quantiteApprovissionnements * pu)

    var labelFournisseur = document.getElementById('fournisseurApprovissionnements')[document.getElementById('fournisseurApprovissionnements').selectedIndex].innerHTML;
    var labelProduit = document.getElementById('produitApprovissionnements')[document.getElementById('produitApprovissionnements').selectedIndex].innerHTML;
    var labelPack = document.getElementById('conditionnement')[document.getElementById('conditionnement').selectedIndex].innerHTML;
    var markup = "<tr><td><input type='checkbox' name='record' id=" + ligne + "></td><td>" + labelFournisseur + "</td><td>" + labelProduit + "</td><td>" + labelPack + "</td><td>" + quantiteApprovissionnements + "</td><td>" + prixUnitaireApprovissionnements + "</td><td>" + sommeTotal + "</td></tr>";
    if (fournisseurApprovissionnements && produitApprovissionnements && sommeTotal > 0) {
      $(".approvissionnements").append(markup);
      Send[ligne] = {
        'conditionnement': conditionnement,
        'fournisseurApprovissionnements': fournisseurApprovissionnements,
        'produitApprovissionnements': produitApprovissionnements,
        'quantiteApprovissionnements': quantiteApprovissionnements,
        'prixUnitaireApprovissionnements': prixUnitaireApprovissionnements,
        'idApprovissionnements': $('#idApprovissionnements').val(),
      }

      // console.log(Send);
      // cleanForm('formApprovissionnements')
      $('#fournisseurApprovissionnements').val(null).trigger('change');
      $('#produitApprovissionnements').val(null).trigger('change');
      $('#conditionnement').val(null).trigger('change');
      $('#quantiteApprovissionnements').val(' ')
      $('#prixUnitaireApprovissionnements').val(' ')
      ligne++;
    }

  })

  //pour supprimer une ligne de remises
  $('.delRow').click(function(e) {
    $(".approvissionnements").find('input[name="record"]').each(function() {
      if ($(this).is(":checked")) {
        $(this).parents("tr").remove();

        // console.log(Send[this.id]);
        delete Send[this.id];
        console.log(Send);
      }
    })
  })

//envoyer le formulaire
  $('#formApprovissionnements').submit(function(e){
    e.preventDefault();

    if (ligne > 0) {
      if ($('#idApprovissionnements').val() > 0)
        reqAjax('formApprovissionnements', 'updateApprovissionnements', 'PUT',Send)
      else
        reqAjax('formApprovissionnements', 'addApprovissionnements', 'POST', Send)

      Approvissionnement_table.ajax.reload();
      $(".approvissionnements").find('input[name="record"]').each(function() {
        $(this).parents("tr").remove();
        delete Send[this.id];
      })
    }
  })

  ///initialisation du datatable de type client
  var Approvissionnement_table = $('#datatableApprovissionnement').DataTable({
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
      "url": urlGetApprovissionnements,
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
        "targets": 2,
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

    ],
    "columns": [{
      "data": "id"
    },
    {
      "data": "identifiant"
    },

  ],
});

  //click on Annuler
  $('.btnAnnuler').click(function(){
    $(".approvissionnements").find('input[name="record"]').each(function() {
      $(this).parents("tr").remove();
      delete Send[this.id];
    })
    cleanForm('formApprovissionnements')
  })

  /////////////////datatable booutoon///////////////////////////////////
  //click sur le boutton modifier de prix
  $('#datatableApprovissionnement tbody ').on('click', '.modifier', function() {
    ligne =0;
    var cashConditionnement = [];

    cashConditionnement[30] = 'carton de 30';
    cashConditionnement[24] = 'carton de 24';
    cashConditionnement[12] = 'Pack de 12';
    cashConditionnement[6] = 'Pack de 6';
    cashConditionnement[1] = 'Bouteille';

    console.log(cashConditionnement);

    $(".approvissionnements").find('input[name="record"]').each(function() {
      $(this).parents("tr").remove();
      delete Send[this.id];
    })

    //obtenir les donnees de la ligne cliquée
    var data = Approvissionnement_table.row($(this).parents('tr')).data();
    console.log(data);
    $('#idApprovissionnements').val(data.id)

    $.each(data.produits,function(key,value){
      if(value['deleted_at'] == null){
        var markup = "<tr><td><input type='checkbox' name='record' id=" + ligne + "></td><td>" + value.fournisseurs['nomFournisseurs'] + "</td><td>" + value.prods['designationProduits'] + "</td><td>" + cashConditionnement[value['conditionnement']] + "</td><td>" + value['quantite'] + "</td><td>" + value['prixUnitaire'] + "</td><td>" + value['prixTotal'] + "</td></tr>";

        $(".approvissionnements").append(markup);

        // fill data to send for update
        Send[ligne] = {
          'conditionnement': value['conditionnement'],
          'fournisseurApprovissionnements': value['fournisseurs_id'],
          'produitApprovissionnements': value['produits_id'],
          'quantiteApprovissionnements': value['quantite'],
          'prixUnitaireApprovissionnements': value['prixUnitaire'],
          'idApprovissionnements': $('#idApprovissionnements').val(),
        }

        ligne++;
      }
    })
    $('.nav a:nth-child(1)').tab('show');
  })

  //click sur le button desactiver de prix
  $('#datatableApprovissionnement tbody ').on('click', '.toggle', function() {

    //obtenir les donnée de la ligne cliquée
    var data = Approvissionnement_table.row($(this).parents('tr')).data();
    $('#idApprovissionnements').val(data.id)
    reqAjax('formApprovissionnements', 'deleteApprovissionnements', 'DELETE')
    Approvissionnement_table.ajax.reload();
    cleanForm('formApprovissionnements')
  })
  ////////////////////end datatable button /////////////////

})
