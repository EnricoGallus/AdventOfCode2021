class Basin
  def initialize(array)
    @marked = {}
    @array = array
    @row_count = array.length
    @col_count = array[0].length
  end

  def find_basins
    result = []
    @array.each_with_index do |row, row_index|
      row.each_with_index do |current, col_index|
        @counter = 0
        find_basin_size(row_index, col_index)
        result.push(@counter) if @counter != 0
      end
    end

    result.sort.reverse.take(3).reduce { |sum, value| sum * value }
  end

  private

  def find_basin_size(row_index, col_index)
    return unless belong_to_basin(row_index, col_index)

    @counter += 1
    @marked["#{row_index}#{col_index}"] = 1

    find_basin_size(row_index - 1, col_index) if row_index - 1 >= 0 # above
    find_basin_size(row_index + 1, col_index) if row_index + 1 < @row_count # below
    find_basin_size(row_index, col_index - 1) if col_index - 1 >= 0 # left
    find_basin_size(row_index, col_index + 1) if col_index + 1 < @col_count # right
  end

  def belong_to_basin(row_index, col_index)
    @array[row_index][col_index] != 9 && !@marked.key?("#{row_index}#{col_index}")
  end
end
