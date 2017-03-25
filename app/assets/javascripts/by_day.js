var ctx = document.getElementById("myChart");

/*
 * Test data:
 * £30 1/2/17
 * £15 2/2/17
 * £45 3/2/17
 * £35 4/2/17
 */

var moneyset = {
  label: 'Money',
  data: [
    { x: '2017-02-01', y: 50 },
    { x: '2017-02-01', y: 30 },
    { x: '2017-02-02', y: 15 },
    { x: '2017-02-03', y: 45 },
    { x: '2017-02-04', y: 35 },
  ]
}

// var moneyset = {
//   label: 'Money',
//   data: $.ajax({
//     url: 'http://localhost:3000/data/byday',
//     type: 'jsonp'
//   })
// }

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
