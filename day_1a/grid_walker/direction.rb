# This class makes operations on directions, namely changing one direction
# to another by making a turn.
# The first parameter is one of %i(east north west south) and the second
# is one of %w(L R)
class Direction
  DIRECTIONS = { east: 0, north: 1, west: 2, south: 3 }.freeze

  def initialize(current, turn)
    @current = current
    @turn = turn
  end

  def next
    next_direction_value = (DIRECTIONS[@current] + turn_to_i) % 4
    DIRECTIONS.key(next_direction_value)
  end

  private

  def turn_to_i
    case @turn
    when 'L'
      1
    when 'R'
      -1
    end
  end
end
