require 'minitest/autorun'
require_relative 'grid_walker'

class GridWalkerTest < Minitest::Test
  def test_for_first_provided_test_case
    grid_walker = GridWalker.new('R2, L3')

    assert_equal 5, grid_walker.run
  end

  def test_for_second_provided_test_case
    grid_walker = GridWalker.new('R2, R2, R2')

    assert_equal 2, grid_walker.run
  end

  def test_for_third_provided_test_case
    grid_walker = GridWalker.new('R5, L5, R5, R3')

    assert_equal 12, grid_walker.run
  end

  def test_that_original_challenge_is_solved
    grid_walker = GridWalker.new

    assert_equal 301, grid_walker.run
  end
end
