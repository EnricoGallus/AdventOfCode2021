def low_point(file_name)
  positions = File.readlines(file_name).map(&:strip).collect { |line| line.split('').map(&:to_i) }
  low_points = []
  positions.each_with_index do |row, row_index|
    row.each_with_index do |current, col_index|
      above = positions[row_index - 1][col_index] if row_index - 1 >= 0
      below = positions[row_index + 1][col_index] if row_index + 1 < positions.length
      left = positions[row_index][col_index - 1] if col_index - 1 >= 0
      right = positions[row_index][col_index + 1] if col_index + 1 < row.length
      low_points.push(current) if [above, below, left, right].compact.all? { |adjacent| adjacent > current }
    end
  end

  low_points.sum + low_points.length
end
