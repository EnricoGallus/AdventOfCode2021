require 'minitest/autorun'
require_relative '../day8_signals/segment_search'
require_relative '../day8_signals/segment'

class SegmentSearchTest < Minitest::Test

  def test_single_line_splitting
    segment = Segment.new('acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf')
    assert_equal ['abcdefg', 'bcdef', 'acdfg', 'abcdf', 'abd', 'abcdef', 'bcdefg', 'abef', 'abcdeg', 'ab'], segment.patterns
    assert_equal ['cdfeb', 'fcadb', 'cdfeb', 'cdbaf'], segment.outputs
  end

  def test_single_line_splitting
    segment = Segment.new('acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf')
    expected = { "a" => ["d"], "b" => ["e"], "c" => ["a"], "d" => ["f"], "e" => ["g"], "f" => ["b"], "g" => ["c"] }

    segment.decipher

    assert_equal expected, segment.matcher
  end

  def test_single_segment_search_result
    assert_equal 0, segment_search('day8_signals/single_test_input.txt')
  end

  def test_segment_search_result
    assert_equal 26, segment_search('day8_signals/test_input.txt')
  end

  def test_reasl_segment_search_result
    assert_equal 521, segment_search('day8_signals/input.txt')
  end
end
