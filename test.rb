 require_relative "traffic_light.rb"
 require_relative "vehicle.rb" 
 require_relative "road.rb" 
# require_relative "hmw6.rb"
require 'test/unit'


class Vehicle_Test < Test::Unit::TestCase
    def setup
        @vehicle=Vehicle.new
    end
    
#     braking_distance    # возвращает тормозной путь ТС    
    def test_braking_distance
        assert_not_nil( @vehicle.braking_distance, 'Тормозной путь' )
    end
    
#     move(sec)           # Старт и равномерное движение на крейсерской скорости движение
    def test_move
        max_speed=@vehicle.max_speed_value
        assert_equal( 0.0, @vehicle.move(1), 'скорость при времени меньше реакции' )
        assert_equal( 11.76, @vehicle.move(3), 'скорость при времени больше реакции - разгон' )
        assert_equal( max_speed, @vehicle.move(20), 'скорость при времени больше реакции - крейсерская скорость' )
    end
    
#     braking(sec, ready) # торможение (время торможения, говоность водителя отреагировать(да/нет))
    def test_braiking
        max_speed=@vehicle.max_speed_value
        @vehicle.speed_for_testing(max_speed)
        @vehicle.braking_distance
        # водитель не готов
        assert_equal( max_speed, @vehicle.braking(1,false), "текущая скорость в начале торможения, водитель еще не отреагировал" )
        
        @vehicle.speed_for_testing(max_speed)
        assert_equal( 65.35, @vehicle.braking(4,false), "текущая скорость при торможении, временя больше реакции" )
        
        @vehicle.speed_for_testing(max_speed)
        assert_equal( 0.0, @vehicle.braking(20,false), "текущая скорость в конце - ТС стоит" )
        
        # водитель предпринял предварительное торможение (не учитывается время реакции)
        
        @vehicle.speed_for_testing(max_speed)
        assert_equal( 74.14, @vehicle.braking(1, true), "текущая скорость в начале торможения" )
        
        @vehicle.speed_for_testing(max_speed)
        assert_equal( 62.42, @vehicle.braking(3, true), "текущая скорость при торможении" )
        
        @vehicle.speed_for_testing(max_speed)
        assert_equal( 0.0, @vehicle.braking(20, true), "текущая скорость в конце - ТС стоит" )
        
    end
        
#     crush               # присвоение состояния - уничтожен

    def teardown
        @vehicle=nil
    end

end

class Traffic_Light_Test < Test::Unit::TestCase
    def setup
        @traffic_light=Traffic_Light.new
    end
    
#     light_timer_input (light, testing_value=0 testing=false) # ввод значения времени срабатывания для конкретного цвета
    def test_light_timer_input
        assert_equal(  15, @traffic_light.light_timer_input_testing('green',15 ), 'корректный ввод'   )
        assert_equal( nil, @traffic_light.light_timer_input_testing('green',nil), 'ввод пустой строки')
        assert_equal( nil, @traffic_light.light_timer_input_testing('green','w'), 'не верное значение')
    end
        
    def teardown
        @traffic_light=nil
    end
end

class Road_Test < Test::Unit::TestCase
    def setup
        @street=Road.new(1)
    end

#     add_vehicle         # добавление транспорта на дорогу

#     add_new_vehicle     # создание пользовательского ТС (name, doors, weels, distance, reaction, @coef_road)
    def test_add_new_vehicle
        assert_equal( "name: car, doors: 1 , weels: 1, distance: 1.0, reaction: 1.0", @street.add_new_vehicle_testing('car', 1, 1, 1, 1), 'корректный ввод')
        assert_equal( "name: car, doors: 0 , weels: 0, distance: 0.0, reaction: 0.0", @street.add_new_vehicle_testing('car', 'e', 'r', 'r', 'w'), 'не корректный ввод')
    end
    
#     moving              # движение транспорта
#     crush_test          # проверка состояния на дороге
#     crush?(k)           # проверка наступления аварийного случая

    def teardown
        @street=nil
    end
end    
    
