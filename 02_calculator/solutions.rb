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
#Maybe multiply and multiply_several should be one method?

def power(first, second)
  first ** second
end

def factorial(n)
  return 1 if n == 0
  return 1 if n == 1
  n * factorial(n-1)
end
