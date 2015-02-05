#!/usr/bin/env ruby

def f(x)
  x * x
end

MAX_X = 600

$stdin.readlines.map {|line|
  diviser = line.to_i

  sum = 0
  count = MAX_X / diviser
  count.times {|i|
    x = i * diviser
    sum += diviser * f(x)
  }
  puts sum
}
