class Circle
  def area(radius)
    calc = Calculator.new
    calc.pi * radius ** 2
  end
end

class Calculator
  def pi
    3.14
  end
end

my_circle = Circle.new
p my_circle.area(3)
