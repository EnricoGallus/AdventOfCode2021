require 'minitest/autorun'

require_relative '../day7_giant_whale/move_crabs'

class MoveCrabsTest < Minitest::Test

  def test_move_crabs
    assert_equal 37, move_crabs('day7_giant_whale/test_input.txt')
  end

  def test_real_move_crabs
    assert_equal 336131, move_crabs('day7_giant_whale/input.txt')
  end
end
