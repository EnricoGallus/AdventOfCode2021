previous = nil
increased_count = 0
File.open('measurements.txt').each do |line|
  depth = line.to_i
  increased_count += 1 if !previous.nil? && previous < depth
  previous = depth
end

puts increased_count
