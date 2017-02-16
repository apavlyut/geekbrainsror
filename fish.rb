# Класс Рыба, рыба умеет плавать, умирать.
# Может получить ноги и потерять их
# Если у рыбы есть ноги она может ходить
# Так же если попробовать мутировать рыбу возникнет ошибка

class Fish
  # Счетчик рыб
  @@fish_count=0
  # Состояния рыбы (константы)
  LIVE_STATE = "alive"
  DEAD_STATE = "dead"
  # Конструктор рыбы (можно передать имя)
  def initialize (name = 'Just a fish')
    # Параметры рыбы
    @have_legs = false
    @can_swim = true
    @coordinates = [0, 0]
    @state = LIVE_STATE
    @name = name
    #Обновляем счетчик рыб
    @@fish_count += 1
    #Выводим статус
    puts("Current fish count #{@@fish_count}. Lets greet #{@name} fish!")
  end
  # Рыба умеет плавать
  def swim! (vx = 1, vy = 1)
    if is_alive? # Только когда жива
      @coordinates [0] += vx
      @coordinates [1] += vy
    else
      puts("This fish is dead leave it alone!")
    end
  end
  # Можно проверить жива рыба или нет?
  def is_alive?
    if @state == LIVE_STATE then true
    else false
    end
  end
  # Можно узнать координаты рыбы
  def get_coords
    @coordinates
  end
  # И напечатать координаты рыбы
  def print_coords
    puts ("#{@coordinates[0]} #{@coordinates[1]}")
  end
  # Рыбу можно убить
  def kill_fish!
    if is_alive?
      puts("You killed fish #{@name}")
      @state = DEAD_STATE
    else
      puts("It's dead already")
    end
  end
  # Рыбе можно дать ноги (зачем то)
  def give_legs!
    if is_alive?
      puts ("really?! Ok #{@name} now have legs")
      @have_legs = true
    else
      puts("It's dead already")
    end
  end
  # У рыбы можно отнять ноги
  def remove_legs!
    if is_alive?
      puts ("Fuh, finaly you stopped playing God. #{@name} now have no legs")
      @have_legs = false
    else
      puts("It's dead already")
    end
  end
  # Рыбу нельзя мутировать
  def mutate
    raise "'You are evil' error!"
  end
  # Ну больше рыба ничего не умеет (только ходить) когда она жива
  def method_missing (*args)
    if @have_legs && args[0] == :walk
      if is_alive?
        swim!
        puts ("You are wierdo making fish to walk")
      else
        puts("It's dead already")
      end
    elsif @state == DEAD_STATE
      puts ("It can't #{args.to_s}. It is dead.")
    else
      puts ("Fish #{@name} can't #{args.to_s}")
    end
  end
end

# Мучение рыб
# Рыба №1
fish = Fish.new
fish.swim!(10, 10)
fish.print_coords
fish.swim!(-2, 14)
fish.print_coords
fish.kill_fish!
fish.swim!(10, 10)
puts()
# Рыба №1
jeff_fish = Fish.new("Jeff")
jeff_fish.swim!(-4, 2)
jeff_fish.print_coords
jeff_fish.kill_fish!
puts()
# Рыба №1
godzilla_fish = Fish.new("GODZILLA")
godzilla_fish.swim!(-2, -2)
godzilla_fish.print_coords
godzilla_fish.give_legs!
godzilla_fish.fly
godzilla_fish.walk
godzilla_fish.print_coords
godzilla_fish.walk
godzilla_fish.print_coords
godzilla_fish.remove_legs!
godzilla_fish.kill_fish!
godzilla_fish.revive
puts()
# Блок для отлавливания ошибок
begin
godzilla_fish.mutate
rescue Exception => e
  puts("Warning! Warning! #{e.to_s}")
end
