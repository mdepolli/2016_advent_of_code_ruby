require 'minitest/autorun'
require_relative 'block_walker'

class BlockWalkerTest  < Minitest::Test
  def test_for_first_provided_test_case
    block_walker = BlockWalker.new('R2, L3')

    assert_equal 5, block_walker.run
  end

  def test_for_second_provided_test_case
    block_walker = BlockWalker.new('R2, R2, R2')

    assert_equal 2, block_walker.run
  end

  def test_for_third_provided_test_case
    block_walker = BlockWalker.new('R5, L5, R5, R3')

    assert_equal 12, block_walker.run
  end

  def test_that_original_challenge_is_solved
    block_walker = BlockWalker.new

    assert_equal 301, block_walker.run
  end
end
