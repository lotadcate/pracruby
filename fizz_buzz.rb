def fizzbuzz(num)
  if num%15 == 0
    'Fizz Buzz'
  elsif num%3 == 0
    'Fizz'
  elsif num%5 == 0
    'Buzz'
  else
    num.to_s
  end
end

puts fizzbuzz(1)
puts fizzbuzz(15)
