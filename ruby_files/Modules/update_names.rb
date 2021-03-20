# frozen_string_literal: true

###############################################################################
#                            Change Names CLASS                               #
###############################################################################
class UpdateNames
  def team_name
    { 'Sunrisers Hyderabad' => 'SRH', 'Mumbai Indians' => 'MI', 'Gujarat Lions' => 'GL',
      'Rising Pune Supergiants' => 'RPS', 'Royal Challengers Bangalore' => 'RCB',
      'Kolkata Knight Riders' => 'KKR', 'Delhi Daredevils' => 'DD', 'Kings XI Punjab' => 'KXIP',
      'Chennai Super Kings' => 'CSK', 'Rajasthan Royals' => 'RR', 'Deccan Chargers' => 'DC',
      'Kochi Tuskers Kerala' => 'KTK', 'Pune Warriors' => 'PW', 'Rising Pune Supergiant' => 'RPS' }
  end

  def country_name
    {
      'West Indies' => 'WI', 'Pakistan' => 'PAK', 'Zimbabwe' => 'ZIM', 'South Africa' => 'SA',
      'Australia' => 'AUS', 'England' => 'ENG', 'New Zealand' => 'NZ', 'India' => 'IND', 'Sri Lanka' => 'SL'
    }
  end
end

###############################################################################
#                           Change Names CLASS END                            #
###############################################################################
