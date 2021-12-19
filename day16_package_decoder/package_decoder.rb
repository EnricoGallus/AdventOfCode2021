def package_decoder(file_name)
  decoded = decode(File.read(file_name))
  packages = []
  parse(decoded, packages) until decoded.empty?
  packages
end

def decode(content)
  content.split('').map { |char| char.hex.to_s(2).rjust(4, '0') }.join.split('')
end

def parse(content, packages, continue_parse = true)
  return if content.empty?

  version = content.shift(3).join.to_i(2)
  type = content.shift(3).join.to_i(2)
  length_type = nil
  case type
  when 4 # literal
    group_length = content.length
    groups = read_literal_group(content)
    packages.push([version, type, length_type, groups.flatten.join.to_i(2)])
    content.shift(group_length % 5) if content.length <= 6
    parse(content, packages, continue_parse) if continue_parse
  else # operator
    length_type = content.shift(1)[0].to_i
    packages.push([version, type, length_type, nil])
    case length_type
    when 0
      subpackages = content.shift(content.shift(15).join.to_i(2))
      parse(subpackages, packages, continue_parse)
    when 1
      subpackages_count = content.shift(11).join.to_i(2)
      subpackages_count.times do
        parse(content, packages, false)
      end
      continue_parse = true
    end
  end
end

def read_literal_group(content)
  groups = []
  continue_read = true
  while continue_read
    group = content.shift(5)
    next_group_bit = group[0]
    groups.push(group[1..4])
    continue_read = next_group_bit == 1
  end
  groups
end