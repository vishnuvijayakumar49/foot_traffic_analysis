# frozen_string_literal: true
class FootTraficAnalyser
  attr_reader :file, :gallery

  def initialize(path)
    @gallery = Gallery.new
    @file = File.open(path, 'r')
  end

  def feed_data
    input_no = file.first.to_i
    file.each_line.with_index do |line, index|
      next if (index + 1) > input_no
      visitor_id, r_index, visitor_status, time_stamp = format_inputs(line)
      gallery.allocate_room(r_index, visitor_id, visitor_status, time_stamp)
    end
  end

  def format_inputs(line)
    inputs = line.strip.split
    inputs.map.with_index do |input, index|
      index != 2 ? input.to_i : input
    end
  end

  def analysed_data
    rooms = gallery.rooms.sort_by(&:r_index)
    rooms.each do |room|
      avg_time = room.avg_time
      visited = room.visitors_count
      puts "Room #{room.r_index}, #{avg_time} minute average visit, #{visited} total"
    end
  end
end
