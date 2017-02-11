class Car
  def is_moving?
    true
  end
end
# # OOP
#
# class Vehicle
#   @@class_count = 0
#
#   MOVING_STATE = 'moving'
#   STOPPED_STATE = 'stopped'
#
#   def initialize(doors_count = 4, wheels_count = 4, kind = 'vehicle')
#     @doors = doors_count # количество дверей
#     @wheels = wheels_count # колличество колес
#     @name = kind # тип
#     @health_state = 'good' # техническое состояние
#     @action_state = STOPPED_STATE # состояние движения
#
#     @normal_doors_count = doors_count
#     @normal_wheels_count = wheels_count
#
#     @@class_count += 1
#     puts "current vechicless count #{@@class_count}"
#   end
#
#   def go_move!
#     if self.class == Vehicle
#       puts "\n\tТехника должна быть конкретной - пока пока ало гараж!"
#       return
#     else
#       @action_state = MOVING_STATE
#     end
#   end
#
#   def boom!
#     unless moving?
#       puts "\n\t> Cannot boom VH is stopped! Go some Drive!"
#       return
#     end
#     boom_vech!
#     correct_params_after_boom!
#   end
#
#   def boom_vech!
#     @doors -= rand(4)
#     @wheels -= rand(4)
#   end
#
#   def moving?
#     @action_state == MOVING_STATE
#   end
#
#   def correct_params_after_boom!
#     if (@doors == @normal_doors_count) && (@wheels == @normal_wheels_count)
#       @health_state = 'good'
#     elsif (@doors <= 1) || (@wheels <= 1)
#       @health_state = 'bad'
#     elsif (@doors <= @normal_doors_count) || (@wheels <= @normal_wheels_count)
#       @health_state = 'norm'
#     end
#   end
#
#   def healthcheck
#     puts "@doors: #{@doors}"
#     puts "@wheels: #{@wheels}"
#     puts "@health_state: #{@health_state}"
#
#   end
#
# end
#
#
# bad_car = Vehicle.new #
#
# bad_car.go_move! # Поехали!
#
# class Car < Vehicle
#   def initialize
#     super(5, 4)
#     @normal_doors_count = 2
#     @normal_wheels_count = 3
#   end
#
#   def boom_vech!
#     @doors -= rand(5)
#     @wheels -= rand(5)
#   end
# end
#
# puts "car goes: \t"
#
# car = Car.new
#
# car.healthcheck
#
# puts "going to move"
#
# car.go_move!
#
# car.boom!
#
# car.healthcheck


# string = "hello"
#
# puts string
#
# puts string.gsub("h", "M")
# puts string.gsub!("h", "M")
#
# puts string
