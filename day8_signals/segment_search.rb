def segment_search(file_name)
  #dictionary = { 'abcefg' => 0, 'cf' => 1, 'acdeg' => 2, 'acdfg' => 3, 'bcdf' => 4, 'abdfg' => 5, 'abdefg' => 6, 'acf' => 7, 'abcdefg' => 8, 'abcdfg' => 9 }
  File.readlines(file_name)
      .map(&:strip)
      .map { |line| Segment.new(line).outputs }
      .flatten
      .count { |output| output.length == 2 || output.length == 3 || output.length == 4 || output.length == 7 }

end
