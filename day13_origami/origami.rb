def origami(file_name, limit = nil)
  lines = File.readlines(file_name).map(&:strip).reject(&:empty?)
  instructions = lines.select { |line| line.start_with?('fold along') }
  dots = lines.reject { |line| line.start_with?('fold along') }.map { |e| e.split(',').map(&:to_i) }
  max_x = dots.max_by { |a| a[0] }[0] + 1
  max_y = dots.max_by { |a| a[1] }[1] + 1
  data = Array.new(max_y) { Array.new(max_x) }
  dots.each { |coord| data[coord[1]][coord[0]] = 1 }
  limit = instructions.length if limit.nil?

  instructions.take(limit).each do |line|
    instruction = line.gsub('fold along ', '').split('=')
    fold_at = instruction[1].to_i
    data = if instruction[0] == 'y'
             fold_paper(data, fold_at, max_y)
           else
             fold_paper(data.transpose, fold_at, max_x).transpose
           end
  end

  data.flatten.compact.sum
end

def fold_paper(data, fold_at, max)
  keep = data.slice(0, fold_at)
  data.slice(fold_at + 1, max)
      .reverse
      .each_with_index { |y, y_index| y.each_with_index { |x, x_index| keep[y_index][x_index] = 1 unless x.nil? } }
  keep
end