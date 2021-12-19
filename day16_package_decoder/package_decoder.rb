require_relative 'package'

def package_decoder(file_name)
  decoded = decode(File.read(file_name))
  determine_version(decoded)
end

def determine_version(decoded)
  packages = []
  parse(decoded, packages)
  packages.compact.sum { |package| package.version }
end

def decode(content)
  content.split('').map { |char| char.hex.to_s(2).rjust(4, '0') }.join.split('')
end

def parse(content, packages)
  unless content.empty?
    content, package = convert_to_package(content)
    unless package.nil?
      packages.push(package)
      case package.length
      when 1
        sub_contents = []
        package.sub_count.times do
          content, package = convert_to_package(content)
          unless package.nil?
            packages.push(package)
            sub_contents.push(!package.sub_packages.nil? ? package.sub_packages : content)
          end
        end
        sub_contents.each { |sub_content| parse(sub_content, packages) }
      when 0
        parse(package.sub_packages, packages)
      end
    end

    parse(content, packages)
  end
end

def convert_to_package(content)
  return [[], nil] if content.length <= 8

  package = Package.new(content.shift(3).join.to_i(2), content.shift(3).join.to_i(2))
  case package.type
  when 4 # literal
    groups = read_literal_group(content)
    package.literal = groups.flatten.join.to_i(2)
    [content, package]
  else # operator
    package.length = content.shift(1)[0].to_i
    case package.length
    when 0
      subpackages = content.shift(content.shift(15).join.to_i(2))
      package.sub_packages = subpackages
      [content, package]
    when 1
      subpackages_count = content.shift(11).join.to_i(2)
      package.sub_count = subpackages_count
      [content, package]
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