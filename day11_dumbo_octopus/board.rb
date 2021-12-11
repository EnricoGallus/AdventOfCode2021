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
end
