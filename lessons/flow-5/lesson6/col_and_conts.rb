require ''
puts "collections and containers"

array = [1,2,3,4,'hello',nil,'12',:alex]

puts array.inspect
puts array.class

hash = {
  name: 'Alex', 
  email: 'alex@pavlyut.com',
  personal_detauls: {
    age: 33,
    height: 180,
    hair: :black
  }
}

puts hash.inspect
puts hash.class