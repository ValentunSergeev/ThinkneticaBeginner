puts "Hello, its a cart caluclator."
puts "Enter 'stop' when you're done.\n"

result = {}
sum = 0

loop do

  puts "Enter a name"
  name = gets.chomp

  break if name == 'stop'

  puts "Enter unit price"
  price = gets.to_f

  puts "Enter product quantity"
  quantity = gets.to_f

  product = { price: price, quantity: quantity }

  result[name] = product

  cost = quantity * price

  puts "Cost for #{name} is #{cost}"

  sum += cost
end

puts "\n---------------------------------------\n"

puts "Your cart:\n#{result}"
puts "Total cost is #{sum}"
