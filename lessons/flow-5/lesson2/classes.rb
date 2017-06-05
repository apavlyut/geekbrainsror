# class Demo
# end
#
# d = Demo.new
#
# d.hello = 'hi 2'
# puts d.hello
#
# class User < ActiveRecord::Base
# end

# class Manager < User
#   # column :type = User
# end
# Manager.where(name: 'Alex').to_sql # select * from users where type='Manager'

# arr = [1,2,3,4]
#
# puts arr.to_s
#
# class Array
#   def to_s
#     "ha ha :)"
#   end
# end
#
# arr = [1,2,3,4]
#
# puts arr.to_s

class User
  def self.new
    @user ||= super
  end
end

user = User.new
puts user.inspect

user2 = User.new
puts user2.inspect

user3 = User.new
puts user3.inspect
