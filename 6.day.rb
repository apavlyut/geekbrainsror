# class Road
#
#   def initialize()
#     @all_cars = []
#   end
#
#   def do_smth_with(new_car)
#     puts "this is method"
#     new_car.break!
#   end
# end
#

require 'test/unit'
require 'road/all'

class Vechicle
  def start!
    raise "Method not inited!"
  end
end

class CorrectVechicle < Vechicle
  def start!
    puts "go go"
  end
end

class IncorrectVechicle < Vechicle
  # def start!
  #   puts "go gog"
  # end
end

# car = Car.new
#
# car.start!

class VechicleTest < Test::Unit::TestCase
  def test_correct_raising
    incorrect_vechicle = IncorrectVechicle.new
    assert_raise do
      incorrect_vechicle.start!
    end
  end
  def test_correct_starting
    correct_vechicle = CorrectVechicle.new
    assert_nothing_raised do
      correct_vechicle.start!
    end
  end
end
