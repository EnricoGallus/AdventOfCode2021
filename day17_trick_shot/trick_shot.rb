def range(file_name)
  File.read(file_name)
      .gsub('target area: ', '')
      .gsub('x=', '')
      .gsub(' y=', '')
      .strip
      .split(',')
      .map { |range| range.split('..').map(&:to_i) }
end

def shot(velocity, positions, target_area)
end