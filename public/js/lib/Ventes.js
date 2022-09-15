$(function() {
  $('.client2').hide()
  var ligne = 0;
  var Send = {};
  // var dataToSend = {};
  var remise;
  //for montant total de la vente
  var mtn = 0;
  // sera utiliser comme index pour mettre les info des clients
  var first = 0;

  // initialise date
  $('#dateJourneeClotures').datepicker({
    format: 'dd-mm-yyyy',
    // startDate: '-3d'
  });

  // clear produit field when famille produit value was changed
  $('#familleProduit').change(function() {
    $('#produitVentes').val(null).trigger('change');
  })

  // clear client et display nom client field
  $('#typeClient').change(function() {
    $('#client').val(null).trigger('change');
    $('#nomClient').val(' ');
    if ($('#typeClient').val() == 1) {
      $('.client1').hide()
      $('.client2').show()
    } else {
      $('.client1').show()
      $('.client2').hide()
    }
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

  //remplir le select2js fclient
  $('#client').select2({
    placeholder: 'Faites votre choix',
    ajax: {
      url: urlGetClientVentes,
      dataType: 'json',
      data: function(params) {
        return {
          idType: $('#typeClient').val()
        };
      },
      processResults: function(data) {
        frequence = data
        return {
          results: data
        };
      },
      cache: true
    }
  })

  //remplir le select2js remises
  $('#remiseVentes').select2({
    placeholder: 'Faites votre choix',
    ajax: {
      url: urlGetRemiseVentes,
      dataType: 'json',
      data: function(params) {
        return {
          idType: $('#typeClient').val()
        };
      },
      processResults: function(data) {
        remise = data
        return {
          results: data
        };
      },
      cache: true
    }
  })

  //choose an remise to apply
  $('#remiseVentes').change(function() {
    console.log(remise);
    var cent = 0; //montant a diminuer de la facture
    var remiseVal = $('#remiseVentes').val();
    var cls = $('#client').val()
    $.each(remise, function(key, value) {
      if(remiseVal == value['id']){
        if(value['type'] == 0){
          if (mtn > value['min'] && mtn < value['max'] ) {
            cent = value['cent'];
            if (value['cent'] >= 100) {
              $('#sommeAPayer').val(parseInt(mtn-cent))
              $('#sommeRestante').val(parseInt(mtn-cent))
            }else{
              $('#sommeAPayer').val(parseInt(mtn-mtn*cent/100))
              $('#sommeRestante').val(parseInt(mtn-mtn*cent/100))
            }
          }
        }else{
          $.each(frequence, function(key, val) {
            if(cls == val['id']){
              if (val['hz'] > value['min'] && val['hz'] < value['max'] ) {
                cent = value['cent'];
                if (value['cent'] >= 100) {
                  $('#sommeAPayer').val(parseInt(mtn-cent))
                  $('#sommeRestante').val(parseInt(mtn-cent))
                }else{
                  $('#sommeAPayer').val(parseInt(mtn-mtn*cent/100))
                  $('#sommeRestante').val(parseInt(mtn-mtn*cent/100))
                }

              }else{
                $('#sommeAPayer').val(parseInt(mtn))
                $('#sommeRestante').val(parseInt(mtn))
              }

            }
          })
        }
      }

    })


  })

  //display amount remaining
  $('#sommePayer').blur(function() {
    var sp = ($('#sommePayer').val() > 0) ? $('#sommePayer').val() : 0;
    var spa = $('#sommeAPayer').val();
    var sr = parseInt(sp) - parseInt(spa);

    $('#sommeRestante').val(sr)
  })

  //ajouter un ligne au tabliea des produits a vendre
  $('.addRow').click(function(e) {console.log(mtn);
    first = ligne;
    var sommeTotal = 0;
    var familleProduit = $('#familleProduit').val()
    var produitVentes = $('#produitVentes').val()
    var conditionnementVentes = $('#conditionnementVentes').val()
    var prixUnitaireVentes = $('#prixUnitaireVentes').val()
    var quantiteVentes = $('#quantiteVentes').val()
    sommeTotal = parseInt(quantiteVentes * prixUnitaireVentes)
    mtn += sommeTotal
    console.log(mtn);

    var labelPack = document.getElementById('conditionnementVentes')[document.getElementById('conditionnementVentes').selectedIndex].innerHTML;
    var labelProduit = document.getElementById('produitVentes')[document.getElementById('produitVentes').selectedIndex].innerHTML;
    var markup = "<tr><td><input type='checkbox' name='record' id=" + ligne + "></td><td>" + labelProduit + "</td><td>" + labelPack + "</td><td>" + quantiteVentes + "</td><td>" + prixUnitaireVentes + "</td><td>" + sommeTotal + "</td></tr>";
    if (produitVentes && conditionnementVentes && sommeTotal > 1) {
      $(".ventes").append(markup);
      $('#mtnVente').html(mtn);
      Send[ligne] = {
        'familleProduit': familleProduit,
        'produitVentes': produitVentes,
        'quantiteVentes': quantiteVentes,
        'prixUnitaireVentes': prixUnitaireVentes,
        'conditionnementVentes': conditionnementVentes,
        'mtn': mtn,
        'idVentes': $('#idVentes').val(),
        // 'infoVersement': $('#infoVersement').val(),

      }
      console.log(mtn);


      $('#familleProduit').val(null).trigger('change');
      $('#conditionnementVentes').val(null).trigger('change');

      $('#produitVentes').val(null).trigger('change');
      $('#quantiteVentes').val(' ')
      $('#infoVersement').val(' ')
      $('#prixUnitaireVentes').val(' ')
      ligne++;


      $('#sommeAPayer').val(mtn)
      $('#sommeRestante').val(mtn)
    }
  })

  //pour supprimer un ligne du tableau des produits a vendre
  $('.delRow').click(function(e) {
    $(".ventes").find('input[name="record"]').each(function() {
      if ($(this).is(":checked")) {
        $(this).parents("tr").remove();

        sm = Send[this.id]['quantiteVentes'] * Send[this.id]['prixUnitaireVentes']
        smm = parseInt($('#mtnVente').html()) - parseInt(sm)

        console.log(sm);
        console.log(smm);
        // console.log(obj);
        $('#mtnVente').html(smm)
        mtn = smm;
        console.log(mtn);

        // sap =parseInt($('#sommeAPayer').val())-sm
        // $('#sommeAPayer').val(sap)


        delete Send[this.id];
        $('#sommeAPayer').val(mtn)
        $('#sommeRestante').val(mtn)
      }
    })
  })

  $('#next').click(function() {
    if (Object.getOwnPropertyNames(Send).length > 0) {
      console.log('obj');
      $('.nav a:eq(4)').tab('show');
    } else {

    }

  })


  //send formulaire
  $('#formVentes').submit(function(e) {
    e.preventDefault();
    var dataToSend = {};
    var typeC;
    var idC;

    var sommePayer = $('#sommePayer').val();
    var vers = $('#typeVersement').val();

    typeC = $('#typeClient').val();
    // lacheruer est ub client ordianires
    if (typeC == 1) {
      nomClient = $('#nomClient').val();

    } else {
      nomClient = document.getElementById('client')[document.getElementById('client').selectedIndex].innerHTML;
      idC = $('#client').val();
    }
    console.log(nomClient);

    $.each(Send, function(key, value) {
      dataToSend[key] = {
        'familleProduit': value['familleProduit'],
        'produitVentes': value['produitVentes'],
        'quantiteVentes': value['quantiteVentes'],
        'prixUnitaireVentes': value['prixUnitaireVentes'],
        'conditionnementVentes': value['conditionnementVentes'],
        'infoVersement': $('#infoVersement').val(),
        'mtn': $('#mtnVente').html(),
        'sommePayer': sommePayer,
        'sommeAPayer': $('#sommeAPayer').val(),
        'sommeRestante': $('#sommeRestante').val(),
        'typeClient': typeC,
        'nomClient': nomClient,
        'idClient': idC,
        'idRemise': ($('#remiseVentes').val()) ? $('#remiseVentes').val() : ' ',
        'idVentes': value['idVentes'],
        'typeVersement': vers,
      }
    })
    var typeC = ' ';
    var varC = ' ';
    var varCli = ' ';
    var nomClinet = ' ';
    var idClinet = ' ';

    if ($('#idVentes').val() > 0)
      reqAjax('formVentes', 'updateVentes', 'PUT', dataToSend)
    else
      jsp = reqAjax('formVentes', 'addVentes', 'POST', dataToSend)


      $(".ventes").find('input[name="record"]').each(function() {
        $(this).parents("tr").remove();
        delete Send[this.id];
      })

    Vente_table.ajax.reload();

    $('#remiseVentes').val(null).trigger('change');
    $('#client').val(null).trigger('change');
    $('#nomClient').val(' ')
    mtn = 0;
    $('#mtnVente').val(mtn)
    $('#sommeAPayer').val(mtn)
    $('#sommeRestante').val(mtn)
    $('#idVentes').val(' ')

    console.log(Send);
  })

  ///initialisation du datatable de type client
  var Vente_table = $('#datatableVente').DataTable({
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
      "url": urlGetVentes,
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
      },{ responsivePriority: 1, targets: 0 },
      { responsivePriority: 2, targets: -1 },
      {
        "targets": -1,
        "data": null,
        "render": function(data, type, row, meta) {
          if (row.deleted_at == null)
            return " <button data-toggle='dropdown' class='btn btn-square btn-outline-primary'>Autres <i class='fa fa-caret-down fa-1x'></i> </button>" +
              "<div class='dropdown-menu'>" +
              "<a href='#' class='dropdown-item modifier' >MODIFIER</a>" +
              "<a href='#' class='dropdown-item cancell' >ANNULER</a>" +
              "<a href='#' class='dropdown-item facture'>FACTURE</a>" +
              "</div>";

          else
            return " <button class='btn btn-outline-success toggle'>ACTIVER </button>";

        }
      }
      ,{
        "targets": -2,
        "data": null,
        "render": function(data, type, row, meta) {
          if (row.produits.length > 0)
          return "Activer"
          else
            return " Annuler";
        }
      }
    ],
    "columns": [{
        "data": "id"
      },
      {
        "data": "identifiantVentes"
      },
      {
        "data": "nomClients"
      },
      {
        "data": ""
      },
      {
        "data": ""
      }
    ],
  });

  /////////////////datatable booutoon///////////////////////////////////
  //click sur le boutton modifier de vente
  $('#datatableVente tbody ').on('click', '.modifier', function() {
    ligne = 0;
    var cashConditionnement = [];
    cashConditionnement[30] = 'carton de 30';
    cashConditionnement[24] = 'carton de 24';
    cashConditionnement[12] = 'Pack de 12';
    cashConditionnement[6] = 'Pack de 6';
    cashConditionnement[1] = 'Bouteille';

    $(".ventes").find('input[name="record"]').each(function() {
      $(this).parents("tr").remove();
      delete Send[this.id];
    })


    //obtenir les donnees de la ligne cliquée
    var data = Vente_table.row($(this).parents('tr')).data();

    $('#idVentes').val(data.id)

    //create line of product buy
    $.each(data.produits, function(key, value) {
      console.log(key);
      var markup = "<tr><td><input type='checkbox' name='record' id=" + ligne + "></td><td>" + value.prods['designationProduits'] + "</td><td>" + cashConditionnement[value['conditionnement']] + "</td><td>" + value['quantiteProduitVentes'] + "</td><td>" + value['prixUnitaireProduitVentes'] + "</td><td>" + value['prixTotalProduitVentes'] + "</td></tr>";
      $(".ventes").append(markup);
      $('#mtnVente').html(data['montantVente']);

      Send[ligne] = {
        'familleProduit': ' ',
        'produitVentes': value['produits_id'],
        'quantiteVentes': value['quantiteProduitVentes'],
        'prixUnitaireVentes': value['prixUnitaireProduitVentes'],
        'conditionnementVentes': value['conditionnement'],
        'mtn': data['montantVente'],
        'idVentes': data.id,
      }


      if (data.remise) {
        var newOption2 = new Option(data.remise['designationRemises'], data.remise['id'], false, true);
        $('#remiseVentes').append(newOption2).trigger('change');
      }

      $('#typeClient').val(data['client_types_id']).trigger('change')
      $('#typeVersement').val(data['versement']).trigger('change')
      $('#infoVersement').val(data['infoVersement']).trigger('change')
      $('#sommeAPayer').val(data['sommeAPayer'])
      $('#sommePayer').val(data['sommePayer'])
      $('#sommeRestante').val(data['sommeRestante'])

      if (data['clients_id']) {
        console.log(data['nomClients']);
        console.log(data['clients_id']);
        //remplir le select2 type client de nouveau client
        var newOption = new Option(data['nomClients'], data['clients_id'], false, true);
        $('#client').append(newOption).trigger('change');
        $('.client1').show()
        $('.client2').hide()
      }

      ligne++;
      console.log(Send);

      // $('.nav a:nth-child(3)').tab('show');
      $('.nav a:eq(1)').tab('show');
      // }


    })
  })


  //click sur le boutton facture de vente
  $('#datatableVente tbody ').on('click', '.facture', function() {
      var data = Vente_table.row($(this).parents('tr')).data();

      $.ajax({
        type: 'POST',
        url: 'mkFacture',
        data: {
          'id': data['id'],
          _token: $('meta[name="csrf-token"]').attr('content')
        },

        //xhrFields is what did the trick to read the blob to pdf
        xhrFields: {
          responseType: 'blob'
        },
        success: function(response, status, xhr) {
          var filename = "";
          var disposition = xhr.getResponseHeader('Content-Disposition');

          if (disposition) {
            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
            var matches = filenameRegex.exec(disposition);
            if (matches !== null && matches[1]) filename = matches[1].replace(/['"]/g, '');
          }
          var linkelem = document.createElement('a');
          try {
            var blob = new Blob([response], {
              type: 'application/octet-stream'
            });

            if (typeof window.navigator.msSaveBlob !== 'undefined') {
              //   IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
              window.navigator.msSaveBlob(blob, filename);
            } else {
              var URL = window.URL || window.webkitURL;
              var downloadUrl = URL.createObjectURL(blob);

              if (filename) {
                // use HTML5 a[download] attribute to specify filename
                var a = document.createElement("a");

                // safari doesn't support this yet
                if (typeof a.download === 'undefined') {
                  window.location = downloadUrl;
                } else {
                  a.href = downloadUrl;
                  a.download = filename;
                  document.body.appendChild(a);
                  a.target = "_blank";
                  a.click();
                }
              } else {
                window.location = downloadUrl;
              }
            }

          } catch (ex) {
            console.log(ex);
          }
        }
      });
  })


  //click sur le boutton d annuler une vente
  $('#datatableVente tbody').on('click','.cancell',function(){
    var data = Vente_table.row($(this).parents('tr')).data();
    $('#idVentes').val(data.id)
    reqAjax('formVentes', 'cancelVentes', 'DELETE',data.id)
    Vente_table.ajax.reload();
  })


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////devis



//click on devis button
$('#devis').click(function(e) {
  data2 = {}
  e.preventDefault();
  if (!$('#idVentes').val()) {
    var sommePayer = $('#sommePayer').val();

    if ($('#typeClient').val() != 3)
      var nomC = document.getElementById('client')[document.getElementById('client').selectedIndex].innerHTML;

    if (ligne > 0) {
      $.each(Send, function(key, value) {
        data2[key] = {
          'familleProduit': value['familleProduit'],
          'produitVentes': value['produitVentes'],
          'quantiteVentes': value['quantiteVentes'],
          'prixUnitaireVentes': value['prixUnitaireVentes'],
          'conditionnementVentes': value['conditionnementVentes'],
          'infoVersement': $('#infoVersement').val(),
          'mtn': $('#mtnVente').html(),
          'sommePayer': sommePayer,
          'sommeAPayer': $('#sommeAPayer').val(),
          'sommeRestante': $('#sommeRestante').val(),
          'typeClient': $('#typeClient').val(),
          'nomClient': ($('#typeClient').val() == 3) ? $('#nomClient').val() : nomC,
          'idClient': ($('#typeClient').val() != 3) ? $('#client').val() : ' ',
          'idRemise': ($('#remiseVentes').val()) ? $('#remiseVentes').val() : ' ',
          'idVentes': value['idVentes'],
          'typeVersement': 1,
        }
      })


      console.log(data2);

      $.ajax({
        // cache: false,
        type: 'POST',
        url: 'addDevis',
        // contentType: false,
        // processData: false,
        data: {
          'data': data2,
          _token: $('meta[name="csrf-token"]').attr('content')
        },
        //xhrFields is what did the trick to read the blob to pdf
        xhrFields: {
          responseType: 'blob'
        },
        success: function(response, status, xhr) {

          var filename = "";
          var disposition = xhr.getResponseHeader('Content-Disposition');

          if (disposition) {
            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
            var matches = filenameRegex.exec(disposition);
            if (matches !== null && matches[1]) filename = matches[1].replace(/['"]/g, '');
          }
          var linkelem = document.createElement('a');
          try {
            var blob = new Blob([response], {
              type: 'application/octet-stream'
            });

            if (typeof window.navigator.msSaveBlob !== 'undefined') {
              //   IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
              window.navigator.msSaveBlob(blob, filename);
            } else {
              var URL = window.URL || window.webkitURL;
              var downloadUrl = URL.createObjectURL(blob);

              if (filename) {
                // use HTML5 a[download] attribute to specify filename
                var a = document.createElement("a");

                // safari doesn't support this yet
                if (typeof a.download === 'undefined') {
                  window.location = downloadUrl;
                } else {
                  a.href = downloadUrl;
                  a.download = filename;
                  document.body.appendChild(a);
                  a.target = "_blank";
                  a.click();
                }
              } else {
                window.location = downloadUrl;
              }
            }

          } catch (ex) {
            console.log(ex);
          }
        }
      });









    } else {
      //impossible de faire le devis
      displayMsg('warning', 'Impossible de générer le devis ')
    }
  } else {
    //impossible de faire le devis
    displayMsg('warning', 'Impossible de générer le devis d \'une vente ')


  }
})









  ///////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////// cloture
  //send formulaire
  $('#formJourneeClotures').submit(function(e) {
  e.preventDefault();
  validateForm('formJourneeClotures', 'addClotures', 'POST')
  Cloture_table.ajax.reload();
  })

  ///initialisation du datatable de type client
  var Cloture_table = $('#datatableCloture').DataTable({
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
      "url": urlGetClotures,
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

          return " <button class='btn btn-outline-success bilan'> BILAN </button>";

        }
      }

    ],
    "columns": [{
      "data": "id"
    },
    {
      "data": "idenfiantClotures"
    },
    {
      "data": "dateJourneeClotures"
    },
    {
      "data": ""
    }
    ],
  });

  /////////////////datatable booutoon///////////////////////////////////
  //click sur le boutton bilan
  $('#datatableCloture tbody ').on('click', '.bilan', function() {
      var data = Cloture_table.row($(this).parents('tr')).data();

      $.ajax({
        type: 'POST',
        url: 'bilan',
        data: {
          'date': data['dateJourneeClotures'],
          _token: $('meta[name="csrf-token"]').attr('content')
        },

        //xhrFields is what did the trick to read the blob to pdf
        xhrFields: {
          responseType: 'blob'
        },
        success: function(response, status, xhr) {
          var filename = "";
          var disposition = xhr.getResponseHeader('Content-Disposition');

          if (disposition) {
            var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
            var matches = filenameRegex.exec(disposition);
            if (matches !== null && matches[1]) filename = matches[1].replace(/['"]/g, '');
          }
          var linkelem = document.createElement('a');
          try {
            var blob = new Blob([response], {
              type: 'application/octet-stream'
            });

            if (typeof window.navigator.msSaveBlob !== 'undefined') {
              //   IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
              window.navigator.msSaveBlob(blob, filename);
            } else {
              var URL = window.URL || window.webkitURL;
              var downloadUrl = URL.createObjectURL(blob);

              if (filename) {
                // use HTML5 a[download] attribute to specify filename
                var a = document.createElement("a");

                // safari doesn't support this yet
                if (typeof a.download === 'undefined') {
                  window.location = downloadUrl;
                } else {
                  a.href = downloadUrl;
                  a.download = filename;
                  document.body.appendChild(a);
                  a.target = "_blank";
                  a.click();
                }
              } else {
                window.location = downloadUrl;
              }
            }

          } catch (ex) {
            console.log(ex);
          }
        }
      });
  })




})
