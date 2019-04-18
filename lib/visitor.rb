# frozen_string_literal: true
class Visitor
  attr_accessor :id, :in_time, :out_time

  def initialize(visitor_id)
    @id = visitor_id
    @in_time = 0
    @out_time = 0
  end

  def set_activity_time(visitor_status, time_stamp)
    visitor_status == 'I' ? (@in_time = time_stamp) : (@out_time = time_stamp)
  end

  def time_spend
    @out_time - @in_time
  end
end
