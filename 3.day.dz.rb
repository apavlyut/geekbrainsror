# 1. Что выведет этот код? Почему перменная @message доступна в методе make_some_voice()

class Geek
  def initialize
    @message = "ruby ruby"
  end

  def make_some_voice
    "I like to #{@message}"
  end
end

alex = Geek.new
puts alex.make_some_voice()

# 2. Что этот код напечатает в STDOUT? Поясните.
class Computer
  def initialize
    @sound = "beep beep"
  end

  def self.about
    "Sometimes I go #{@sound}"
  end
end

p Computer.about

# 3. Что этот код напечатает в STDOUT?

class Xyz
  def pots
    @nice
  end
end

xyz = Xyz.new
p xyz.pots

# 4. Что этот код напечатает в STDOUT?

class Xyz
  def paper
    unassigned_local_variable
  end
end

xyz = Xyz.new
p xyz.paper

# 5. Что этот код напечатает в STDOUT? Поясните что произойдет метод meaning_of_life() вызвать несколько раз для одного объекта.

class Something
  def meaning_of_life
    @result ||= result
    "The meaning of life is the number #{@result}"
  end

  def result
    Math.log10(100) * 42 - 48 - 13
  end
end

something = Something.new
p something.meaning_of_life

# 6. Что этот код напечатает в STDOUT? Поясните.

class Cup
  PURPOSE = "hold liquids"
  def main_use
    PURPOSE
  end
end

tea_cup = Cup.new
p tea_cup.main_use

# 7. Что этот код напечатает в STDOUT? Поясните.

class Chair
  AGE = "been around the block"
  def self.about
    "I'm old and I've #{AGE}"
  end
end

p Chair.about

# 8. Что этот код напечатает в STDOUT? Поясните.

BEST_MOVIE = "Viking"
BEST_MOVIE = "Matilda"
p BEST_MOVIE

# 9. Что этот код напечатает в STDOUT? Поясните.

class Bottle
  DRANK = "lemme hit that"
end

p Bottle::DRANK

# 10. Поясните следующее утвреждение: "В руби все есть объект, так что нет не"
Explain the following statement: "Все в Ruby является объектом, так что нет никаких автономных функций в Ruby, все функции на самом деле методы".

# 11. Поясните почему метод Pig#main_desire может обращаться к методу weight() без префикс self.

class Pig
  def weight()
    "100 kg"
  end

  def main_desire()
    "eat all day and be more than #{weight()}"
  end
end

piggy = Pig.new()
piggy.main_desire()

# 12. Поясните вызовв метода через Fan.about и почему декларация метода about() использует зарезервированное слово self.

class Fan
  def self.about
    "my job is to keep people cool"
  end
end

p Fan.about

# 13. Что этот код напечатает в STDOUT? Поясните.

class Woman
  SELF = self
end

p Woman::SELF

# 14. Что этот код напечатает в STDOUT? Поясните.

class Dude
end

def Dude.motto
  "Cowabunga"
end

p Dude.motto

# 15. Что этот код напечатает в STDOUT? Поясните.

class Phone
  def Phone.job
    "Distract you from life"
  end
end

p Phone.job

# 16. Что этот код напечатает в STDOUT? Поясните.

def blah
  "blah blah"
end

class Geek
  def make_some_voice
    "I am #{blah}"
  end
end

p Geek.new.make_some_voice

# 17. Укажите кто тут объект, кто сообщение, что метод и кто получатель сообщения:

x = 5.to_f

# 18. Поясните как сообщение (значение) отправляется, кто тут получатель (метод), и каково содержание сообщения.
"table".upcase()


# 19. Укажите на сообщение (значение) и получателя (метод).

class Calculator
  def add(x, y)
    x + y
  end
end

my_calculator = Calculator.new
my_calculator.send(:add, 3, 4)

# 20. Укажите на сообщения (значения) и получателя (метод).

3 + 4

# 21. Укажите отправителя, получателя, и само сообщение когда мы дернем метод Circle#area.

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
