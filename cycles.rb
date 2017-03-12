require 'awesome_print'
# массив
array = [1,2,'3','4',5]

array.map do |val|
  "val: #{val}"
end

class Array
  def each(&block)
    if block_given?
      ap self
    else
      puts "hello"
    end
  end
end

# array.each { |value| puts "value: #{value} (#{value.class})" }

puts "Each demo from Array:"
array.each do |value|
  # puts '\t\n#{array.index(value)}: hello #{value} (#{value.class})'
  # index_from_eval = eval('array.index(value)')
  # puts "Index from string evaluation: #{index_from_eval}"
  puts "#{array.index(value)}: hello #{value} (#{value.class})"
end

puts "Each demo from HASH:"
# hash - коллекция ключ+значение
hash_g = {
   :a => 1,
   :b => :c,
   :d => "e",
  "d" => 5
}

# hash_g.each{|key, value| puts "key: #{key} (#{key.class}) is #{value}"}
hash_g.each do |key, value|
  puts "key: #{key} (#{key.class}) is #{value}"
end

(1..10).each do |i|
  puts "i from Range: #{i}"
end
