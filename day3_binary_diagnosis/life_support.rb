def life_support(file_name)
  bit_criteria = File.readlines(file_name)
                     .map { |line| line.strip.split('').map(&:to_i) }
  o = oxygen(bit_criteria.clone)
  c = co2(bit_criteria.clone)
  o.join('').to_i(2) * c.join('').to_i(2)
end

def oxygen(bit_criteria)
  (0..bit_criteria.length - 1).each do |index|
    rating = oxygen_rating(bit_criteria.transpose[index])
    bit_criteria = bit_criteria.select { |sub| sub[index] == rating }
    return bit_criteria if bit_criteria.length == 1
  end

  bit_criteria
end

def oxygen_rating(column)
  distribution = column.tally
  if distribution[0] == distribution[1]
    1
  else
    distribution.invert.max&.last
  end
end

def co2(bit_criteria)
  (0..bit_criteria.length - 1).each do |index|
    remove_with = co2_rating(bit_criteria.transpose[index])
    bit_criteria = bit_criteria.select { |sub| sub[index] == remove_with }
    return bit_criteria if bit_criteria.length == 1
  end

  bit_criteria
end

def co2_rating(column)
  distribution = column.tally
  if distribution[0] == distribution[1]
    0
  else
    distribution.invert.min&.last
  end
end
