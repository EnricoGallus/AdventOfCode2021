require 'minitest/autorun'
require_relative '../day9_smoke_basin/low_points'

class LowPointsTest < Minitest::Test
  def test_low_points
    assert_equal 15, low_point('day9_smoke_basin/test_input.txt')
  end

  def test_real_low_points
    assert_equal 436, low_point('day9_smoke_basin/input.txt')
  end
end
