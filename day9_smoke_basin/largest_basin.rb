def largest_basin(file_name)
  basin = Basin.new(File.readlines(file_name).map(&:strip).collect { |line| line.split('').map(&:to_i) })
  basin.find_basins
end
