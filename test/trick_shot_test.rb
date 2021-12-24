require 'minitest/autorun'
require_relative '../day17_trick_shot/trick_shot'

class TrickShotTest < Minitest::Test
  def test_range
    assert_equal [[20, 30], [-10, -5]], range('day17_trick_shot/test_input.txt')
  end

  def test_shot
    assert_false shoot([0,0], [[20, 30], [-10, -5]])
  end
end
