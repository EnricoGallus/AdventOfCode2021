def measure_depth(file_name)
  previous = nil
  increased_count = 0
  File.open(file_name).each do |line|
    depth = line.to_i
    increased_count += 1 if !previous.nil? && previous < depth
    previous = depth
  end

  increased_count
end
