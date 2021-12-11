class Board
  attr_accessor :board, :flash_memory, :flash_count
  attr_reader :row_length, :col_length

  def initialize(array)
    @board = array
    @flash_memory = {}
    @row_length = array.length
    @col_length = array[0].length
    @flash_count = 0
  end

  def flashing(row, col)
    @flash_memory["#{row}#{col}"] = true
  end

  def count_remove_flash
    @flash_count += @flash_memory.count
    @flash_memory = {}
  end

  def marked?(row, col)
    @flash_memory["#{row}#{col}"]
  end

  def simulate_step
    @board.each_with_index do |row, row_index|
      row.each_with_index do |current, col_index|
        increase_level(row_index, col_index)
      end
    end
  end

  def synchronized?
    @flash_memory.count == @row_length * @col_length
  end

  private

  def increase_level(row_index, col_index)
    current_level = @board[row_index][col_index]
    return if marked?(row_index, col_index)

    next_level = current_level + 1
    if next_level > 9
      flashing(row_index, col_index)
      @board[row_index][col_index] = 0
      increase_neighbors(row_index, col_index)
    else
      @board[row_index][col_index] = next_level
    end
  end

  def increase_neighbors(row_index, col_index)
    if row_index - 1 >= 0
      increase_level(row_index - 1, col_index) # above
      increase_level(row_index - 1, col_index - 1) if col_index - 1 >= 0 # upper left
      increase_level(row_index - 1, col_index + 1) if col_index + 1 < @col_length # upper right
    end

    increase_level(row_index, col_index - 1) if col_index - 1 >= 0 # left
    increase_level(row_index, col_index + 1) if col_index + 1 < @row_length # right

    if row_index + 1 < @row_length
      increase_level(row_index + 1, col_index) # lower
      increase_level(row_index + 1, col_index - 1) if col_index - 1 >= 0 # lower left
      increase_level(row_index + 1, col_index + 1) if col_index + 1 < @col_length # lower right
    end
  end
end
