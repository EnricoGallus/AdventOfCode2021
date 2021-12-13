require 'minitest/autorun'
require_relative '../day13_origami/origami'
require_relative '../day13_origami/test'

class OrigamiTest < Minitest::Test
  def test_origami_mapping_one_step
    assert_equal 17, origami('day13_origami/test_input.txt', 1)
  end

  def test_real_origami_mapping_one_step
    assert_equal 781, origami('day13_origami/input.txt', 1)
  end

  def test_origami_mapping
    assert_equal 16, origami('day13_origami/test_input.txt')
  end

  def test_real_origami_mapping
    assert_equal 138, origami('day13_origami/input.txt')
  end
end
