class Road
    
    def initialize(coef_road)

        @coef_road= case coef_road
                        when 1
                            0.7
                        when 2
                            0.4
                        when 3
                            0.2
                        else
                            0.1
                    end
        
        @traffic_light=Traffic_Light.new
        @mode=@traffic_light.chng_mode
        @vehicles=[]
    end
    
    def inspect
        @vehicles.each{|vehicle| puts vehicle.inspect}
    end
    
    def add_vehicle         # добавление транспорта на дорогу
        while true
            print 'Добавьте участника движения (1 -дачник, 2 -блондинка. 3 -хоккеист. 4 -байкер, 5 - создайте своего. любой другой символ - достаточно):'
            chois=gets.chomp
            
            case chois.to_i
                when 1
                    @vehicles.push(Vehicle.new('Дачник', 4, 4, 20.0, 1.5, @coef_road))
                when 2
                    @vehicles.push(Vehicle.new('Блондинка', 4, 4, 15.0, 2.0, @coef_road))
                when 3
                    @vehicles.push(Vehicle.new('Хоккеист', 4, 4, 10.0, 0.8, @coef_road))
                when 4
                    @vehicles.push(Vehicle.new('Байкер', 0, 2, 25.0, 1.0, @coef_road))
                when 5
                    add_new_vehicle
                else
                    puts '!!! Ну что, смертнички?! ПОКАТАЕМСЯ !!!'
                    break
            end
            
        end
        
    end

    def add_new_vehicle     # создание пользовательского ТС
        puts 'ВНИМАНИЕ!!! Проверки правильности ввода в данном блоке нет!'
        puts 'Введите название транспортного средства:'
        name=gets.chomp
        puts 'Введите кол-во дверей (шт.):'
        doors=gets.to_i
        puts 'Введите количество колес (шт.)'
        weels=gets.to_i
        puts 'Введите предпочитаемую дистанцию до впереди идущего транспорта (метров):'
        distance=gets.to_f
        puts 'Введите время реакции водителя на события (в среднем 1.4 секунды):'
        reaction=gets.to_f
        vehicle=Vehicle.new(name, doors, weels, distance, reaction, @coef_road)
        @vehicles.push(vehicle)
        vehicle
    end
    
    def add_new_vehicle_testing (n,d,w,dis,r)     # создание пользовательского ТС
#         puts 'ВНИМАНИЕ!!! Проверки правильности ввода в данном блоке нет!'
#         puts 'Введите название транспортного средства:'
        name=n
#         puts 'Введите кол-во дверей (шт.):'
        doors=d.to_i
#         puts 'Введите количество колес (шт.)'
        weels=w.to_i
#         puts 'Введите предпочитаемую дистанцию до впереди идущего транспорта (метров):'
        distance=dis.to_f
#         puts 'Введите время реакции водителя на события (в среднем 1.4 секунды):'
        reaction=r.to_f
        @vehicles.push(Vehicle.new(name, doors, weels, distance, reaction, @coef_road))
        vehicle="name: #{name}, doors: #{doors} , weels: #{weels}, distance: #{distance}, reaction: #{reaction}"
    end
    
    
    def moving              # движение транспорта
        parent_color=@traffic_light.timer
        parent_color.each  {|light, t|
            @mode==3 ? lighter=@traffic_light.crush_traffic_light : lighter=light
            timer=parent_color[lighter]
            case lighter
                when 'red'
                    @vehicles.each{|vehicle| vehicle.braking_distance; timer.times {|i| vehicle.braking(i, true)}}
                    crush_test
                when 'yellow'
                    @vehicles.each{|vehicle| vehicle.braking_distance; timer.times {|i| vehicle.braking(i, false)}}
                else
                    @vehicles.each{|vehicle| timer.times {|i| vehicle.move(i)}}
            end
        }
        @traffic_light.chng_timer(parent_color)
    end

    def crush_test          # проверка состояния на дороге
        @vehicles.each_with_index {|vehicle, key |
            if crush?(key)
                vehicle1=@vehicles[key-1]
                vehicle1.crush
                vehicle.crush
                inspect
                puts "!!! ВНИМАНИЕ !!! Произошло столкновение!\n Транспотное средство #{vehicle.name} врезалось в #{vehicle1.name}"
                puts 'Продолжить игру? (1 - да, любая другая клавиша - нет)'
                answer=gets.chomp
                case
                    when '1'
                        puts "Поврежденый транспорт будет убран с дорогиб затем игра продолжится"
                        @vehicles.delete_at(key)
                        @vehicles.delete_at(key-1)
                    else 
                        exit
                end
            end
        }
    end
    
    def crush?(k)           # проверка наступления аварийного случая
        if k!=0
                distance=@vehicles[k-1].braking_distance+@vehicles[k].distance-@vehicles[k].braking_distance
                cr= distance>0 ? false : true
        else
                cr= false
        end
        cr
    end

end
 
