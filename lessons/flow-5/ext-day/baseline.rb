# Ruby 1.

# hexlet.io
# geekbrains.ru

# 1. Все про массивы строки и прочую полюбень что меня не интересует все изучаем тут 
# #=> https://www.ruby-lang.org/ru/documentation/quickstart/
# 2. Почему динамика работает - потому что компилятора нет и он не удаляет исходную информацию.
# 3. Динамика это быстрое реагирование на изменение внешнего мира.
# 4. Где нужно метапрогинг - ORM #datastore

# attrs_from_db = ['name', 'last_name', 'phone']

# class Person
#   def initialize
#     get_attrs_from_db.each do |db_attr|
#       define_method "#{db_attr}=", do |*args|
#         puts "method #{db_attr} invoked with args #{args}"
#       end
#       define_method db_attr do
#         puts "method #{db_attr} invoked with args #{args}"
#       end
#     end
#   end

#   private
#     def get_attrs_from_db
#       ['name', 'last_name', 'phone']
#     end
# end

# alex = Person.new

# alex.name = 'alex'
# alex.name #=> 'alex'
# alex.last_name
# alex.phone
#

# 5. Открытые классы - можем дополнить любой оригинальный функционал (подтянем money и получим новые методы)

# require 'money'

# class Integer
#   def to_money
#     "$#{self}"
#   end
# end

# 199.to_money #=> "$199"
# # 244345345.to_money

# 6. Манкипатчинг - хорошо потому что мы можем добраться до любого места и изменить глубоко поведение. Плохо потому что изменится все поведение связанных таких же объектов и может быть опа. Манкипатчинг используем только в связке с тестами всего продукта который патчим.

# 7. Инстансы методы и переменные #=> OOP in Ruby.
# 8. Наследование и суперклассы

# class User
#   # name
#   def call_to_number(number)
#     # 
#   end
#   def autheticate(password)

#   end
# end

# class Manager < User
#   def initialize
#     # name('alex')
#   end
# end

# alex = Manager.new

# puts alex.class # Manager
# puts alex.class.superclass # User
# puts alex.class.superclass.superclass # Object

# puts alex.class.ancestors # Manager, User, Object, Kernel, BasicObject

# 9. Класс суперкласс модуль

# module User
#   def say_name
#     puts ""
#   end
# end

# User.new -> error

# puts Class.superclass # Module

# 10. Константа это переменная к которой мы можем залезть извне по ее пути от рута ::CostMy

# KINDS = [:real, :noreal]

# class Transaction 
#   KINDS = [:positive, :negative, :free]
# end

# puts Transaction::KINDS # positive, negative, free
# puts ::KINDS # real, noreal

# 11. self нужен чтобы к себе обратиться потому что получатель каждая инструкция выполняется внутри текущего объекта

# class Car
#   def wheels # 
#     puts self
#     set_wheels(12) # self.set_wheels(12)
#   end

#   def set_wheels(nub_wheels = 4)
#     # 
#   end
# end

# mers = Car.new

# mers.wheels # #<Car:0x007fa8fc8859d0>

# 12. Модуль позволяет редефайнить все вокруг без потери вложенности. 

# my_extension.rb

# module MyExtension
#   class ::Integer do
#     def to_money
#       "$#{self}"
#     end
#   end
# end

# require 'my_extension'

# prepend MyExtension
# include MyExtension

# puts 1.to_money

# 13. Refine и using- защита от глобального манкипатчинга

# module MyExtension
#   refine ::Integer do
#     def to_money
#       "$#{self}"
#     end
#   end
# end

# using MyExtension

# 14. Obj.send

# class Phone
#   def number(size)
#     puts "number size: #{size}"
#   end
# end

# iphone = Phone.new

# iphone.send :number, 14 #> number size: 14

# 15. Define_method do |arg1,arg2|

# 16. Method missing (method, *args) и если блок if block_given?

class Phone
  def number(size)
    puts "number size: #{size}"
  end

  def method_missing(method, *args, &block)
    puts "You called #{method} with args: #{args.inspect}"
    if block_given?
      puts "passed block"
      yield
    else
      puts "no block given"
    end
  end
end

iphone = Phone.new

puts self.inspect # main

# puts iphone.call_to_jobs # baseline.rb:177:in `<main>': undefined method `call_to_jobs' for #<Phone:0x007f9f078190b8> (NoMethodError)

# puts iphone.call_to_jobs 1, 2, [11, 12] # You called call_to_jobs with args: [1, 2, [11, 12]]

iphone.call_to_jobs('steve') do
  puts "call me now"
  2+2
end

# You called call_to_jobs with args: ["steve"]
# passed block
# call me now

iphone.do_not_call_to_jobs('steve') do
  puts "dot nat call me now"
end
