# Problem 1 - Multiples of 3 and 5 ####################

def problem_1(num)
  accum = 0
  (3...num).each { |check_num| accum += check_num if (check_num % 3 == 0) || (check_num % 5 == 0) }
  accum
end

prob1_num = 1_000
puts "1. The sum of all multiples of 3 or 5 below #{prob1_num} is: #{problem_1(prob1_num)}"

# Problem 2 - Even Fibonacci numbers ##################

# Recursive solution, which I had to abandon because it causes a stack
# level too deep when the upper_limit is too high (like 4_000_000)
#
# def problem_2_build_fib_array(upper_limit)
#   return [1,2] if upper_limit == 2
#   fib_array = problem_2_build_fib_array(upper_limit - 1)
#   next_potential_num = fib_array[-1] + fib_array[-2]
#   fib_array << next_potential_num if next_potential_num < upper_limit
#   fib_array
# end

def problem_2_build_fib_array(upper_limit)
  fib_array = [1,2]
  while fib_array.last < upper_limit
    next_fib = fib_array[-1] + fib_array[-2]
    fib_array << next_fib
  end
  fib_array.pop
  fib_array
end

def problem_2(num)
  fib_sequence = problem_2_build_fib_array(num)
  fib_sequence.select! { |num| num.even? }
  fib_sequence.inject(:+)
end

prob2_num = 4_000_000
puts "2. The sum of even-valued Fibonacci terms below #{prob2_num} is: #{problem_2(prob2_num)}"
