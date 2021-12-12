class Segment
  attr_reader :patterns, :outputs

  def initialize(line)
    parts = line.split(' | ')
    @patterns = parts[0].split(' ').sort_by(&:length).map { |pattern| pattern.chars.sort(&:casecmp).join }
    @outputs = parts[1].split(' ').map { |output| output }
  end

  def decipher(dictionary)
    matcher = find_matcher
    output = encode_output(matcher)
    output.map { |output| dictionary[output] }.join.to_i
  end

  private

  def find_matcher
    a_b = @patterns[0].split('')
    a_b_d = @patterns[1].split('')
    a_b_e_f = @patterns[2].split('')
    a_b_c_d_e_f_g = @patterns[9].split('')
    d = a_b_d - a_b
    e_f = a_b_e_f - a_b
    a_f_g = @patterns.select { |p| p.length == 6 }.join.split('').tally.select { |k, v| v == 2 }.map { |k, v| k }
    f = a_f_g & e_f
    e = e_f - f
    a_g = a_f_g - f
    a = a_g & a_b
    b = a_b - a
    g = a_g - a
    c = a_b_c_d_e_f_g - a - b - d - e - f - g
    { a.join.to_s => 'a', b.join.to_s => 'b', c.join.to_s => 'c', d.join.to_s => 'd', e.join.to_s => 'e', f.join.to_s => 'f', g.join.to_s => 'g' }
  end

  def encode_output(matcher)
    outputs.map { |output| output.split('').map { |char| matcher[char] }.sort.join }
  end
end