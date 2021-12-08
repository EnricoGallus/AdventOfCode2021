require 'minitest/autorun'
require_relative '../day2_dive/dive_advanced'

class DiveTest < Minitest::Test
  def test_measurement_should_return_expected_value
    assert_equal 900, dive('day2_dive/test_input.txt')
  end

  def test_real_measurement_should_return_expected_value
    assert_equal 1488311643, dive('day2_dive/input.txt')
  end
end
