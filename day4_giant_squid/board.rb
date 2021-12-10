class Board
  def initialize(lines)
    @board = lines.map { |line| line.split(' ').map(&:to_i) }
    @matches = Array.new(5, []).map { |sub| Array.new(5, 0) }
  end

  def mark(number)
    @board.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        if column == number
          @matches[row_index][column_index] = 1
          return true if row_has_bingo(@matches) || row_has_bingo(@matches.dup.transpose)
        end
      end
    end

    false
  end

  def unmarked_count
    count = 0
    @board.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        count += column if (@matches[row_index][column_index]).zero?
      end
    end

    count
  end

  private

  def row_has_bingo(array)
    array.any? { |row| !row.include?(0) }
  end
end
