

fetch('https://gitlab.com/mountblue/cohort-15-ruby/rishabh_singh/data-project-web/-/blob/master/ruby_files/json/Total_Runs_Scored_By_Team.json')
  .then(response => response.json())
  .then(data => console.log(data));

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
      text: "Total Runs Scored By Each Teams"
    },
    xAxis: {
      type: "category"
    },    
    yAxis: {
      min: 0,
      title: {
        text: "Runs"
      }
    },  
    series: [
      {
        name: "Teams",
        data: seriesData
      }
    ]
  });
}
