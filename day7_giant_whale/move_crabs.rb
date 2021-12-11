def move_crabs(file_name)
  positions = File.read(file_name)
                  .split(',')
                  .map(&:to_i)
  min = positions.min
  max = positions.max
  mean = positions.sum / positions.length
  lower = calculated_cheapest(min, mean, positions)
  upper = calculated_cheapest(mean, max, positions)
  [lower, upper].min
end

def calculated_cheapest(lower, upper, positions)
  previous = nil
  (lower..upper).each do |level|
    result = positions.reduce(0) { |sum, x| sum + (level - x).abs }
    return previous if !previous.nil? && previous < result

    previous = result
  end
end
