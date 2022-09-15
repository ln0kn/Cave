
// method
// 01 .display message
// 01 .Form validate


/**
* [01 displayMsg use to show operation state fail or succed]
* @param  {[type]} type [info , warning , error]
* @param  {[type]} msg  [msg to display]
* @return {[type]}      [description]
*/
function displayMsg(type,msg){
  Codebase.helpers('notify', {
    align: 'right',             // 'right', 'left', 'center'
    from: 'top',                // 'top', 'bottom'
    type: type,               // 'info', 'success', 'warning', 'danger'
    icon: 'fa fa-info mr-5',    // Icon class
    message: msg
  });
}


/*02 Form validate*/
/**
* [validateForm function use to check if all required field was fill]
* @param  {[type]} idForm form identifiant
* @return {[type]}        [description]
*/
function validateForm(idForm, url, method, data) {
  if ($('#' + idForm).valid() ){
    return reqAjax(idForm, url, method, data)
  }

}




// 03 ReqAAjax
/**
* [reqAjax function use to sent asynchronous request]
* @param  {[type]} idForm    [what to send the request]
* @param  {[type]} url    [where to send the request]
* @param  {[type]} method [how to send request]
* @param  {[type]} laoder [display laoder or not]
* @return {[type]}        [description]
*/
function reqAjax(idForm, url, method, data) {
  var dataToSend;

  if(data){

    dataToSend = {'data':data,_token : $('meta[name="csrf-token"]').attr('content')};
  }else{

    dataToSend = $('#' + idForm).serialize();
  }

  return   $.ajax({
    url: url,
    method: method,
    dataType: "json",
    beforeSend: function(xhr) {
      Codebase.blocks('.my-block', 'state_loading');
    },
    complete: function(xhr, status) {
      Codebase.blocks('.my-block', 'state_toggle');
      if (status == 'success') {
        if (xhr.responseJSON.fail) {
          var errors = xhr.responseJSON.errors;
          for (x in errors) {
            for(y in errors[x]){
              displayMsg('warning',errors[x][y].toString())
            }
          }
        } else {
          if(xhr.responseJSON['accredidation']){
            displayMsg('warning','Vous n\'étes pas autorisé à éffectuer cette action.Veuillez contactez le responsable.');
            // displayMsg('warning','Vous n\'étes pas autorisé à éffectuer cette action.Veuillez contactez l\'administrateur.');

          }else{
            if(xhr.responseJSON['credit']){
              displayMsg('warning','Vous n\'étes pas autorisé à vendre à crédit.Veuillez contactez le responsable.');
            }
            else{
              displayMsg('success','Opération Réalisée');
              cleanForm(idForm)
            }
          }
        }
      }
    },
    data: dataToSend,
    error: function(xhr, status, error) {
      displayMsg('danger',error);
    }
  })
}

// 04 cleanForm
/**
* [cleanForm method use to empty all field of the form]
* @param  {[type]} idForm [form isentifiant]
* @return {[type]}        [description]
*/
function cleanForm(idForm) {



  $('#id').val(' ');
  var inputs = document.getElementById(idForm).elements;
  // console.log(inputs);
  for (i = 0; i < inputs.length; i++) {

    if (inputs[i].nodeName === "INPUT") {
      // if (inputs[i].type === "text" ||' inputs[i].type === "number" || inputs[i].type === "email" || inputs[i].type === "password") {
      if( inputs[i].name != '_token')
      inputs[i].value = '';


      var input = '#'+idForm+' input[data-role=tagsinput]';
        // console.log(input);
        if($(input).lenght){
          $(input).tagsinput('add', 'al');
          $(input).tagsinput('removeAll');
        }
    }
    else{
      if(inputs[i].nodeName === "SELECT") {

        $('.select2').val(null).trigger('change');
        // $('.js-select2').empty();
      }
    }
  }
}
