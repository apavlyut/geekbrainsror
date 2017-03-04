class HamsterController < ApplicationController

  def index
  end

  def change_hamster_number
    @number = params[:number]
    if @number.match(/^\d+$/)  && @number.to_i.between?(1,3)
      result = @number
    else
      result = 'wrong'
    end
    cookies[:number] = result
    redirect_to action: "index"
  end
end
