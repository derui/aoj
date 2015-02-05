#!/usr/bin/env ruby

require 'matrix'

def to_dataset(line)
  x1, y1, x2, y2, x3, y3, xp, yp = line.split.map {|x| x.to_f}

  return [Vector[x1, y1, 0], Vector[x2, y2, 0], Vector[x3, y3, 0], Vector[xp, yp, 0]]
end

def cross(v1, v2)
  v = Vector[v1[1] * v2[2] - v1[2] * v2[1],
           v1[2] * v2[0] - v1[0] * v2[2],
           v1[0] * v2[1] - v1[1] * v2[0]]

  if v[2] < 0
    -1
  elsif v[2] > 0
    1
  else
    0
  end
end

$stdin.readlines.map {|line|
  a, b, c, pp = to_dataset(line)

  ab, bc, ca = b - a, c - b, a - c
  ap, bp, cp = pp - a, pp - b, pp - c

  ap_in = cross ab, ap
  bp_in = cross bc, bp
  cp_in = cross ca, cp

  if ap_in == bp_in and ap_in == cp_in and bp_in == cp_in
    puts "YES"
  else
    puts "NO"
  end
}
