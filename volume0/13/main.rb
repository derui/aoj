#!/usr/bin/env ruby

cars = []
$stdin.readlines.map {|line|
  car = line.to_i

  if car == 0
    if cars.empty?
      puts "0"
    else
      puts cars.pop
    end
  else
    cars.push car
  end
}
