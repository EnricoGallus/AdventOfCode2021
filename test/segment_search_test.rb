require 'minitest/autorun'
require_relative '../day8_signals/segment_search'
require_relative '../day8_signals/segment'

class SegmentSearchTest < Minitest::Test

  def test_single_line_splitting
    segment = Segment.new('acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf')
    assert_equal ["ab", "abd", "abef", "bcdef", "acdfg", "abcdf", "abcdef", "bcdefg", "abcdeg", "abcdefg"], segment.patterns
    assert_equal ["cdfeb", "fcadb", "cdfeb", "cdbaf"], segment.outputs
  end

  def test_single_line_decipher_same_mapping
    segment = Segment.new('acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf')

    result = segment.decipher(dictionary)

    assert_equal 5353, result
  end

  def test_single_line_decipher_different_mapping
    segment = Segment.new('fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg')

    result = segment.decipher(dictionary)

    assert_equal 1197, result
  end

  def test_single_segment_count_result
    assert_equal 0, segment_count('day8_signals/single_test_input.txt')
  end

  def test_segment_count_result
    assert_equal 26, segment_count('day8_signals/test_input.txt')
  end

  def test_real_segment_count_result
    assert_equal 521, segment_count('day8_signals/input.txt')
  end

  def test_single_segment_search_result
    assert_equal 5353, segment_search('day8_signals/single_test_input.txt')
  end

  def test_segment_search_result
    assert_equal 61229, segment_search('day8_signals/test_input.txt')
  end

  def test_real_segment_search_result
    assert_equal 1016804, segment_search('day8_signals/input.txt')
  end
end
