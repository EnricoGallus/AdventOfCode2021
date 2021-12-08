def measure_depth_advanced(fileName)
  depths = []
  File.open(fileName).each { |line| depths << line.to_i }

  previous = nil
  increased_count = 0

  depths.each_cons(3).map do |triple|
    depth = triple.inject(:+)
    increased_count += 1 if !previous.nil? && previous < depth
    previous = depth
  end

  increased_count
end
