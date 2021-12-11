require 'minitest/autorun'

require_relative '../day7_giant_whale/move_crabs'

class MoveCrabsTest < Minitest::Test

  def test_move_crabs
    assert_equal 37, move_crabs('day7_giant_whale/test_input.txt', false)
  end

  def test_real_move_crabs
    assert_equal 336131, move_crabs('day7_giant_whale/input.txt', false)
  end

  def test_move_crabs_advanced
    assert_equal 168, move_crabs('day7_giant_whale/test_input.txt', true)
  end

  def test_real_move_crabs_advanced
    assert_equal 92676646, move_crabs('day7_giant_whale/input.txt', true)
  end
end
