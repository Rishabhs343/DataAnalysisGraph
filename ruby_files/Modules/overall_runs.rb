# frozen_string_literal: true

###############################################################################
#          1.          Total Runs Scored By Team CLASS                        #
###############################################################################
class OverallRuns
  def batting_run_count(matches, deliveries)
    teams = Set[]
    matches.each do |i|
      teams.add(i['team1'])
    end
    total_run = Hash[teams.map { |x| [x, 0] }]
    deliveries.each do |j|
      runs_per_ball = j['total_runs'].to_i
      total_run[j['batting_team']] += runs_per_ball
    end
    run_count(total_run, teams, deliveries)
  end

  def run_count(total_run, teams, deliveries)
    runs = []
    total_run.each do |_key, values|
      runs.append(values)
    end
    teams = teams.to_a
    [runs, teams, deliveries, total_run]
  end

  def total_runs_scored(runs, teams, total_run)
    dict1 = {}
    teams.each_with_index { |name, idx| dict1[idx] = name }
    total_runs_lable(runs, dict1)
    convet_to_full(total_run)
  end

  def total_runs_lable(runs, dict1)
    title = 'Total Runs Scored By Team'
    xlab = '------Teams------'
    ylab = 'Runs_Scored'
    dir = Dir.pwd
    file_name = "#{dir}/ruby_files/Graphs/Total_Runs_Scored_By_Team.png"
    maxval = 25_000
    datas = 'Runs'
    dif = 1500
    use_funtion_graph = GraphData.new
    use_funtion_graph.bar_graph(title, xlab, ylab, runs, dict1, file_name, maxval, dif, datas)
  end

  def convet_to_full(total_run)
    require 'json'
    dir = Dir.pwd
    change_name = UpdateNames.new
    t = change_name.team_name
    newjsondata = Hash[total_run.map { |k, v| [t.key(k), v] }]
    File.open("#{dir}/ruby_files/json/Total_Runs_Scored_By_Team.json", 'w') do |f|
      f.write(newjsondata.to_json)
    end
  end
end

###############################################################################
#                   Total Runs Scored By Team CLASS END                       #
###############################################################################
