require 'minitest/autorun'
require_relative '../day14_polymer/polymer'

class PolymerTest < Minitest::Test

  def test_pair_insertion_once
    assert_equal 1, pair_insertion('day14_polymer/test_input.txt', 1)
  end

  def test_pair_insertion_twice
    assert_equal 5, pair_insertion('day14_polymer/test_input.txt', 2)
  end

  def test_pair_insertion_ten_times
    assert_equal 1588, pair_insertion('day14_polymer/test_input.txt', 10)
  end

  def test_pair_insertion_fourty_times
    assert_equal 2188189693529, pair_insertion('day14_polymer/test_input.txt', 40)
  end

  def test_real_pair_insertion_ten_times
    assert_equal 2947, pair_insertion('day14_polymer/input.txt', 10)
  end

  def test_real_pair_insertion_fourty_times
    assert_equal 2947, pair_insertion('day14_polymer/input.txt', 40)
  end
end
