require 'minitest/autorun'
require_relative '../day10_syntax_scoring/syntax'

class SyntaxTest < Minitest::Test

  def test_syntax
    assert_equal 26397, syntax('day10_syntax_scoring/test_input.txt')
  end

  def test_real_syntax
    assert_equal 319329, syntax('day10_syntax_scoring/input.txt')
  end
end
