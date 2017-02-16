print "Привет, представьcя: "
username = gets
puts "hello #{username}"

print "А теперь пароль: "
password = gets

if password.to_s == '123123'
  puts "Ты в игре, человек!"
else
  puts "У нас фиеста, без пароля вам тут не место, человечишко о_О"
end
