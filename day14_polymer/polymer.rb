def pair_insertion(file_name, steps)
  result = File.read(file_name).split("\n\n")
  template = result[0]
  chain = result[1].split("\n").map { |reaction| reaction.split(' -> ').flatten }.to_h
  steps.times do
    template = template.split('').map.with_index { |char, idx| idx.zero? ? char : chain[template[idx - 1] + char] + char }.join
  end

  polymer = template.split('').tally
  polymer.max_by { |k, v| v }[1] - polymer.min_by { |k, v| v }[1]
end