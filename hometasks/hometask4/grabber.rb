require 'bundler/setup'
require_relative 'lib/grabthis.rb'

# 1. Получаем ссылку
# 2. Создаем экземпляр класса
# 3. Вызываем метод grab!

puts 'Введите ссылку'
url = gets.chomp
puts "Вы ввели: #{url}"
site = GrabThis.new(url)
site.grab!
