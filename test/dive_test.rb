require 'minitest/autorun'
require_relative '../day2_dive/dive'

class DiveTest < Minitest::Test
  def test_measurement_should_return_expected_value
    assert_equal 150, dive('day2_dive/test_input.txt')
  end

  def test_real_measurement_should_return_expected_value
    assert_equal 1383564, dive('day2_dive/input.txt')
  end
end
