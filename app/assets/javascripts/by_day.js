var ctx = document.getElementById("myChart");

$.getJSON('/data/byday', function(data) {

  $('#wait-message').hide();

  var moneyset = {
    label: 'Money',
    data: data
  }

  // And for a line chart
  var lineChart = new Chart(ctx, {
    type: 'line',
    data: {
      datasets: [ moneyset ]
    },
    options: {
      scales: {
        xAxes: [{
          type: 'time',
          position: 'bottom'
        }],
        yAxes: [{
          ticks: { min: 0 }
        }]
      },
      responsive: false,
    }
  });
});
