require_relative 'lib/semafore.rb'
require_relative 'lib/transport.rb'
require_relative 'lib/road.rb'
require_relative 'lib/crossroad.rb'

class MsgAction
  attr_reader :step

  EMPTY_STR = ''

  def initialize
    @step = 0
    @params = {}

  end

  def action param: 0
    case @step
    when 0
      @step += 1
      txt = "Hello! :)<br><br> \
        How many roads need to create? Enter here (2):"

    when 1
      @step += 1
      @params[:road_count] = param.to_i
      @params[:road_count] = 2 if @params[:road_count] == 0

      txt = "What will be the length of the roads? Enter here (10): "

    when 2
      @step += 1
      @params[:roads_length] = param.to_i
      @params[:roads_length] = 10 if @params[:roads_length] == 0

      @params[:roads] = []
      @params[:road] = 1
      txt = "Now we need to place semafore on each road.<br> \
        Where do you want place semafore on road \##{@params[:road]}? \
          Enter here: #{@params[:roads_length] / 2}"

    when 3...(2 + @params[:road_count])
      @step += 1
      @params[:semafore_place] = param.to_i
      @params[:semafore_place] = @params[:roads_length] / 2 if @params[:semafore_place] == 0
      @params[:roads].push Road.new semafore: (Semafore.new place_point: @params[:semafore_place]), length: @params[:roads_length], name: @params[:road]

      @params[:road] += 1
      txt = "Where do you want place semafore on road \##{@params[:road]}? \
          Enter here: #{@params[:roads_length] / 2}"

    when (2 + @params[:road_count])
      @step += 1
      @params[:semafore_place] = param.to_i
      @params[:semafore_place] = @params[:roads_length] / 2 if @params[:semafore_place] == 0
      @params[:roads].push Road.new semafore: (Semafore.new place_point: @params[:semafore_place]), length: @params[:roads_length], name: @params[:road]

      @params[:game] = CrossRoad.new roads: @params[:roads]

      txt = "All is ok! #{@params[:road_count]} roads with semafores was created!<br> \
        Now we need to create cars or bikes or other on each road."

      @params[:enought] = false
      @params[:road] = 1
      @step_inner = 0

      txt += "<br>Current road \##{@params[:road]} <br>\
        Is will be a ...? (car): "

    when (2 + @params[:road_count]) + 1
      if !@params[:enought]
        case @step_inner
        when 0
          @step_inner += 1
          @params[:vid] = param.to_s
          @params[:vid] = 'car' if @params[:vid] == ''

          txt = "Start point wil be ...? (1): "

        when 1
          @step_inner += 1
          @params[:start_point] = param.to_i
          @params[:start_point] = 1 if @params[:start_point] == 0

          txt = "Speed will be ...? (1,-1,...): "

        when 2
          @step_inner += 1
          @params[:speed] = param.to_i
          @params[:speed] = 1 if @params[:speed] == 0

          transport = Transport.new vid: @params[:vid], speed: @params[:speed], start_point: @params[:start_point]

          txt = EMPTY_STR
          txt = "In that place can't be added #{@params[:vid]}, because it busy or outside the road" unless @params[:game].roads[@params[:road] - 1].add_transport(transport)
          txt += "Add other car? (1 - yes, 2 - no (default))):"

        when 3
          @step_inner = 0
          tmp = param.to_i
          tmp = 2 if tmp == 0

          @params[:enought] = true if tmp == 2

          txt = EMPTY_STR
          (
            @params[:road] += 1
            txt = "Current road \##{@params[:road]}<br>"
            @params[:enought] = false
          ) if @params[:enought]

          txt += "Is will be a ...? (car): "

        end

      end

      (
        @step += 1
        txt = "All cars are placed. Let's start motion! <br> \
        Start? (1 - yes (default), 2 - quit): "

      ) if @params[:road] > @params[:road_count]

    when (2 + @params[:road_count]) + 2
      quit = param.to_i
      @step += 2 if quit == 2
      @step += 2 if @params[:game].all_done?
      @step += 1

      txt = "Next step (1 - default), print current state (2): "

    when (2 + @params[:road_count]) + 3
      @step += 1 if @params[:game].all_done?

      tmp = param.to_i
      tmp = 1 if tmp == 0

      txt = EMPTY_STR
      txt = @params[:game].next_step! if tmp == 1
      txt = @params[:game].print_stat if tmp == 2

      txt += "<br>Next step (1 - default), print current state (2): "

    when (2 + @params[:road_count]) + 4
      txt = @params[:game].print_stat
      txt += "<br>All cars are arrived or broken.<br>GAME OVER.<br>Bye!"
      @params[:roads] = EMPTY_STR
      @params[:game] = EMPTY_STR
      @step = -1

    when -1
      txt = "GAME OVER.<br> Restart it? (1 - yes (default), 2 - no)"
      @step = -2

    when -2
      tmp = param.to_i
      tmp = 1 if tmp == 0

      (
        @step = 1
        @params = {}
        txt = "Hello! :)<br><br> \
          How many roads need to create? Enter here (2):"
      ) if tmp == 1

    end

    txt

  end

end
