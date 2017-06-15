require 'ap'
require 'date'
require 'set'
require 'ostruct'
puts "collections and containers"

array = [1,2,3,4,'hello',nil,'12',:alex]

# ap array
# puts array.class

hash = {
  name: 'Alex', 
  email: 'alex@pavlyut.com',
  personal_detauls: {
    age: 33,
    height: 180,
    hair: :black
  },
  my_array: array
}

# ap hash

# hash[array] = 'hello'
# puts "after add obj as key:"


# array_old = array

# ap hash

# puts hash.class

# puts "addedd hash to end of array:\n\n"

# array << hash

# ap array

# puts "smth strange:"

# ap hash[[1,2,3,4,'hello',nil,'12',:alex]]

# ap hash[array]


# params[:from_date]...params[:to_date]

range = Date.parse('01.12.1996')..Date.parse('31.12.1996')

# transactions.where(created_at: Date.parse(params[:from_date]).beginning_of_day...Date.parse(params[:to_date]).end_of_day)

# range

# puts range.last

# range.each do |i|
#   puts "i: #{i}"
# end

# 100.times do |i|
#   puts "here is index: #{i}"
# end

# ap range.last
# ap range
# ap range.class

set = Set.new()

set << array
set << hash
set << range unless set.include? range

ap set

# puts set.include? array
# puts 'abcd'.include? 'b'

struct = OpenStruct.new :country => "Australia", :capital => "Canberra"

struct.name = 'alex'
struct.email = 'alex@pavlyut.com'

ap struct.email
