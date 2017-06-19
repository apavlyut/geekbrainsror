module Accessible
  def can_read?
    if self.is_a? Manager
      true
    else
      false
    end
  end
end

class User
  # class << self
  #   include Accessible
  # end

  extend Accessible

  attr_accessor :full_name

  def initialize
    @full_name = 'user'
  end

  def self.find(id)
    puts "User.find called with id: #{id}"
  end

  def name
    puts self.inspect
  end

  def first_name
    
  end

  def last_name
    
  end
end

class Manager < User
  def self.find(id)
    super(id)
    puts "Manger find done with id: #{id}"
  end

  def initialize
    @full_name = 'manager'
  end
end

# Manager.find 12

# # u = User.new
# m = Manager.new
# puts "manager full name #{m.full_name}"
# # puts "m can? #{m.can_read?}"
# # puts "u can? #{u.can_read?}"

# puts "Manager can? #{Manager.can_read?}"
# puts "Manager can? #{Manager.can_read?}"
# puts "User can? #{User.can_read?}"


class Team
  include Enumerable
  def each
    yield "pos qb"
    yield "pos wr"
    yield "pos wr2"
    yield "pos rb"
    yield "pos cb"
    yield "pos lb"
  end

  def last
    drop(0).last
  end

end

tc = Team.new

# puts t.class.instance_methods
# puts Enumerable.instance_methods(false)

team_pos = ['qb', 'rb', 'wr', 'lb', 'cb']

puts team_pos.inspect

new_team = team_pos.each do |pos|
  puts "Позиция: #{pos}"
end

puts "team_pos: #{team_pos.inspect}"
puts "new_team: #{new_team.inspect}"

map = team_pos.map do |pos|
  "Позиция: #{pos}"
end

puts "team_pos: #{team_pos.inspect}"
puts "map: #{map.inspect}"

qb = team_pos.find{|el| el.match? /[qr]b/ }

qb = team_pos.find{|el| 
  el.include? 'b'
}

qb = team_pos.find_all do |el| 
  el.include? 'b'
end

puts "qb: #{qb.inspect}"

puts "qb: #{tc.grep(/[qr]b/).inspect}"

puts "tc: #{tc.inspect}"
puts "tc: #{tc.last}"
puts "min: #{tc.drop 0}"

puts //.class

