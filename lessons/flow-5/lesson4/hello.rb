# class Hello
#   def initialize(world = 'world')
#     puts ">>Hello: #{world}"
#   end
# end
#
# hello = Hello.new
#
# puts "hello.class: #{hello.class}".class
#
#
#
# array = Array.new([12,45,5])
#
# puts ">>#{array.inspect}"
#
# hash = {'a' => 1, b: 4, c: "hello", 'c': 'hello 2'}
#
# puts hash.keys.last.class
# # hash = {'a' => 1, b: 4, :c => "hello", "c" => 'hello 2'}
#
# puts hash.inspect
# puts hash.class
#
# puts "array.class: #{array.class}"
#
# puts /a|b/.class
#
# puts 1.class
# puts 1.2.class
# puts (1...3).class
#
# c = 3
#
# hello_proc = ->(a,b){ puts "a: #{a}, b: #{b}; c: #{c}; sum = #{a+b+c}" }
#
# puts hello_proc.class
# hello_proc.call(1,2)
#
# # def over_proc
# #   c = 4
# #   hello_proc.call(1,2)
# # end
# #
# # over_proc

class BangDemo
  def initialize
    @bang = 'bang'
  end

  def bang(new_bang)
    @bang + new_bang
  end

  def bang!(new_bang)
    @bang += new_bang
  end

  def print_bang
    puts "@bang now is: #{@bang}"
  end
end

bang = BangDemo.new
bang.print_bang()

bang.bang('bababang')
bang.print_bang()

bang.bang!('bababang')
bang.print_bang()


# if a > 1
#   # ...
# end

class Ship
  include Comparable

  def initialize
    @armor_strength = 10
  end

  def boom!
    @armor_strength -= rand(3)
  end

  attr_accessor :armor_strength

  def <=>(other_ship)
    if other_ship.armor_strength < self.armor_strength
      -1
    elsif other_ship.armor_strength > self.armor_strength
      1
    else
      0
    end
  end
end

ship1 = Ship.new
ship2 = Ship.new

# fight
puts 'round one, fight!'
ship1.boom!

puts "ship1 ammo: #{ship1.armor_strength}"

ship2.boom!

puts "ship2 ammo: #{ship2.armor_strength}"

puts ship1.<=>(ship2)
