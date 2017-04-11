days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30]

puts "Enter the day"
day = gets.to_i

puts "Enter the month"
month = gets.to_i

puts "Enter the year"
year = gets.to_i

full_days = days[0, month].reduce(:+) + (day - 1)

full_days += 1 if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) && (month >= 2)

puts full_days
