require 'minitest/autorun'
require_relative '../day6_latern_fish/population'

class DiveTest < Minitest::Test
  def test_after_18_days
    assert_equal 26, population('day6_latern_fish/test_input.txt', 18)
  end

  def test_after_80_days
    assert_equal 5934, population('day6_latern_fish/test_input.txt', 80)
  end

  def test_after_256_days
    assert_equal 26984457539, population('day6_latern_fish/test_input.txt', 256)
  end

  def test_real_after_80_days
    assert_equal 361169, population('day6_latern_fish/input.txt', 80)
  end

  def test_real_after_256_days
    assert_equal 1634946868992, population('day6_latern_fish/input.txt', 256)
  end
end
