def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def sum(array)
  array.inject(0, :+)
end

def multiply(num1, *num2)
  num2.inject(num1, :*)
end

def power(number, power)
  unit = 1
  power.times{unit *= number}
  unit
end

def factorial(number)
    if number == 0
        1
    else
        number * factorial(number-1)
    end
end

