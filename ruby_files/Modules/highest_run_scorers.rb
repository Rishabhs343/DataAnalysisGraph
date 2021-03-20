# frozen_string_literal: true

###############################################################################
#          2.  Top batsman for Royal Challengers Bangalore CLASS              #
###############################################################################
class HighestRunScorers
  def top_batsman_rcb(deliveries)
    rcb_players = Set[]
    deliveries.each do |i|
      rcb_players.add(i['batsman'])
    end
    run_by_rcb = Hash[rcb_players.map { |x| [x, 0] }]
    deliveries.each do |h|
      per_run = h['batsman_runs'].to_i
      run_by_rcb[h['batsman']] += per_run if h['batting_team'] == 'RCB'
    end
    rcb(run_by_rcb)
  end

  def rcb(run_by_rcb)
    run_by_rcb = run_by_rcb.sort_by { |_k, v| v }.reverse.first(5).to_h
    runs = run_by_rcb.map(&:last)
    batsman = run_by_rcb.map(&:first)
    dict1 = {}
    batsman.each_with_index { |name, idx| dict1[idx] = name }
    rcb_labels(runs, dict1)
    convert_to_json(run_by_rcb)
  end

  def convert_to_json(run_by_rcb)
    require 'json'
    dir = Dir.pwd
    File.open("#{dir}/ruby_files/json/Top_Batsman_For_RCB.json", 'w') do |f|
      f.write(run_by_rcb.to_json)
    end
  end

  def rcb_labels(runs, dict1)
    title = 'Top batsman for Royal Challengers Bangalore'
    xlab = '------RCB_Batsman------'
    ylab = 'Runs_Scored'
    dir = Dir.pwd
    file_name = "#{dir}/ruby_files/Graphs/Top_Batsman_For_RCB.png"
    maxval = 5000
    datas = 'Runs'
    dif = 500
    use_funtion_graph = GraphData.new
    use_funtion_graph.bar_graph(title, xlab, ylab, runs, dict1, file_name, maxval, dif, datas)
  end
end

###############################################################################
#           Top batsman for Royal Challengers Bangalore CLASS END             #
###############################################################################
