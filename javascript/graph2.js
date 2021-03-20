$.getJSON("/ruby_files/json/Top_Batsman_For_RCB.json", function(json) {
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
        text: "Top batsman for Royal Challengers Bangalore"
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
          name: "Players",
          data: seriesData
        }
      ]
    });
  }
