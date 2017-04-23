class Lesson
  def  initialize(name = "Hello")
    @name = name
  end
  def say_name
    puts "your name is #{@name}"
  end
end


puts  "HELLOW HALLO\n\n\n\n"

lesson = Lesson.new

lesson.say_name
