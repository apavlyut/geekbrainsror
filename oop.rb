class Car
  @@count = 0
  def initialize(name)
    @name = name
    puts "name passed: #{name}"
    @@count +=1
  end

  def to_s
    # puts "name passed: #{name}"
    "Count #{@@count} and name #{@name}"
  end

  def self.my_class_method_cars
    @@count
  end
end

car = Car.new('lambo')

puts car.to_s

car = Car.new('mambo')

puts car.to_s

puts Car.my_class_method_cars
