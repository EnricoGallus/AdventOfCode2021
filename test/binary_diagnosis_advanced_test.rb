require 'minitest/autorun'
require_relative '../day3_binary_diagnosis/life_support'

class BinaryDiagnosisTest < Minitest::Test
  def test_measurement_should_return_expected_value
    assert_equal 230, life_support('day3_binary_diagnosis/test_input.txt')
  end

  def test_real_measurement_should_return_expected_value
    assert_equal 587895, life_support('day3_binary_diagnosis/input.txt')
  end
end
