$(function(){
  $('.datepicker').hide()

  // type journalier
  $('#date1').datepicker({
    format: 'mm/dd/yyyy',
    // startDate: '-3d',
    minViewMode : 0,
    autoclose: 'true'
  });


  //type mensuel
  $('#date3').datepicker({
    format: 'mm/dd/yyyy',
    // startDate: '-3d',
    minViewMode : 2,
    autoclose: 'true'
  });

  //type annuel
  $('#date4').datepicker({
    format: 'mm/dd/yyyy',

    minViewMode : 3,
    autoclose: 'true'
  });
  // minViewMode
  $('#typeStats').change(function(){
    $('#date1').val(' ');
    $('#date3').val(' ');
    $('#date4').val(' ');
    var id = $('#typeStats').val();
    if(id == 1){
      $('#date1').show()
      $('#date4').hide()
      $('#date3').hide()

    }
    if(id == 2){
      $('#date1').hide()
      $('#date4').hide()
      $('#date3').show()

    }
    if(id == 3){
      $('#date1').hide()
      $('#date4').show()
      $('#date3').hide()
    }
  })

  $('#formStats').submit(function(e){
    e.preventDefault();
    $.ajax({
      url: "urlStats",
      data: $('#formStats').serialize(),
      success: function (result) {
        var data = [];
        var labels = [];

        for (let i in result[1]) {
          labels.push(result[1][i])
          // console.log(data[0][i]);
        }
        for (let i in result[0]) {
          data.push(result[0][i])
          // console.log(data[0][i]);
        }

        console.log(data);
        console.log(labels);

        renderChart(data, labels);
      },
      error: function (err) {

      }
    });
  })



  function float2dollar(value){
    console.log(value.toFixed(2));
    return value+ " cfa";
    // return (value).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')+ " cfa";
  }

  function renderChart(data, labels) {
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label: 'This week',
          data: data,
          borderColor: 'rgba(75, 192, 192, 1)',
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
        }]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true,
              callback: function(value, index, values) {
                return float2dollar(value);
              }
            }
          }]
        }
      },
    });
  }

})
