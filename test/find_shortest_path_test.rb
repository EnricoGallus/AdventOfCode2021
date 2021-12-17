require 'minitest/autorun'
require_relative '../day15_chiton/find_shortest_path'

class FindShortestPathTest < Minitest::Test
  def test_find_path
    assert_equal 40, find_path('day15_chiton/test_input.txt')
  end

  def test_real_find_shortest_cost
    assert_equal 40, find_path('day15_chiton/input.txt')
  end
end
