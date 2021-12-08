require 'minitest/autorun'
require_relative '../day1_sonar_sweep/measure_depth'

class MeasureDepthTest < Minitest::Test
  def test_measurement_should_return_expected_value
    assert_equal 7, measure_depth('day1_sonar_sweep/test_measurements.txt')
  end

  def test_real_measurement_should_return_expected_value
    assert_equal 1766, measure_depth('day1_sonar_sweep/measurements.txt')
  end
end
