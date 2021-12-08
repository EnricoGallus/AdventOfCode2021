require 'minitest/autorun'
require_relative '../day1_sonar_sweep/measure_depth_advanced'

class MeasureDepthAdvancedTest < Minitest::Test
  def test_measurement_should_return_expected_value
    assert_equal 5, measure_depth_advanced('day1_sonar_sweep/test_measurements.txt')
  end

  def test_real_measurement_should_return_expected_value
    assert_equal 1797, measure_depth_advanced('day1_sonar_sweep/measurements.txt')
  end
end
