class Traffic_Light

    
    def initialize
        @mode=1
        @light='red'
        @timer_g_y_r={'green'=> 15, 'yellow'=>4, 'red'=> 15}
    end

    def timer                   # возвращает значение таймера для каждого света
        @timer_g_y_r    
    end
    
    def color_light             # возвращает текущей свет
        @light
    end
    
    def chng_timer(new_timer)   # изменение времени включения каждого цвета
        @timer_g_y_r=new_timer
    end
    
    def chng_mode               # выбор режима работы светофора
        while true
            print 'режим работы светофора (1 - автоматический режим, 2 - время включения выбираете в ручную, 3 - светофор не исправен):'
            mode=gets.to_i
            case mode
                when 1
                    puts "Светофор работает в автоматическом режиме (время включения зел #{@timer_g_y_r['green']} сек., желт #{@timer_g_y_r['yellow']} сек., красный #{@timer_g_y_r['red']}сек.)"
                    @mode=mode
                    break
                when 2
                    puts 'Светофор в ручном режиме (время включения выбираете в ручную)'
                    @mode=mode
                    traffic_light_setup
                    break
                when 3
                    puts 'Внимание! Cветофор не исправен'
                    @mode=mode
                    rand_traffic_light(20)
                    break
                else 
                    puts 'Не верный ввод, давай попробуем еще!'
            end
        end
        @mode
    end
    
    def light_timer_input(light) # ввод значения времени срабатывания для конкретного цвета
        
        while true
            print "Введите значения таймера включения для #{light}:"
            value=gets.to_i
            if  value != nil && value!=0
                timer = value
                break
            else
                puts 'Не корректный ввод, повнимательней!\n Попробуйте еще раз!'
            end
        end
        timer
    end

    def light_timer_input_testing(light, testing_value) # ввод значения времени срабатывания для конкретного цвета (ДЛЯ ТЕСТА)
#         while true
#             print "Введите значения таймера включения для #{light}:"
        
            value = testing_value.to_i
#             value=gets.to_i
            if  value != nil && value!=0
                timer = value
#                 break
            else
                puts 'Не корректный ввод, повнимательней!\n Попробуйте еще раз!'
                timer=nil
            end
#         end
        timer
    end
    
    def traffic_light_setup     # ручной ввод значений таймеров
        puts 'Будьте внимательны при вводе - проверки правильности ввода нет!'
        @timer_g_y_r.each {|key, timer| timer=light_timer_input(key)
            }
    end
    
    def rand_traffic_light(period)      # рандомом заполняет таймеры включения
        @timer_g_y_r.each {|key, timer| 
                           timer=rand(period)
                           puts "таймер #{key} = #{timer}"
                          } 
    end
    
    def crush_traffic_light     # рандомом выбирает цвет
        rand_light=rand(4)
        
        @light= case rand_light
                    when 1
                        'red'
                    when 2
                        'yellow'
                    else
                        'green'
                end
        @light
    end
end
 
