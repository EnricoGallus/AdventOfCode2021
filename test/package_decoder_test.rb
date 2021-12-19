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
    assert_literal 6, 4, 2021, packages[0]
  end

  def test_version_literal
    assert_equal 6, determine_version('110100101111111000101000'.split('').map(&:to_i))
  end

  def test_parse_operator_type_0
    packages = []
    parse('00111000000000000110111101000101001010010001001000000000'.split('').map(&:to_i), packages)
    assert_equal 3, packages.length
    assert_operator 1, 6, 0, packages[0]
    assert_literal 6, 4, 10, packages[1]
    assert_literal 2, 4, 20, packages[2]
  end

  def test_version_operator_type_0
    assert_equal 9, determine_version('00111000000000000110111101000101001010010001001000000000'.split('').map(&:to_i))
  end

  def test_parse_operator_type_1
    packages = []
    parse('11101110000000001101010000001100100000100011000001100000'.split('').map(&:to_i), packages)
    assert_equal 4, packages.length
    assert_operator 7, 3, 1, packages[0]
    assert_literal 2, 4, 1, packages[1]
    assert_literal 4, 4, 2, packages[2]
    assert_literal 1, 4, 3, packages[3]
  end

  def test_version_operator_type_1
    assert_equal 14, determine_version('11101110000000001101010000001100100000100011000001100000'.split('').map(&:to_i))
  end

  def test_decode_example_1
    binary = decode('8A004A801A8002F478')
    packages = []
    parse(binary, packages)

    assert_equal 4, packages.length
    assert_operator 4, 2, 1, packages[0]
    assert_operator 1, 2, 1, packages[1]

    assert_operator 5, 2, 0, packages[2]
    assert_literal 6, 4, 15, packages[3]
  end

  def test_version_example_1
    binary = decode('8A004A801A8002F478')
    assert_equal 16, determine_version(binary)
  end

  def test_decode_example_2
    binary = decode('620080001611562C8802118E34')
    packages = []
    parse(binary, packages)

    assert_equal 7, packages.length
    assert_operator 3, 0, 1, packages[0]
    assert_operator 0, 0, 0, packages[1]
    assert_operator 1, 0, 1, packages[2]
    assert_literal 0, 4, 10, packages[3]
    assert_literal 5, 4, 11, packages[4]
    assert_literal 0, 4, 12, packages[5]
    assert_literal 3, 4, 13, packages[6]
  end

  def test_version_example_2
    binary = decode('620080001611562C8802118E34')
    assert_equal 12, determine_version(binary)
  end

  def test_decode_example_3
    binary = decode('C0015000016115A2E0802F182340')
    packages = []
    parse(binary, packages)

    assert_equal 7, packages.length
    assert_operator 6, 0, 0, packages[0]
    assert_operator 0, 0, 0, packages[1]
    assert_literal 0, 4, 10, packages[2]
    assert_literal 6, 4, 11, packages[3]
    assert_operator 4, 0, 1, packages[4]
    assert_literal 7, 4, 12, packages[5]
    assert_literal 0, 4, 13, packages[6]
  end

  def test_version_example_3
    binary = decode('C0015000016115A2E0802F182340')
    assert_equal 23, determine_version(binary)
  end

  def test_decode_example_4
    binary = decode('A0016C880162017C3686B18A3D4780')
    packages = []
    parse(binary, packages)

    assert_equal 8, packages.length
    assert_operator 5, 0, 0, packages[0]
    assert_operator 1, 0, 1, packages[1]
    assert_operator 3, 0, 1, packages[2]
    assert_literal 7, 4, 6, packages[3]
    assert_literal 6, 4, 6, packages[4]
    assert_literal 5, 4, 12, packages[5]
    assert_literal 2, 4, 15, packages[6]
    assert_literal 2, 4, 15, packages[7]
  end

  def test_version_example_4
    binary = decode('A0016C880162017C3686B18A3D4780')
    assert_equal 31, determine_version(binary)
  end

  def assert_literal (version, type, literal, package)
    assert_equal version, package.version
    assert_equal type, package.type
    assert_equal literal, package.literal
  end

  def assert_operator(version, type, length, package)
    assert_equal version, package.version
    assert_equal type, package.type
    assert_equal length, package.length
  end

  def test_decode_real
    assert_equal 1052, package_decoder('day16_package_decoder/input.txt')
  end
end
