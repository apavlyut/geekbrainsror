module HelloDemo
  def plus_one(digit)
    digit + 1
  end

  def plus_one2(digit)
    digit + 1
  end

  def plus_one3(digit)
    digit + 1
  end

  def plus_one4(digit)
    digit + 1
  end

  def plus_one5(digit)
    digit + 1
  end

  def plus_one6(digit)
    digit + 1
  end

end

class Demo
  include HelloDemo
  puts "defining class"

  def initialize
    puts "initializing class"
    @hello = '123'
    not_hello = 'haha'
    puts not_hello
  end

  def demo
    puts "hello world"
    a = 10
    b = 2 + a
    puts "a: #{a} and b: #{b}"
    # привет сходи в магазин
  end

  def hello
    'hello wold from func'
  end

  def not_hello
    'aaaaaaaa'
  end

  def say_hello
    puts hello
    puts not_hello
    hello = '123'
  end
end

instance_of_demo = Demo.new

instance_of_demo.plus_one 2

# 10.times do |i|
#   if true
#     puts "Calling #{i} time"
#     puts instance_of_demo
#     instance_of_demo.demo # то же самое что и instance_of_demo.demo()
#   end
# end
