# (10..15).each_slice(2) do |elements|
#   puts "elemets: #{elements.inspect} #{elements.class} #{elements.size}"
# end
#
#
# h = { 'dog' => 'canine', cat: 'feline', 'donkey' => 'asinine' }
#
# alex = { name: 'Alex', email: 'alex@deppkind.com'}
#
# yuri = { name: 'Yuri', email: 'yuri@deppkind.com'}
#
# users = []
#
# users << alex
# users << yuri
#
# users.each do |user|
#   puts user.inspect
#   user.each_key do |key|
#     puts "key: #{key} #{key.class}"
#   end
#   if user[:name] == 'Alex'
#     puts "#{'>'*10} Hello Alex"
#   end
# end

# def threeTimes
#   puts "first one: "
#   yield
#   puts "second one: "
#   yield
#   puts "last one: "
#   yield
# end
#
# threeTimes { puts "Hello" }


module StreetRacingParts
  def go_nitro!
    puts "going nitro!!!"
  end

  def be_green
    puts "color now is green"
  end
end

class Car

  include StreetRacingParts

  def initialize(model)
    @model = model
  end

  def beep
    puts "beeeeeb"
  end

  def start_engine
    @engine_sarted = true
  end

  def show_model
    puts "model is: #{@model}"
  end

end

bmw = Car.new('x5')
bmw.beep
bmw.show_model

puts bmw.methods.include? :be_green
