puts "What's ur name?"
name = gets.chomp

puts "What's ur height?"
height = gets.to_i

weight  = height - 110

if weight < 0
  puts "#{name}, ur weight is already perfect"
else
  puts "#{name}, ur ideal weight is #{weight}"
end
