require_relative 'direction'

# `point` is a 3-element array with direction, x coordinate, y coordinate
class Coords
  def initialize(point)
    (@direction, @x, @y) = point
  end

  def turn(left_or_right)
    @direction = Direction.new(@direction, left_or_right).next
  end

  def walk(blocks)
    case @direction
    when :east
      @x += blocks
    when :north
      @y += blocks
    when :west
      @x -= blocks
    when :south
      @y -= blocks
    end
  end

  def to_point
    [@direction, @x, @y]
  end
end
