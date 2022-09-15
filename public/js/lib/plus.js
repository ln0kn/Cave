$('.plus').click(function(e) {
  Codebase.layout('side_overlay_toggle');
  $.ajax({
    url: 'urlPlus',
    method: 'Get',
    dataType: "json",
    beforeSend: function(xhr) {
      Codebase.blocks('.my-block2', 'state_loading');
      console.log('d');
    },
    complete: function(xhr, status) {
      Codebase.blocks('.my-block2', 'state_toggle');
      if (status == 'success') {
        console.log(xhr.responseJSON);
        var dropdwon = "  <ul class='nav-users push'>";
        $.each(xhr.responseJSON, function(key, value) {
          dropdwon +="<li><a href='#'>"+ value + " (btl)   </a>";
        })
        dropdwon +="</li>";
        $("#plus").html(dropdwon);



      }
    },
    error: function(xhr, status, error) {
      displayMsg('danger',error);
    }
  })


})

$('.plus2').click(function(e){
  e.preventDefault();
  $.ajax({
    url: 'unreadNotif',
    method: 'Get',
    dataType: "json",
    beforeSend: function(xhr) {
      Codebase.blocks('.my-block2', 'state_loading');
      // console.log('d');
    },
    complete: function(xhr, status) {
      if (status == 'success') {
        // console.log(xhr.responseJSON);
        var dropdwon ;
        if(xhr.responseJSON.length == 0)
        $('.markAsR').hide()
        else
        $('.markAsR').show()
        console.log(xhr.responseJSON.length);
        $.each(xhr.responseJSON, function(key, value) {
          dropdwon +='<a class="dropdown-item"><i class="si si-user mr-5"></i> '+key+ ' '+value+' (btl) </a>'
        })

        $("#plus2").html(dropdwon);

      }
    },
    error: function(xhr, status, error) {
      displayMsg('danger',error);
    }
  })

})

$('.markAsR').click(function(e){
  e.preventDefault();
  $.ajax({
    url: 'markAsRead',
    method: 'Get',
    dataType: "json",
    beforeSend: function(xhr) {
      // Codebase.blocks('.my-block2', 'state_loading');
      console.log('d');
    },
    complete: function(xhr, status) {
      if (status == 'success') {
        console.log(xhr.responseJSON);
        var dropdwon ;



        $("#plus2").html(' ');



      }
    },
    error: function(xhr, status, error) {
      displayMsg('danger',error);
    }
  })





})


$('#resetPassword').submit(function(e){
  e.preventDefault()
  $.ajax({
    url: 'resetPassword',
    method: 'POST',
    dataType: "json",
    beforeSend: function(xhr) {
      Codebase.blocks('.block22', 'state_loading');
      console.log('d');
    },
    complete: function(xhr, status) {
      Codebase.blocks('.block22', 'state_toggle');
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
              cleanForm('resetPassword')
            }
          }
        }
      }
    },
    data: $('#resetPassword').serialize(),
    error: function(xhr, status, error) {
      displayMsg('danger',error);
    }
  })
})
