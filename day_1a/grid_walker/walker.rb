require_relative 'coords'

class Walker
  STARTING_POINT = [:north, 0, 0].freeze

  def initialize(data)
    @data = data
  end

  def run
    (_direction, x, y) = @data.reduce(STARTING_POINT) do |prev_point, current_move|
      walk_from_point(prev_point, current_move)
    end
    calculate_distance(x, y)
  end

  private

  def walk_from_point(prev_point, current_move)
    left_or_right, blocks = parse_move(current_move)
    coords = Coords.new(prev_point)
    coords.turn(left_or_right)
    coords.walk(blocks.to_i)
    coords.to_point
  end

  def parse_move(move)
    move.match(/([LR])(\d*)/).captures
  end

  def calculate_distance(x, y)
    x.abs + y.abs
  end
end
