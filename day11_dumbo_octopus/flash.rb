def flash(file_name, step_count)
  board = board(file_name)
  step_count.times.each { |step| board.simulate_step && board.count_remove_flash }
  board.flash_count
end

def synchronize(file_name)
  board = board(file_name)
  i = 0
  loop do
    i += 1
    board.simulate_step
    break if board.synchronized?

    board.count_remove_flash
  end
  i
end

def board(file_name)
  Board.new(File.readlines(file_name)
                .map(&:strip)
                .collect { |line| line.split('').map(&:to_i) })
end