# frozen_string_literal: true

###############################################################################
#                                 GRAPH CLASS                                 #
###############################################################################

#######################    SINGLE BAR GRAPH FUNCTION    #######################
class GraphData
  require 'gruff'
  def bar_graph(*args)
    grf = Gruff::Bar.new('1200x900') # Define a custom size
    grf.title = args[0]
    grf.x_axis_label = args[1]
    grf.y_axis_label = args[2]
    grf.theme = { colors: %w[#0dadd1 purple], marker_color: 'black', background_colors: %w[white white] }
    newgraph(grf, args)
    grf.labels = args[4]
    grf.write(args[5])
  end

  def newgraph(grf, args)
    grf.sort = false
    grf.maximum_value = args[6]
    grf.data(args[8], args[3])
    grf.minimum_value = 0
    grf.y_axis_increment = args[7]
    grf.spacing_factor = 0.1
    grf.group_spacing = 20
    grf.legend_font_size = 20 # Legend font size
    grf.title_font_size = 20 # Title font size
  end

  #######################  SINGLE BAR GRAPH FUNCTION END  #######################

  #######################     GROUP BAR GRAPH FUNCTION    #######################

  def for_group_graph(*args)
    newgrf = Gruff::Bar.new('1200x900') # Define a custom size
    newgrf.title = args[0]
    newgrf.sort = false
    newgrf.x_axis_label = args[1]
    newgrf.y_axis_label = args[2]
    newgrf.theme = { colors: %w[#0dadd1 #00a65d #ed1c24 #f79433 #00a65d #3a225d #f3c433 #000000 #857040 #e5b582],
                     marker_color: 'black', background_colors: %w[white white] }
    groupgraph(newgrf, args)
    newgrf.labels = args[4]
    newgrf.write(args[5])
  end

  def groupgraph(newgrf, args)
    newgrf.maximum_value = args[6]
    args[3].each do |key, value|
      newgrf.data(key, value)
    end
    newgrf.minimum_value = 0
    newgrf.y_axis_increment = args[7]
    newgrf.spacing_factor = 0.5
    newgrf.group_spacing = 10
    newgrf.legend_font_size = 10 # Legend font size
    newgrf.title_font_size = 10 # Title font size
  end
end

###################### GROUP BAR GRAPH FOR FUNCTION END #######################

###############################################################################
#                              GRAPH CLASS END                                #
###############################################################################
