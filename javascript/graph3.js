$.getJSON("/ruby_files/json/Foreign_umpire_analysis.json", function(json) {
  runscorebyteams(json);
});

function runscorebyteams(json) {
  const seriesData = [];
  for (let teams in json) {
    seriesData.push([teams, json[teams]]);
  }    
  Highcharts.chart("totalruns", {
    chart: {
      type: "column"
    },
    title: {
      text: "Foreign umpire analysis"
    },
    xAxis: {
      type: "category"
    },    
    yAxis: {
      min: 0,
      title: {
        text: "Number_of_Umpires"
      }
    },  
    series: [
      {
        name: "Nationality",
        data: seriesData
      }
    ]
  });
}
