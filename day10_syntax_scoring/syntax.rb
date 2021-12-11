def syntax(file_name)
  incomplete_lookup = { '(' => 3, '[' => 57, '{' => 1197, '<' => 25137 }
  points = []
  File.readlines(file_name)
      .map(&:strip)
      .each do |line|
    correction = []
    line.split('').each do |char|
      key_value = get_key_value(char)
      if key_value[1] == 1
        correction.push(key_value[0])
      else
        last_element = correction.pop
        if last_element != key_value[0]
          points.push(incomplete_lookup[key_value[0]])
          next
        end
      end
    end
  end
  points.sum
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
