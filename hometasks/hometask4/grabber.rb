require 'bundler/setup'
require_relative 'lib/grabthis.rb'


puts 'Введите ссылку'
url = gets.chomp
puts "Вы ввели: #{url}"
site = GrabThis.new(url)
site.grab!
