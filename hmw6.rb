require_relative "traffic_light.rb" 
require_relative "vehicle.rb" 
require_relative "road.rb"
    
def status_road    
    while true
        print 'Выбирите состояние дороги (1 -сухо, 2 -мокро. 3 -снежно. 4 - лед):'
        coef_road=gets.chomp
        case coef_road.to_i
            when 1..4
                coef_road=coef_road.to_i
                break
            else
                puts '!!! Неверно введено сотсояние дороги! Повнимательнее вы все-таки за рулем !!!'
        end
    end
    coef_road
end

def start_game
    @road=Road.new(status_road)
    @road.add_vehicle
    @road.moving
    puts @road.inspect
    
end

start_game()
