class Road
  attr_reader :semafore, :cars_on_semafore, :transport

  def initialize length:, semafore:, name:
    @name = name
    @length = length
    @semafore = semafore
    @transport = []

  end

  def to_s
    @name

  end

  def all_cars_stoped?
    res = true
    @transport.each do |e|
      res = false if (e.status != :broken && e.status != :arrived)

    end
    res

  end

  def add_transport item
    all_ok = true
    @transport.each do |e|
      all_ok = false if e.cur_point == item.cur_point || !item.possible_movement?(road_length: @length)

    end
    if !item.possible_movement?(road_length: @length)
      all_ok = false

    end if @transport.length == 0

    @transport.push item if all_ok
    all_ok

  end

  def motion!
    @cars_on_semafore = []
    @semafore.change_color!
    @transport.each do |e|
      if e.cur_point == @semafore.place_point || (@semafore.place_point - e.cur_point).abs <= e.speed
        @cars_on_semafore.push e if !e.broken?
        e.move! if (@semafore.color == :green || @semafore.color == :broken) && e.possible_movement?(road_length: @length)

      else
        e.move! if e.possible_movement?(road_length: @length)


      end

    end

  end

end
