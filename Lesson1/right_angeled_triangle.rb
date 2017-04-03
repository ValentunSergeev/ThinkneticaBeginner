puts "Input the trainlge's sides"

sides = gets.chomp.split

sides = sides.map { |e| e.to_i  }

c = sides.max

cathetus = sides - [c]

a = cathetus[0]
b = cathetus[1]

if a == b && a == c
  puts "Triangle is equilateral"
elsif a**2 + b**2 == c**2
  puts "Triangle is right angeled"
else
  puts "Triangle is not right angeled"
end
