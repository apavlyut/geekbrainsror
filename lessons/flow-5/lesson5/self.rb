# puts self.inspect
#
# def hello
#   puts self.inspect
# end
#
# class Hello
#   def geeks
#     puts "geeks"
#   end
#
#   def hello
#     puts self.inspect
#   end
# end
#
# class Hello
#   # def self.not_hello
#   #   puts "watsapp2"
#   # end
#   class << self
#     def not_hello
#       puts "watsapp"
#     end
#   end
# end
#
# h = Hello.new
#
# h.hello
# h.geeks
# # h.not_hello
#
# Hello.not_hello
#
#

# class MetaRuby
#   def method_missing(name, *args)
#     define_method name do
#       puts self
#       # puts "вызван метод #{name} c аргументами: #{args.inspect}"
#     end
#   end
# end
#
# mr = MetaRuby.new
#
# mr.hello22d2d( world: 'Alex', age: 15)

class PrivateRuby
  def name
    say_my_name
  end
  
  protected
    def say_my_name
      puts "Alex"
    end
end

pr = PrivateRuby.new

pr.name

pr.say_my_name
