require 'minitest/autorun'
require_relative '../day12_caves/find_caves_paths'

class CavesTest < Minitest::Test
  def test_build_cave
    assert_equal 10, build_caves('day12_caves/test_input.txt')
  end

  def test_complex_build_cave
    assert_equal 19, build_caves('day12_caves/complex_input.txt')
  end

  def test_more_complex_build_cave
    assert_equal 226, build_caves('day12_caves/more_complex_input.txt')
  end

  def test_input
    assert_equal 3421, build_caves('day12_caves/input.txt')
  end

  def test_build_cave_advanced
    assert_equal 36, build_caves('day12_caves/test_input.txt')
  end

  def test_complex_build_cave_advanced
    assert_equal 103, build_caves('day12_caves/complex_input.txt')
  end

  def test_more_complex_build_cave_advanced
    assert_equal 3509, build_caves('day12_caves/more_complex_input.txt')
  end

  def test_input_advanced
    assert_equal 84870, build_caves('day12_caves/input.txt')
  end
end
