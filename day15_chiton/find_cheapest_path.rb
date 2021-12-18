def find_cheapest_path(file_name)
  board = construct_board(file_name)
  board[0][0] = 0
  calculate_costs(board, [0, 0])
end

def five_time_larger(file_name)
  board = construct_board(file_name)

  # extend tiles
  board.map { |line| line.concat((1..4).map { |x| line.map { |value| value + x > 9 ? value + x - 9 : value + x } }.flatten) }
  new_board = board.clone
  (1..4).each do |y|
    board.select { |line| new_board.push(line.map { |value| value + y > 9 ? value + y - 9 : value + y }) }
  end

  new_board[0][0] = 0
  calculate_costs(new_board, [0, 0])
end

def construct_board(file_name)
  File.readlines(file_name)
      .map(&:strip)
      .collect { |line| line.split('').map(&:to_i) }
end

def calculate_costs(board, current)
  x, y = current
  board[x][y] = cheapest_cost(board, x, y)
  return board[x][y] if x == board[0].length - 1 && y == board.length - 1

  (x + 1..(board[0].length - 1)).each do |x|
    board[x][y] = cheapest_cost(board, x, y)
  end

  (y + 1..(board.length - 1)).each do |y|
    board[x][y] = cheapest_cost(board, x, y)
  end

  calculate_costs(board, [x + 1, y + 1])
end

def cheapest_cost(board, x, y)
  left = board[x - 1][y] if x.positive?
  upper = board[x][y - 1] if y.positive?
  cheapest_adjacent = [left, upper].compact.min
  current_value = board[x][y]
  cheapest_adjacent.nil? ? current_value : current_value + cheapest_adjacent
end
