class WelcomeController < ApplicationController

  def index
    @hello = 'Итак'
  end

  def inline
    respond_to do |format|
      format.html {
        render inline: 'gohome'
      }
      format.js #
      format.xml #
    end
  end
end
