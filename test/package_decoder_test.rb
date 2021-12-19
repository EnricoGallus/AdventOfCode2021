require 'minitest/autorun'
require_relative '../day16_package_decoder/package_decoder'

class PackageDecoderTest < Minitest::Test

  def test_decoding_package
    assert_equal %w[1 1 0 1 0 0 1 0 1 1 1 1 1 1 1 0 0 0 1 0 1 0 0 0 0 0 0 0], decode('D2FE280')
  end

  def test_parse_literal
    packages = []
    parse('110100101111111000101000'.split('').map(&:to_i), packages)
    assert_equal 1, packages.length
    assert_equal [6, 4, nil, 2021], packages[0]
  end

  def test_parse_operator_type_0
    packages = []
    parse('00111000000000000110111101000101001010010001001000000000'.split('').map(&:to_i), packages)
    assert_equal 3, packages.length
    assert_equal [1, 6, 0, nil], packages[0]
    assert_equal [6, 4, nil, 10], packages[1]
    assert_equal [2, 4, nil, 20], packages[2]
  end

  def test_parse_operator_type_1
    packages = []
    parse('11101110000000001101010000001100100000100011000001100000'.split('').map(&:to_i), packages)
    assert_equal 4, packages.length
    assert_equal [7, 3, 1, nil], packages[0]
    assert_equal [2, 4, nil, 1], packages[1]
    assert_equal [4, 4, nil, 2], packages[2]
    assert_equal [1, 4, nil, 3], packages[3]
  end

  def test_decode_example_1
    binary = decode('8A004A801A8002F478')
    packages = []
    parse(binary, packages)

    assert_equal 4, packages.length
    assert_equal [4, 2, 1, nil], packages[0]
    assert_equal [1, 2, 1, nil], packages[1]
    assert_equal [5, 2, 0, nil], packages[2]
    assert_equal [6, 4, nil, 15], packages[3]
  end

  def test_decode_example_2
    binary = decode('620080001611562C8802118E34')
    packages = []
    parse(binary, packages)

    assert_equal 6, packages.length
    assert_equal [3, 0, 1, nil], packages[0]
    assert_equal [1, 2, 1, nil], packages[1]
    assert_equal [5, 2, 0, nil], packages[2]
    assert_equal [6, 4, nil, 15], packages[3]
  end

  def test_decode_example_3
    binary = decode('C0015000016115A2E0802F182340')
    packages = []
    parse(binary, packages)

    assert_equal 6, packages.length
    assert_equal [4, 2, 1, nil], packages[0]
    assert_equal [1, 2, 1, nil], packages[1]
    assert_equal [5, 2, 0, nil], packages[2]
    assert_equal [6, 4, nil, 15], packages[3]
  end

  def test_decode_example_3
    binary = decode('A0016C880162017C3686B18A3D4780')
    packages = []
    parse(binary, packages)

    assert_equal 8, packages.length
    assert_equal [5, 0, 0, nil], packages[0]
    assert_equal [1, 0, 1, nil], packages[1]
    assert_equal [3, 0, 1, nil], packages[2]
    assert_equal [7, 4, nil, 6], packages[3]
    assert_equal [6, 4, nil, 6], packages[4]
    assert_equal [5, 4, nil, 12], packages[5]
    assert_equal [2, 4, nil, 15], packages[6]
    assert_equal [2, 4, nil, 15], packages[7]
  end
end
