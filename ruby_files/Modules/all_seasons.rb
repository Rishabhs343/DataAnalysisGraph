# frozen_string_literal: true

###############################################################################
#       4.   Grouped chart of matches played by team by season CLASS          #
###############################################################################
class AllSeasons
  def all_ipl_seasons(matches, teams)
    seasons = Set[] # All unique season
    matches.each do |i|
      seasons.add(i['season'])
    end
    seasons = seasons.to_a
    n = seasons.length

    # Hash of all teams with all season
    # {Team_Name=>[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]}

    every_season = Hash[teams.map { |x| [x, [0] * n] }]
    calculate_seasons(seasons, matches, every_season, n)
  end

  def calculate_seasons(seasons, matches, every_season, nums)
    i = 0
    j = 0

    # Loop matches and increment matches per seasons

    while i < seasons.length && j < matches.length
      if seasons[i] == matches[j]['season']

        # Call newloop
        j, every_season = newloop(i, j, matches, every_season, nums)
      else
        i += 1
      end
    end
    season_labels1(every_season, seasons)
  end

  def newloop(icount, jcount, matches, every_season, nums)
    if icount != 0
      every_season = newloop_data(icount, jcount, matches, every_season)
    else
      every_season[matches[jcount]['team1']][icount + nums - 1] += 1
      every_season[matches[jcount]['team2']][icount + nums - 1] += 1
    end
    jcount += 1
    [jcount, every_season]
  end

  def newloop_data(icount, jcount, matches, every_season)
    every_season[matches[jcount]['team1']][icount - 1] += 1
    every_season[matches[jcount]['team2']][icount - 1] += 1
    every_season
  end

  def season_labels1(every_season, seasons)
    all_season = convet_to_full(every_season)
    dict1 = {}
    sorted_season = seasons.sort
    sorted_season.each_with_index { |name, idx| dict1[idx] = name }
    season_labels2(dict1, all_season)
  end

  def season_labels2(dict1, all_season)
    title = 'NUMBER OF GAMES PLAYED BY TEAMS'
    xlab = '------Seasons------'
    ylab = 'Number_of_Matches'
    dir = Dir.pwd
    file_name = "#{dir}/ruby_files/Graphs/Number_of_Matches.png"
    maxval = 20
    dif = 2
    use_funtion_graph = GraphData.new
    use_funtion_graph.for_group_graph(title, xlab, ylab, all_season, dict1, file_name, maxval, dif)
    convert_to_json(all_season)
  end

  def convert_to_json(all_season)
    require 'json'
    dir = Dir.pwd
    File.open("#{dir}/ruby_files/json/Number_of_Matches.json", 'w') do |f|
      f.write(all_season.to_json)
    end
  end

  def convet_to_full(every_season)
    change_name = UpdateNames.new
    t = change_name.team_name
    Hash[every_season.map { |k, v| [t.key(k), v] }]
  end
end

###############################################################################
#        Grouped chart of matches played by team by season CLASS END          #
###############################################################################
