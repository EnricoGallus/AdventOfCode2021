def find_cheapest_path(file_name)
  board = construct_board(file_name)
  dijkstra(board)
end

def five_time_larger(file_name)
  board = construct_board(file_name)

  # extend tiles
  board.map { |line| line.concat((1..4).map { |x| line.map { |value| value + x > 9 ? value + x - 9 : value + x } }.flatten) }
  new_board = board.clone
  (1..4).each do |y|
    board.select { |line| new_board.push(line.map { |value| value + y > 9 ? value + y - 9 : value + y }) }
  end

  dijkstra(new_board)
end

def construct_board(file_name)
  File.readlines(file_name)
      .map(&:strip)
      .collect { |line| line.split('').map(&:to_i) }
end

def dijkstra(board)
  queue = Queue.new
  distance = {}
  board.each_with_index do |row, y_index|
    row.each_with_index { |value, x_index| distance[[x_index, y_index]] = Float::INFINITY }
  end
  start_pos = [0, 0]
  end_pos = [board[0].length - 1, board.length - 1]
  distance[start_pos] = 0
  queue.push([0, start_pos])
  d_pos = [[0, 1], [1, 0], [-1, 0], [0, -1]]

  until queue.empty?
    current_distance, current_node = queue.pop
    next if current_distance > distance[current_node]

    x, y = current_node
    d_pos.each do |next_pos|
      next_x, next_y = next_pos
      dx = next_x + x
      dy = next_y + y
      next unless dx >= 0 && dx <= end_pos[0] && dy >= 0 && dy <= end_pos[1]

      cost = current_distance + board[dx][dy]
      if cost < distance[[dx, dy]]
        distance[[dx, dy]] = cost
        queue.push([cost, [dx, dy]])
      end
    end
  end

  distance[end_pos]
end

def calculate_costs(board, current)
  x, y = current
  board[x][y] = cheapest_cost(board, x, y)

  (x..(board[0].length - 1)).each do |x|
    board[x][y] = cheapest_cost(board, x, y)
  end

  calculate_costs(board, [x, y + 1]) if y < board.length - 1
end

def cheapest_cost(board, x, y)
  left = board[x - 1][y] if x.positive?
  upper = board[x][y - 1] if y.positive?
  cheapest_adjacent = [left, upper].compact.min
  current_value = board[x][y]
  cheapest_adjacent.nil? ? current_value : current_value + cheapest_adjacent
end