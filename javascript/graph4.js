$.getJSON("/ruby_files/json/Number_of_Matches.json", function(json) {
    runscorebyteams(json);
  });
  
  function runscorebyteams(json) {
    let seriesData = []
    for (let team in json){
      seriesData.push({
        name:team,
        data: json[team]
      })            
    }     
    Highcharts.chart("totalruns", {
      chart: {
        type: "column"
      },
      title: {
        text: "NUMBER OF GAMES PLAYED BY TEAMS"
      },
      xAxis: {
        categories: ["2008","2009","2010","2011","2012","2013","2014","2015","2016","2017"],
        title: {
            text: "Seasons"
        }
      },
      yAxis: {        
        title: {
          text: "Number_of_Matches"
        }
      },  
      series: seriesData
    });
  }
