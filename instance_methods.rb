class Ball

  class << self
    def stop
      #code
    end

    def run
      #code
    end
  end

  def jump
    #code
  end

  def print
    #code
  end

  private
    def fly
      #code
    end
end

puts "все методы инстанса"
puts Ball.instance_methods(false)

puts "все методы класса"
puts Ball.methods(false)
