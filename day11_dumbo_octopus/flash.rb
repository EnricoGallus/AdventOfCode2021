def flash(file_name, step_count)
  board = Board.new(File.readlines(file_name)
                        .map(&:strip)
                        .collect { |line| line.split('').map(&:to_i) })
  step_count.times.each { |step| simulate_step(board) }
  board.flash_count
end

def simulate_step(board)
  board.board.each_with_index do |row, row_index|
    row.each_with_index do |current, col_index|
      increase_level(row_index, col_index, board)
    end
  end
  board.count_remove_flash
end

def increase_level(row_index, col_index, board)
  current_level = board.board[row_index][col_index]
  return if board.marked?(row_index, col_index)

  next_level = current_level + 1
  if next_level > 9
    board.flashing(row_index, col_index)
    board.board[row_index][col_index] = 0
    increase_neighbors(row_index, col_index, board)
  else
    board.board[row_index][col_index] = next_level
  end
end

def increase_neighbors(row_index, col_index, board)
  if row_index - 1 >= 0
    increase_level(row_index - 1, col_index, board) # above
    increase_level(row_index - 1, col_index - 1, board) if col_index - 1 >= 0 # upper left
    increase_level(row_index - 1, col_index + 1, board) if col_index + 1 < board.col_length # upper right
  end

  increase_level(row_index, col_index - 1, board) if col_index - 1 >= 0 # left
  increase_level(row_index, col_index + 1, board) if col_index + 1 < board.row_length # right

  if row_index + 1 < board.row_length
    increase_level(row_index + 1, col_index, board) # lower
    increase_level(row_index + 1, col_index - 1, board) if col_index - 1 >= 0 # lower left
    increase_level(row_index + 1, col_index + 1, board) if col_index + 1 < board.col_length # lower right
  end
end
