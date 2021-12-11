Point = Struct.new(:x, :y)

class Vent
  attr_accessor :a, :b

  def initialize(line)
    points = line.split(' -> ').map { |point| point.split(',').map(&:to_i) }
    @a = Point.new(points[0][0], points[0][1])
    @b = Point.new(points[1][0], points[1][1])
  end

  def points(advanced)
    if @a.x == @b.x
      produce_line(@a.y, @b.y).map { |y| "#{@a.x},#{y}" }
    elsif @a.y == @b.y
      produce_line(@a.x, @b.x).map { |x| "#{x},#{@a.y}" }
    else
      advanced ? diagonal_line(@a, @b) : []
    end
  end

  private

  def produce_line(a, b)
    a > b ? (b..a).to_a : (a..b).to_a
  end

  def diagonal_line(a, b)
    min = a.x > b.x ? b : a
    max = a.x < b.x ? b : a
    # m = (y1 - y2) / (x1-x2); 1
    m = (max.y - min.y) / (max.x - min.x)
    c = max.y - max.x * m
    # c = y1 - x1 * m; 0
    # y = mx + c;
    (min.x..max.x).to_a.map { |x| "#{x},#{m * x + c}" }
  end
end
