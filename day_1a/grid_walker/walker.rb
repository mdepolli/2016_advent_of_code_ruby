require_relative 'coords'

# This is the main runner class of the application. The only public method,
# `run`, processes the dataset and calculates the distance between the final
# point and the starting point.
class Walker
  STARTING_POINT = [:north, 0, 0].freeze

  def initialize(data)
    @data = data
  end

  def run
    (_direction, x, y) = @data.reduce(STARTING_POINT) do |prev_point, (left_or_right, blocks)|
      walk_to_next_point(prev_point, left_or_right, blocks)
    end
    calculate_distance(x, y)
  end

  private

  def walk_to_next_point(prev_point, left_or_right, blocks)
    coords = Coords.new(prev_point)
    coords.turn(left_or_right)
    coords.walk(blocks.to_i)
    coords.to_point
  end

  def calculate_distance(x, y)
    x.abs + y.abs
  end
end
