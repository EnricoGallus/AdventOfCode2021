require 'minitest/autorun'
require_relative '../day4_giant_squid/bingo_last'

class BingoLastTest < Minitest::Test
  def test_measurement_should_return_expected_value
    assert_equal 1924, bingo('day4_giant_squid/test_input.txt')
  end

  def test_real_measurement_should_return_expected_value
    assert_equal 22704, bingo('day4_giant_squid/input.txt')
  end
end
