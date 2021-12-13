def origami(file_name)
  lines = File.readlines(file_name).map(&:strip).reject(&:empty?)
  instructions = lines.select { |line| line.start_with?('fold along') }
  dots = lines.reject { |line| line.start_with?('fold along') }.map { |e| e.split(',').map(&:to_i) }
  max_x = dots.max_by { |a| a[0] }[0] + 1
  max_y = dots.max_by { |a| a[1] }[1] + 1
  data = Array.new(max_y) { Array.new(max_x) }
  dots.each { |coord| data[coord[1]][coord[0]] = 1 }

  instruction = instructions[0].gsub('fold along ', '').split('=')
  if instruction[0] == 'y'
    row = instruction[1].to_i
    keep = data.slice(0, row)
    data.slice(row + 1, max_y)
               .reverse
               .each_with_index { |y, y_index| y.each_with_index { |x, x_index| keep[y_index][x_index] = 1 unless x.nil? } }
    data = keep
  else
    column = instruction[1].to_i
    keep = data.transpose.slice(0, column)
    data.transpose.slice(column + 1, max_x)
        .reverse
        .each_with_index { |y, y_index| y.each_with_index { |x, x_index| keep[y_index][x_index] = 1 unless x.nil? } }
    data = keep.transpose
  end

  data.flatten.compact.sum
end