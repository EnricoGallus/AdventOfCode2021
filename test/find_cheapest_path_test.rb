require 'minitest/autorun'
require_relative '../day15_chiton/find_cheapest_path'

class FindCheapestPathTest < Minitest::Test
  def test_find_path
    assert_equal 40, find_cheapest_path('day15_chiton/test_input.txt')
  end

  def test_real_find_shortest_cost
    assert_equal 592, find_cheapest_path('day15_chiton/input.txt')
  end

  def test_find_path_five_times_larger
    assert_equal 315, five_time_larger('day15_chiton/test_input.txt')
  end

  def test_real_find_path_five_times_larger
    assert_equal 2897, five_time_larger('day15_chiton/input.txt')
  end
end
