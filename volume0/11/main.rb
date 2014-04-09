#!/usr/bin/env ruby

w = $stdin.readline
n = $stdin.readline

result = w.to_i.times.to_a.map{|x|
  x + 1
}

n.to_i.times {
  set = $stdin.readline
  fst, snd = set.split(",").map {|x| x.to_i}

  tmp = result[fst - 1]
  result[fst - 1] = result[snd - 1]
  result[snd - 1] = tmp
}

result.each do |x|
  puts x
end

