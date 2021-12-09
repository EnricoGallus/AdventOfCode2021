require 'minitest/autorun'
require_relative '../day3_binary_diagnosis/binary'

class BinaryDiagnosisTest < Minitest::Test
  def test_measurement_should_return_expected_value
    assert_equal 198, binary('day3_binary_diagnosis/test_input.txt')
  end

  def test_real_measurement_should_return_expected_value
    assert_equal 4001724, binary('day3_binary_diagnosis/input.txt')
  end
end
