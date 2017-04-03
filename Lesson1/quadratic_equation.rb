puts "Enter a, b and c coefficients, each one on new line"
a = gets.to_f
b = gets.to_f
c = gets.to_f

d = b**2 - 4*a*c

if d > 0
  x1 = (-b + Math.sqrt(d)/2*a)
  x2 = (-b - Math.sqrt(d)/2*a)
  puts "Equation has two different roots: #{x1}; #{x2}"
elsif d == 0
  x = -b/2*a
  puts "Equation has two coinciding roots: #{x}"
else
  puts "Equation has no real roots"
end
