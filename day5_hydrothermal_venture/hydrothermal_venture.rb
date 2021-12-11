require_relative 'vent'

def venture(file_name, advanced)
  File
    .read(file_name).split("\n").collect { |line| Vent.new(line) }
    .map { |vent| vent.points(advanced) }
    .flatten
    .tally
    .select { |key, value| value > 1 }
    .count
end
