def pair_insertion(file_name, steps)
  result = File.read(file_name).split("\n\n")
  polymer = result[0].split('')
  chain = Hash[result[1].split("\n").map { |reaction| reaction.split(' -> ').flatten }]
  steps.times do
    index = 1
    loop do
      char = polymer[index]
      previous_char = polymer[index - 1]
      if chain.key?(previous_char + char)
        polymer.insert(index, chain[previous_char + char])
        index += 2
      else
        index += 1
      end
      break if index >= polymer.length
    end
  end

  polymer = polymer.tally
  polymer.max_by { |k, v| v }[1] - polymer.min_by { |k, v| v }[1]
end