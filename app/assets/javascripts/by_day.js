var ctx = document.getElementById("balance-by-day");

$.getJSON('/data/byday', function(data) {

  $('#balance-by-day-wait-message').hide();

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
