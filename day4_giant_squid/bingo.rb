require_relative 'board'

def bingo(file_name)
  lines = File.readlines(file_name).collect(&:strip).reject(&:empty?)
  numbers = lines.shift.split(',').map(&:to_i)
  boards = []
  boards.push(Board.new(lines.shift(5))) until lines.empty?

  numbers.each do |number|
    boards.each do |board|
      if board.mark(number)
        return board.unmarked_count * number
      end
    end
  end
end
