require 'minitest/autorun'
require_relative '../day10_syntax_scoring/syntax_advanced'

class SyntaxTest < Minitest::Test

  def test_syntax
    assert_equal 288957, syntax_advanced('day10_syntax_scoring/test_input.txt')
  end

  def test_real_syntax
    assert_equal 3515583998, syntax_advanced('day10_syntax_scoring/input.txt')
  end
end
