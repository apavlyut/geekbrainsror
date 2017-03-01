class Semafore
  attr_reader :place_point, :color

  def initialize place_point:
    @place_point = place_point
    @colors = [:red, :yellow, :green]
    @step = 1
    @val = rand(0..2)
    @color = :off

  end

  def change_color!
    @val += @step
    if @val < 0
      @val = 1
      @step = 1

    elsif @val > 2
      @val = 1
      @step = -1

    end
    @color = @colors[@val]
    @color = :broken if rand(4) == 4

  end

end
