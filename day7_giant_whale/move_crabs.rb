def move_crabs(file_name, advanced)
  positions = File.read(file_name)
                  .split(',')
                  .map(&:to_i)
  min = positions.min
  max = positions.max
  mean = positions.sum / positions.length
  [calculated_cheapest(min, mean, positions, advanced), calculated_cheapest(mean, max, positions, advanced)].min
end

def calculated_cheapest(lower, upper, positions, advanced)
  previous = nil
  (lower..upper).each do |level|
    result = positions.reduce(0) { |sum, x| sum + get_step(level, x, advanced) }
    return previous if !previous.nil? && previous < result

    previous = result
  end

  previous
end

def get_step(level, num, advanced)
  step = (level - num).abs
  if advanced
    step.zero? ? step : (1..step).reduce(0) { |sum, x| sum + x }
  else
    step
  end
end
