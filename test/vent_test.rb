require 'minitest/autorun'
require_relative '../day5_hydrothermal_venture/vent'

class VentTest < Minitest::Test

  def test_horizontal_line
    vent = Vent.new('1,0 -> 1,3')
    result = vent.points(false)
    assert_equal ['1,0', '1,1', '1,2', '1,3'], result
  end

  def test_vertical_line
    vent = Vent.new('0,5 -> 2,5')
    result = vent.points(false)
    assert_equal ['0,5', '1,5', '2,5'], result
  end

  def test_diagonal_line_easy_should_be_empty
    vent = Vent.new('0,2 -> 2,0')
    result = vent.points(false)
    assert_equal [], result
  end

  def test_diagonal_line_advanced_x_increase
    vent = Vent.new('0,2 -> 2,0')
    result = vent.points(true)
    assert_equal ['0,2', '1,1', '2,0'], result
  end

  def test_diagonal_line_advanced_increase_and_decrease
    vent = Vent.new('5,5 -> 8,2')
    result = vent.points(true)
    assert_equal ["5,5", "6,4", "7,3", "8,2"], result
  end
end
