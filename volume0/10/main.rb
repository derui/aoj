#!/usr/bin/env ruby

def split_datasets(r) 
  datasets = r.split

  return [[datasets[0].to_f, datasets[1].to_f],
          [datasets[2].to_f, datasets[3].to_f],
          [datasets[4].to_f, datasets[5].to_f]
         ]
end

def dot(p1, p2)
  x1, y1 = p1
  x2, y2 = p2

  return x1 * x2 + y1 * y2
end

def to_vec(p1, p2)
  return [p1[0] - p2[0], p1[1] - p2[1]]
end

def invert(p)
  return [-p[0], -p[1]]
end

r = $stdin.readline

allnum = r.to_i

allnum.times {|x|
  r = $stdin.readline

  p1, p2, p3 = split_datasets(r)

  e1, e2, e3 = to_vec(p3, p2), to_vec(p1, p3), to_vec(p2, p1)
  d1, d2, d3 = dot(invert(e2), e3), dot(invert(e3), e1), dot(invert(e1), e2)
  c1, c2, c3 = d2 * d3, d3 * d1, d1 * d2
  c = c1 + c2 + c3

  center = [c2 + c3, c3 + c1, c1 + c2].zip([p1, p2, p3]).reduce([0, 0]) {|result, item|
    [result[0] + item[0] * item[1][0], result[1] + item[0] * item[1][1]]
  }
  center = [center[0] / (2 * c), center[1] / (2 * c)]

  r = Math.sqrt((d1 + d2) * (d2 + d3) * (d3 + d1) / c) / 2

  puts "%.3f %.3f %.3f" % [center[0], center[1], r]
}
