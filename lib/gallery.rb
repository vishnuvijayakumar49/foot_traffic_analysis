# frozen_string_literal: true
class Gallery
  attr_accessor :rooms

  def initialize
    @rooms = []
  end

  def allocate_room(r_index, visitor_id, visitor_status, time_stamp)
    room = rooms.find { |room| room.r_index == r_index }
    #create room only if not initialized
    unless room
      return if perform_validation(visitor_id, time_stamp)
      room = Room.new(r_index)
      rooms << room
    end
    room&.visitor_stat(visitor_id, visitor_status, time_stamp)
  end

  def perform_validation(visitor_id, time_stamp)
    #max visitor  mentioned as 1024
    #max room count mentioned as 100
    #max time_stamp 1439
    visitor_id > 1024 ||
    rooms.count >= 100 ||
    time_stamp > 1439
  end
end
