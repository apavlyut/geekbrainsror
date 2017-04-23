class Vehicle
    def initialize(name='ТС пользователя',doors=4,weels=4,distance=30.0, reaction=1.5, coef_road=0.7)
        @name=name
        @doors=doors
        @weels=weels
        @distance=distance # дистанция до впереди идущей машины
        @reaction=reaction # время реакции водителя
        @status='ok'
        @braking=0.0   #m тормозной путь
        @current_speed=0.0  #km/h
        @max_speed=80 # km/h
        @coef_road=coef_road
        @sprint=28.0 # м/сек.кв. Ускорение при разгоне
    end
    
    def speed_for_testing(speed) # принудительно меняет скорость ТС
        @current_speed=speed
    end
        
    def max_speed_value
        @max_speed
    end
    
    def distance            # возвращает дистанцию до впереди идущего ТС
        @distance
    end
    
    def name                #  возвращает название ТС
        @name
    end
    
    def braking_distance    #+ возвращает тормозной путь ТС
        @braking=(0.28*@current_speed*@reaction + @current_speed**2/(254.0*@coef_road)).round(2)

    end

    def move(sec)           # Старт и равномерное движение на крейсерской скорости движение 
        timer=sec.to_f 
        speed=(@sprint*(timer-@reaction)*0.28).round(2)
        if timer>@reaction
           @current_speed= (speed<@max_speed)? speed : @max_speed
           
        end
        @current_speed
    end
    
    def braking(sec, ready) # торможение (время торможения, говоность водителя отреагировать)
        timer=sec.to_f
        
        # расчет ускорения торможения
        braker=(@current_speed**2/(2.0*@braking*7.84)).round(2) 
        
        # расчет текущей скорости в момент торможения
        if ready==false
            brak_speed= (timer<=@reaction)? @current_speed : @current_speed - braker*(timer-@reaction)
        else
            brak_speed = @current_speed - braker*timer
        end
        
        if brak_speed>0.0
            @current_speed=brak_speed.round(2)
        else
            @current_speed=0.0
        end
        @current_speed
    end

    def crush               # присвоение состояния - уничтожен
       @status='Транспортное средство уничтожено, звоните 112!'
       @current_speed=0.0
       
    end

    def inspect             # вывод всех параметров ТС
        "name: #{@name}, doors: #{@doors} , weels: #{@weels}, distance: #{@distance}, reaction: #{@reaction}, status: #{@status}, braking distances: #{@braking}, speed: #{@current_speed}, max_speed: #{@max_speed}, c_road: #{@coef_road}, sprint: #{@sprint}"
    end

end 
