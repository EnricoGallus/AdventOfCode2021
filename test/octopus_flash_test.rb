require 'minitest/autorun'
require_relative '../day11_dumbo_octopus/flash'
require_relative '../day11_dumbo_octopus/board'

class OctopusFlashTest < Minitest::Test

  def test_octopus_flash
    assert_equal 1656, flash('day11_dumbo_octopus/test_input.txt', 100)
  end

  def test_octopus_flash
    assert_equal 1571, flash('day11_dumbo_octopus/input.txt', 100)
  end

  def test_increase_energy_level_only_increase
    input =
      [
        [1, 1, 1],
        [1, 1, 1],
        [1, 1, 1]
      ]
    expected =
      [
        [2, 2, 2],
        [2, 2, 2],
        [2, 2, 2]
      ]
    board = Board.new(input)
    simulate_step(board)

    assert_equal expected, board.board
  end

  def test_increase_energy_left_upper_explode_but_no_other
    input =
      [
        [9, 1, 1],
        [1, 1, 1],
        [1, 1, 1]
      ]
    expected =
      [
        [0, 3, 2],
        [3, 3, 2],
        [2, 2, 2]
      ]
    board = Board.new(input)
    simulate_step(board)

    assert_equal expected, board.board
  end

  def test_crazy_flashing
    input =
      [
        [1, 1, 1, 1, 1],
        [1, 9, 9, 9, 1],
        [1, 9, 1, 9, 1],
        [1, 9, 9, 9, 1],
        [1, 1, 1, 1, 1]
      ]
    expected =
      [
        [3, 4, 5, 4, 3],
        [4, 0, 0, 0, 4],
        [5, 0, 0, 0, 5],
        [4, 0, 0, 0, 4],
        [3, 4, 5, 4, 3]
      ]
    board = Board.new(input)
    simulate_step(board)

    assert_equal expected, board.board
  end

  def test_all_flashing
    input =
      [
        [9, 9, 9, 9, 9],
        [9, 9, 9, 9, 9],
        [9, 9, 9, 9, 9],
        [9, 9, 9, 9, 9],
        [9, 9, 9, 9, 9]
      ]
    expected =
      [
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0]
      ]
    board = Board.new(input)
    simulate_step(board)

    assert_equal expected, board.board
  end

  def test_increase_energy_zero_in_new_step
    input =
      [
        [3, 4, 5, 4, 3],
        [4, 0, 0, 0, 4],
        [5, 0, 0, 0, 5],
        [4, 0, 0, 0, 4],
        [3, 4, 5, 4, 3]
      ]
    expected =
      [
        [4, 5, 6, 5, 4],
        [5, 1, 1, 1, 5],
        [6, 1, 1, 1, 6],
        [5, 1, 1, 1, 5],
        [4, 5, 6, 5, 4]
      ]
    board = Board.new(input)
    simulate_step(board)

    assert_equal expected, board.board
  end
end
