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

# Problem 3 - Largest Prime Factor ####################
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?


def problem_3(num)
  # create prime factors from a minimum of the square root of num
  # to a max of num/2 (because that's the largest potential prime),
  # and then iterate through that collection of primes from largest end.

  # starting_num = sqrt(num).to_i
  # ending_num = num/2
end

# write a helper method that checks is_prime? from 2 up to the square root
# of the number (which is the maximum possible divider where %% divider could == 0)

prob3_num = 600_851_475_143
puts "3. The largest prime factor of the number #{prob3_num} is: #{problem_3(prob3_num)}"

# Problem 4 - Largest Palindrome Factor ###############
# A palindromic number reads the same both ways.
# Find the largest palindrome made from the product of two 3-digit numbers.

def problem_4
  num1 = 999
  largest_pal = 0

  while num1 > 99
    num2 = num1 - 1
    while num2 > 99
      product = num1 * num2
      if is_palindrome?(product) && product > largest_pal
        largest_pal = product
      end
      num2 -= 1
    end
    num1 -= 1
  end

  return largest_pal
end

def is_palindrome?(num)
  str = num.to_s
  return str == str.reverse
end

puts "4. The largest palindromic product of two 3-digit numbers is: #{problem_4}"
