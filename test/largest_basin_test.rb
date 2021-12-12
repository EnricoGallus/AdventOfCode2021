require 'minitest/autorun'
require_relative '../day9_smoke_basin/largest_basin'
require_relative '../day9_smoke_basin/basin'

class LargestBasinTest < Minitest::Test
  def test_largest_basin
    assert_equal 1134, largest_basin('day9_smoke_basin/test_input.txt')
  end

  def test_real_largest_basin
    assert_equal 1317792, largest_basin('day9_smoke_basin/input.txt')
  end

  def test_simple_four_square
    input =
      [
        [2, 1],
        [3, 9]
      ]
    basin = Basin.new(input)

    assert_equal 3, basin.find_basins
  end
end
