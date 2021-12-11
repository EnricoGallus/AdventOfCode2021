def syntax_advanced(file_name)
  @corrupt_lookup = { '(' => 1, '[' => 2, '{' => 3, '<' => 4 }
  points = File.readlines(file_name)
             .map(&:strip)
             .reject { |line| corrupt?(line) }
             .map { |line| collect_points(line) }
             .sort

  points[points.length / 2]
end

def corrupt?(line)
  correction = []
  line.split('').each do |char|
    key_value = get_key_value(char)
    if key_value[1] == 1
      correction.push(key_value[0])
    else
      last_element = correction.pop
      return true if last_element != key_value[0]
    end
  end
  line.replace(correction.join(''))
  false
end

def collect_points(line)
  line.split('').reverse
      .map { |char| @corrupt_lookup[char] }
      .reduce { |sum, point| sum * 5 + point }
end

def get_key_value(char)
  case char
  when '('
    [char, 1]
  when ')'
    ['(', -1]
  when '['
    [char, 1]
  when ']'
    ['[', -1]
  when '{'
    [char, 1]
  when '}'
    ['{', -1]
  when '<'
    [char, 1]
  when '>'
    ['<', -1]
  else
    []
  end
end

