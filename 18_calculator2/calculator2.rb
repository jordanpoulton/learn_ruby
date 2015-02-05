# Write the tests that test this code, without looking at previous challenges.

# Your rake output should read:

#add
#  adds 0 and 0
#  adds 2 and 2
#  adds positive numbers

#subtract
#  subtracts numbers

#sum
#  computes the sum of an empty array
#  computes the sum of an array of one number
#  computes the sum of an array of two numbers
#  computes the sum of an array of many numbers

#multiply
#  multiplies two numbers
#  multiplies several numbers

#power
#  raises one number to the power of another
# number

#factorial
#  computes the factorial of 0
#  computes the factorial of 1
#  computes the factorial of 2
#  computes the factorial of 5
#  computes the factorial of 10

def add(first, second)
  first + second
end

def subtract(first, second)
  first - second
end

def sum(array)
  array.inject(0) {|sum, num| sum + num}
end

def multiply(first, second)
  first * second
end

def multiply_several(array)
  array.inject(:*)
end

def power(first, second)
  first ** second
end

def factorial(n)
  return 1 if n == 0
  return 1 if n == 1
  n * factorial(n-1)
end
