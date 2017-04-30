arr = [1,1]

i = 2

loop do
  e = arr[i-1] + arr[i - 2]
  break if e >= 100
  arr << e
  i += 1
end

p arr
