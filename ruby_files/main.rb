# frozen_string_literal: true

###############################################################################
#                                 MAIN CLASS                                  #
###############################################################################
class Main
  # import modules
  require 'csv'
  require 'set'
  require_relative 'Modules/graph_data'
  require_relative 'Modules/overall_runs'
  require_relative 'Modules/highest_run_scorers'
  require_relative 'Modules/all_umpires'
  require_relative 'Modules/all_seasons'
  require_relative 'Modules/update_names'
  require_relative 'Modules/updated_file'

  # Create objects
  update_name = UpdateNames.new
  update_file = UpdatedFile.new
  use_for_runcount = OverallRuns.new
  top_run_scorer = HighestRunScorers.new
  all_foreign_umpires = AllUmpires.new
  all_seaons = AllSeasons.new

  # Calling methods
  team_display = update_name.team_name
  country_display = update_name.country_name
  update_file.file_paths(team_display, country_display)

  # Convert csv files to hash
  dir = Dir.pwd
  matches = CSV.open("#{dir}/ruby_files/Data/Updated_Data/new_matches_data.csv",
                     headers: :first_row).map(&:to_h)
  deliveries = CSV.open("#{dir}/ruby_files/Data/Updated_Data/new_deliveries_data.csv",
                        headers: :first_row).map(&:to_h)
  umpires = CSV.open("#{dir}/ruby_files/Data/Updated_Data/new_umpires_data.csv",
                     headers: :first_row).map(&:to_h)

  # Calling methods

  runs, teams, deliveries, total_run = use_for_runcount.batting_run_count(matches, deliveries)
  Print_total_runs = use_for_runcount.total_runs_scored(runs, teams, total_run)
  Print_rcb_players_run = top_run_scorer.top_batsman_rcb(deliveries)
  Print_total_umpires = all_foreign_umpires.foreign_umpire(umpires)
  Print_total_seasons = all_seaons.all_ipl_seasons(matches, teams)

  def print_total_runs
    Print_total_runs
  end

  def print_rcb_players_run
    Print_rcb_players_run
  end

  def print_total_umpires
    Print_total_umpires
  end

  def print_total_seasons
    Print_total_seasons
  end
end

###############################################################################
#                             MAIN CLASS END                                  #
###############################################################################

###############################################################################
#                             CALL MAIN CLASS                                 #
###############################################################################

Main.new

###############################################################################
#                                     EOF                                     #
###############################################################################
