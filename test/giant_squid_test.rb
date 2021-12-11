require 'minitest/autorun'
require_relative '../day4_giant_squid/bingo'

class BingoTest < Minitest::Test
  def test_measurement_should_return_expected_value
    assert_equal 4512, bingo('day4_giant_squid/test_input.txt')
  end

  def test_real_measurement_should_return_expected_value
    assert_equal 35670, bingo('day4_giant_squid/input.txt')
  end
end
