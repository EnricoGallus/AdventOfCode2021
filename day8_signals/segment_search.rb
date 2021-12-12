def segment_count(file_name)
  File.readlines(file_name)
      .map(&:strip)
      .map { |line| Segment.new(line).outputs }
      .flatten
      .count { |output| output.length == 2 || output.length == 3 || output.length == 4 || output.length == 7 }

end

def segment_search(file_name)
  File.readlines(file_name)
      .map(&:strip)
      .map { |line| Segment.new(line).decipher(dictionary) }
      .sum
end

def dictionary
  { 'abcdeg' => 0, 'ab' => 1, 'acdfg' => 2, 'abcdf' => 3, 'abef' => 4, 'bcdef' => 5, 'bcdefg' => 6, 'abd' => 7, 'abcdefg' => 8, 'abcdef' => 9 }
end
