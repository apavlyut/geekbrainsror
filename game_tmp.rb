require_relative 'lib/semafore.rb'
require_relative 'lib/transport.rb'
require_relative 'lib/road.rb'
require_relative 'lib/crossroad.rb'

module GameTmp
  def self.create road_count:, roads_length:
    roads = []
    puts "Now we need to place semafore on each road."
    (1..road_count).each do |road|
      print "Where do you want place semafore on road \##{road}? Enter here: #{roads_length / 2}"
      semafore_place = gets.to_i
      semafore_place = roads_length / 2 if semafore_place == 0

      roads.push Road.new semafore: (Semafore.new place_point: semafore_place), length: roads_length, name: road

    end

    CrossRoad.new roads: roads

  end

end

puts "Hello! :)\n\n"
print "How many roads need to create? Enter here (2): "
road_count = gets.to_i
road_count = 2 if road_count == 0

print "What will be the length of the roads? Enter here (10): "
roads_length = gets.to_i
roads_length = 10 if roads_length == 0

game = GameTmp.create road_count: road_count, roads_length: roads_length

puts "All is ok! #{road_count} roads with semafores was created!"
puts "Now we need to create cars or bikes or other on each road."

game.roads.each_with_index do |e, ind|
  puts "\nCurrent road \##{ind+1}"
  enought = false
  while !enought
    print "Is will be a ...? (car): "
    vid = gets.to_s.tr("\n", '')
    vid = 'car' if vid == ''

    print "Start point wil be ...? (1): "
    start_point = gets.to_i
    start_point = 1 if start_point == 0

    print "Speed will be ...? (1,-1,...): "
    speed = gets.to_i
    speed = 1 if speed == 0

    transport = GameTmp::Transport.new vid: vid, speed: speed, start_point: start_point

    puts "In that place can't be added #{vid}, because it busy or outside the road" unless e.add_transport(transport)

    print "Add other car? (1 - yes, 2 - no (default))): "
    tmp = gets.to_i
    tmp = 2 if tmp == 0

    enought = true if tmp == 2

  end

end

puts "All cars are placed. Let's start motion!"

print "Start? (1 - yes (default), 2 - quit): "
quit = gets.to_i

while !game.all_done?
  print "Next step (1 - default), print current state (2): "
  tmp = gets.to_i
  tmp = 1 if tmp == 0

  game.next_step! if tmp == 1
  game.print_stat if tmp == 2

end if quit != 2

game.print_stat

puts "All cars are arrived or broken.\nGAME OVER.\nBye!"
