class Transport
  attr_reader :cur_point, :speed, :vid, :status

  def initialize vid:, speed:, start_point:
    @vid = vid
    @speed = speed
    @health = 100
    @cur_point = start_point
    @status = :placed

  end

  def move!
    @status = :moving
    @cur_point += @speed

  end

  def possible_movement? road_length:
    @status = :arrived if 0 > @cur_point || @cur_point > road_length
    0 <= @cur_point && @cur_point <= road_length && !broken?

  end

  def damage!
    @status = :broken
    @health = 0

  end

  def broken?
    @health == 0

  end

end
