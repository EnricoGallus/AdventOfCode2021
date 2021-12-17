def find_path(file_name)
  board = File.readlines(file_name)
              .map(&:strip)
              .collect { |line| line.split('').map(&:to_i) }
  @hashed_board = board.each.with_index.with_object({}) { |(x_array, y_index), h| x_array.each_with_index { |value, x_index| h["#{x_index},#{y_index}"] = value } }
  @x = board[0].length - 1
  @y = board.length - 1
  @lowest_cost = nil
  possible_paths('0,0', "#{@x},#{@y}", 0)
  @lowest_cost
end

def possible_paths(current_coordinates, destination, cost_so_far)
  current_value = @hashed_board[current_coordinates]
  if current_coordinates == destination
    cost = cost_so_far + current_value - @hashed_board['0,0']
    @lowest_cost = cost if @lowest_cost.nil? || cost < @lowest_cost
    puts @lowest_cost
  else
    adjacent_coords(current_coordinates).each do |adjacent_coord|
      possible_paths(adjacent_coord, destination, cost_so_far + current_value)
    end
  end
end

def adjacent_coords(current_coord)
  x, y = current_coord.split(',').map(&:to_i)
  adjacents = []
  adjacents.push("#{x + 1},#{y}") if x < @x
  adjacents.push("#{x},#{y + 1}") if y < @y
  return adjacents
end
