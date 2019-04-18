# frozen_string_literal: true
class Room
  attr_accessor :visitors, :r_index

  def initialize(r_index)
    @visitors = []
    @r_index = r_index
  end

  def visitor_stat(visitor_id, visitor_status, time_stamp)
    visitor = visitors.find { |visitor| visitor.id == visitor_id }
    unless visitor
      visitor = Visitor.new(visitor_id)
      visitors << visitor
    end
    visitor.set_activity_time(visitor_status, time_stamp&.to_i)
  end

  def avg_time
    sum = visitors.inject(1) do |sum, visitor|
      sum + visitor.time_spend
    end
    avg = sum / visitors.count
    avg.round
  end

  def visitors_count
    count = visitors.count
    "#{count} #{count > 1 ? 'visitors' : 'visitor'}"
  end
end
