require_relative 'board'

def bingo(file_name)
  lines = File.readlines(file_name).collect(&:strip).reject(&:empty?)
  numbers = lines.shift.split(',').map(&:to_i)
  boards = []
  boards.push(Board.new(lines.shift(5))) until lines.empty?

  numbers.each do |number|
    boards.each do |board|
      board.set_position(boards.count(&:solved?) + 1) if board.mark(number)
    end

    return boards.max_by(&:position).unmarked_count * number if boards.count(&:solved?) == boards.length
  end
end
