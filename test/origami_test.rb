require 'minitest/autorun'
require_relative '../day13_origami/origami'

class OrigamiTest < Minitest::Test
  def test_origami_mapping
    assert_equal 17, origami('day13_origami/test_input.txt')
  end

  def test_real_origami_mapping
    assert_equal 781, origami('day13_origami/input.txt')
  end
end
