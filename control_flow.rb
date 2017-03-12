message = :not_hello

if false
  puts "выполнение тут"
end

def ready_to_go?
  !defined?(message)
end

def prepared_to_go?
  false
end

if ready_to_go? || prepared_to_go?
  puts 'message не задекларирован!'
elsif message == :hello
  puts "hello message"
else
  puts "hello"
end

case message
when :not_hello
  puts "case: not hello"
when :hello
  puts "case: hello"
else
  puts "case: deafult|else"
end
