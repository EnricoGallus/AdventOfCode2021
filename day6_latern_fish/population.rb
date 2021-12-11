def population(file_name, days)
  populations = File.read(file_name)
                    .split(',')
                    .map(&:to_i)
                    .tally

  (0..8).each do |life|
    populations[life] = 0 unless populations.key?(life)
  end

  populations = populations
                  .sort_by { |k, v| k }
                  .reverse
                  .to_h
  days.times do
    new_population = populations.fetch(0, 0)
    populations[0] = 0
    populations.reverse_each do |key, value|
      next if key.zero?

      populations[key - 1] = value
      populations[key] = 0
    end

    populations[8] = new_population
    populations[6] += new_population
  end

  populations.values.sum
end
