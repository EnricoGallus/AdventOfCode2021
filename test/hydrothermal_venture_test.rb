require 'minitest/autorun'
require_relative '../day5_hydrothermal_venture/hydrothermal_venture'

class HydrothermalVentureTest < Minitest::Test
  def test_measurement_should_return_expected_value
    assert_equal 5, venture('day5_hydrothermal_venture/test_input.txt', false)
  end

  def test_real_measurement_should_return_expected_value
    assert_equal 6710, venture('day5_hydrothermal_venture/input.txt', false)
  end

  def test_advanced_measurement_should_return_expected_value
    assert_equal 12, venture('day5_hydrothermal_venture/test_input.txt', true)
  end

  def test_advanced_real_measurement_should_return_expected_value
    assert_equal 20121, venture('day5_hydrothermal_venture/input.txt', true)
  end
end
