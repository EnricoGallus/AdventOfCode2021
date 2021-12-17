def find_cheapest_path(file_name)
  board = construct_board(file_name)
  @x = board[0].length - 1
  @y = board.length - 1
  @hashed_board = board.each.with_index.with_object({}) { |(x_array, y_index), h| x_array.each_with_index { |value, x_index| h["#{x_index},#{y_index}"] = value } }
  @hashed_board['0,0'] = 0
  calculate_costs('0,0', "#{@x},#{@y}")
  @hashed_board["#{@x},#{@y}"]
end

def five_time_larger(file_name)
  board = construct_board(file_name)
  @x = board[0].length
  @y = board.length
  @hashed_board = board.each.with_index.with_object({}) { |(x_array, y_index), h| x_array.each_with_index { |value, x_index| h["#{x_index},#{y_index}"] = value } }
  # fill x
  (1..4).each do |x|
    board.each_with_index.with_object(@hashed_board) { |(x_array, y_index), h| x_array.each_with_index { |value, x_index| h["#{x_index + (x * @x)},#{y_index}"] = value + x > 9 ? value + x - 9 : value + x } }
  end
  hash_board_clone = @hashed_board.clone
  (1..4).each do |factor|
    hash_board_clone.each do |key, value|
      x, y = x_y(key)
      @hashed_board["#{x},#{y + factor * @y}"] = value + factor > 9 ? value + factor - 9 : value + factor
    end

  end

  @x = @x * 5 - 1
  @y = @y * 5 - 1
  @hashed_board['0,0'] = 0
  calculate_costs('0,0', "#{@x},#{@y}")
  @hashed_board["#{@x},#{@y}"]
end

def construct_board(file_name)
  File.readlines(file_name)
      .map(&:strip)
      .collect { |line| line.split('').map(&:to_i) }
end

def calculate_costs(current_coordinates, destination)
  x, y = x_y(current_coordinates)
  @hashed_board[current_coordinates] = cheapest_cost(x, y)
  return if current_coordinates == destination

  (x + 1..@x).each do |x|
    @hashed_board["#{x},#{y}"] = cheapest_cost(x, y)
  end

  (y + 1..@y).each do |y|
    @hashed_board["#{x},#{y}"] = cheapest_cost(x, y)
  end

  calculate_costs("#{x + 1},#{y + 1}", destination)
end

def cheapest_cost(x, y)
  left = @hashed_board["#{x - 1},#{y}"]
  upper = @hashed_board["#{x},#{y - 1}"]
  cheapest_adjacent = [left, upper].compact.min
  cheapest_adjacent.nil? ? @hashed_board["#{x},#{y}"] : @hashed_board["#{x},#{y}"] + cheapest_adjacent
end

def x_y(string_coord)
  string_coord.split(',').map(&:to_i)
end
