class MyError < SecurityError

end

class Person
  def name
    raise MyError
  end
end

# users name:stirng phone:integer age:integer

puts "Start"

begin
  person = Person.new
  puts person.name
rescue SecurityError => e
  puts "Вот поймали ошибку security"
rescue Exception => e
  puts "Вот поймали ошибку Exception"
end

puts "hello world"
