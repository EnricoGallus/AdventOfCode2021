def find_path(file_name)
  @board = File.readlines(file_name).map(&:strip).collect { |line| line.split('').map(&:to_i) }
  @x = board[0].length - 1
  @y = board.length - 1
  @lowest_cost = nil
  possible_paths([0, 0], [@x, @y], 0)
  @lowest_cost
end

def possible_paths(current_coordinates, destination, cost_so_far)
  current_value = @board[current_coordinates[0]][current_coordinates[1]]
  if current_coordinates == destination
    cost = cost_so_far + current_value - @board[0][0]
    @lowest_cost = cost if @lowest_cost.nil? || cost < @lowest_cost
  else
    adjacent_coords(current_coordinates).each do |adjacent_coord|
      possible_paths(adjacent_coord, destination, cost_so_far + current_value)
    end
  end
end

def adjacent_coords(current_coord)
  adjacents = []
  adjacents.push([current_coord[0] + 1, current_coord[1]]) if current_coord[0] < @y
  adjacents.push([current_coord[0], current_coord[1] + 1]) if current_coord[1] < @x
  return adjacents
end
