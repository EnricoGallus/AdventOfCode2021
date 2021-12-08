depths = []
File.open('measurements.txt').each { |line| depths << line.to_i }

previous = nil
increased_count = 0

depths.each_cons(3).map do |triple|
  depth = triple.inject(:+)
  increased_count += 1 if !previous.nil? && previous < depth
  previous = depth
end

puts increased_count
