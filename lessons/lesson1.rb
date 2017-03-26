# puts "hello world"; puts "hihihi"
# puts "hello world2"

def hello
  puts "hello world"
end

class SuperHello
  def initialize(name)
    puts "Inited name #{name}"
  end
end

class BigSuper < SuperHello
  def initialize(*args)
    super(args)
  end
end

BigSuper.new('Саша', 'Коля')
