# require 'rubygems'
# require 'awesome_print'
# # # задекларировали - такая функция будет
# # # def hello;'1';print '1.5\t';'2' end
# # def hello
# #   '1'
# #   print '1.5\t'
# #   '2'
# # end
# #
# # print "\tbefore\n"
# #
# # # тут мы ее вызвали
# # result = hello
# #
# # # тут напечатать результат
# # print result
# #
# # # 1.5
# # # 2
#
# # my_hash = {
# #   "a" => 1,
# #   "b" => [1,3,4,:yes],
# #   'last' => 'last',
# #   time: Time.now
# # }
# #
# # ap my_hash
#
# # class Hash
# #   def method_missing(args)
# #     self[args.to_s] || self[args.to_sym]
# #   end
# # end
# #
# # myhash = {
# #   first_name: 'Alex',
# #   middle_name: 'VL',
# #   'last_name' => 'Pavlyut'
# # }
# #
# # ap myhash.first_name
# # ap myhash.middle_name
# # ap myhash.last_name
#
#
# # именование переменных
# my_var = '123' # норм
# my_var123 = '123' # норм
# myVar123 = '123' # сработает, но не делайте так!
# # 2myVar = '123123' # не сработает
#
# # задекларировали
# def my_func(first_name, last_name = 'no_arg_passed')
#   "this is my func #{first_name}, #{last_name}"
# end
#
# # вызываем в контексте запуска скрипта 2.day.rb
# # ap my_func('a', 'b')
# #
# # ap my_func 'a', 'b2'
# #
# # ap my_func 'a'
#
# # задекларировали
# def my_func_obj(first_name: 'alex', last_name: 'no_arg_passed')
#   "this is my func #{first_name}, #{last_name}"
# end
#
# # ap my_func_obj last_name: 'last_name !!!', first_name: '123'
#
# def my_func_old(*args)
#   ap args
# end
#
# # my_func_old(1,2,'asdas', first_name: 'alex')
#
# # send(:my_func_old, 123123, 2, 4, hello_world: 'may')
#
#
# # [1,2,3,3].each do |element|
# #   puts element
# # end
# #
# # [1,2,3,3].each do |element| puts element end
# #
# # [1,2,3,3].each { |element|
# #   puts element
# # }
#
# first_var = 1
#
# class Array
#   def our_each(&block)
#     first_var = 'local var'
#     if block_given?
#       puts "Block is here"
#       yield
#       puts "first_var: #{first_var}"
#       puts "Block is invoked"
#     else
#       puts "no block given"
#     end
#   end
# end
#
# # [1,2,3,4].each { |element| puts element }
#
# [1,2,3,4].our_each {
#   puts 'hello'
# }
#
# a = 4
#
# unless a == 3 # if a != 3
#   puts "this is ok"
# else
#   puts "this is not ok"
# end
#
# if # true
#   puts "ok"
# else
#   puts "not ok"
# end
#
# #
# # user = User.find_by name: 'alex'
# #
# # unless user
# #   puts 'You need account'
# # else
# #   puts "Hello alex"
# # end
#
# user_name = 'alex'
#
# allowed = true
#
# case user_name
# when 'alex'
#   puts 'hello alex'
# else
#   puts 'UNhello alex'
# end if allowed
#
# puts "hello" unless allowed
#
# 10.times do |i|
#   puts i
# end
#
# myvar = 1
#
# # лямбда
# hello = -> (value) {
#   puts "hellow #{value}"
#   puts "myvar: #{myvar}"
# }
#
# hello.call('hah')
#
# array =  [1,2,3,4,5]
# array.inject(0) {|val| val+2}
#
# ap array

def my_puts(val)
  print val
  print "\n"
  nil
end

my_puts "hello"
