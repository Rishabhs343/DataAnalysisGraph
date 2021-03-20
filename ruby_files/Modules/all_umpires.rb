# frozen_string_literal: true

###############################################################################
#          3.            Foreign umpire analysis CLASS                        #
###############################################################################
class AllUmpires
  def foreign_umpire(umpire)
    all_umpires = Set[]

    # All unique umpires with nationality

    umpire.each do |i|
      all_umpires.add(i['nationality']) if i['nationality'] != 'IND'
    end

    # Hash of umpires nationality with number of matches
    # {umpires_nationality=>0}

    count_of_matches = Hash[all_umpires.map { |x| [x, 0] }]
    umpire.each do |h|
      count_of_matches[h['nationality']] += 1 if h['nationality'] != 'IND'
    end
    umpire_count(count_of_matches)
  end

  def umpire_count(count_of_matches)
    country = count_of_matches.collect { |k, _v| k }
    count_umpires = count_of_matches.collect { |_k, v| v }
    dict1 = {}
    country.each_with_index { |name, idx| dict1[idx] = name }
    umpire_labels(count_umpires, dict1)
    convet_to_full(count_of_matches)
  end

  def umpire_labels(count_umpires, dict1)
    title = 'Foreign umpire analysis'
    xlab = '------Nationality------'
    ylab = 'Number_of_Umpires'
    dir = Dir.pwd
    file_name = "#{dir}/ruby_files/Graphs/Foreign_umpire_analysis.png"
    maxval = 10
    datas = 'Umpires'
    dif = 1
    use_funtion_graph = GraphData.new
    use_funtion_graph.bar_graph(title, xlab, ylab, count_umpires, dict1, file_name, maxval, dif, datas)
  end

  def convet_to_full(count_of_matches)
    require 'json'
    dir = Dir.pwd
    change_name = UpdateNames.new
    t = change_name.country_name
    newjsondata = Hash[count_of_matches.map { |k, v| [t.key(k), v] }]
    File.open("#{dir}/ruby_files/json/Foreign_umpire_analysis.json", 'w') do |f|
      f.write(newjsondata.to_json)
    end
  end
end

###############################################################################
#                     Foreign umpire analysis CLASS END                       #
###############################################################################
