class Segment
  attr_reader :patterns, :outputs, :matcher

  def initialize(line)
    parts = line.split(' | ')
    @patterns = parts[0].split(' ').sort_by(&:length).map { |pattern| pattern.chars.sort(&:casecmp).join }
    @outputs = parts[1].split(' ').sort_by(&:length).map { |output| output.chars.sort(&:casecmp).join }
  end

  def decipher
    find_matcher
    encode_output
  end

  private

  def find_matcher
    one = @patterns[0].split('')
    seven = @patterns[1].split('')
    four = @patterns[2].split('')
    eight = @patterns[9].split('')
    a = seven - one
    b_d = ((four - one) - a)
    c_d_e = @patterns.select { |p| p.length == 6 }.join.split('').tally.select { |k, v| v == 2 }.map { |k, v| k }
    d = c_d_e & b_d
    b = b_d - d
    c_e = c_d_e - d
    c = (c_e) & one
    f = one - c
    e = c_e - c
    g = eight - a - b - c - d - e - f
    @matcher = { 'a' => a, 'b' => b, 'c' => c, 'd' => d, 'e' => e, 'f' => f, 'g' => g }
  end

  def encode_output
    outputs.map { |output| output.split('').map { |char| matcher[char] }.sort.join }
  end
end