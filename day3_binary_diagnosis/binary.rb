def binary(file_name)
  gamma = File.readlines(file_name)
              .map { |line| line.strip.split('').each(&:to_i) }
              .transpose
              .map { |column| column.count('0') > column.length / 2 ? 0 : 1 }

  gamma.join('').to_i(2) * (Array.new(gamma.length, 1).join('').to_i(2) - gamma.join('').to_i(2))
end
