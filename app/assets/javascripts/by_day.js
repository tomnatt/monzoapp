var ctx = document.getElementById("myChart");

var moneyset = {
  label: 'Money',
  data: $.ajax({
    url: '/data/byday',
    type: 'jsonp'
  })
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
        ticks: { max: 150, min: 0 }
      }]
    }
  }
});
