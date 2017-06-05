def restrict_age
  puts "Enter your age:"
  choise = gets.chomp
  # if (choise.to_i > 18)
  unless (choise.to_i <= 18)
    puts "Welcome to the party"
  else
    puts ">>>>> You are soooooooo small - go home" if choise.to_i < 10
    puts "You are very malenkii"
    restrict_age
  end
end

# restrict_age

# def allowed_pass
#   block_passed? && age_restricted? && money.count > 230
# end
#
# if allowed_pass
#   puts "1"
# else
#   puts "2"
# end

arr = [1,2,3,45,6,78,Object.new, "asd"]

# puts arr
#
# (1..10).each do |i|
#   puts "i: #{i}"
# end

# arr.each{|el| puts "this is element: #{el.inspect} #{el.class}"}
#
# "this is a strhing".each_char do |s|
#   puts "s: #{s}"
# end
#
# arr.map do |el|
#   puts "\n"
#   puts 'this is element: #{el.inspect} #{el.class}'
#   puts "this is element: #{el.inspect} #{el.class}"
# end

# loop do
#   puts "aaa\t\n"
#   sleep(1)
#   puts "ok"
#   sleep(2)
# end

a = 10

while a > 0
  puts "a: #{a}"
  a -= 1
  sleep(1)
end

until a == 10
  puts "a: #{a}"
  a += 1
  sleep(1)
end
