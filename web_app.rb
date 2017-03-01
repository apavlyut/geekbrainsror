require_relative 'msg_action.rb'
require 'erb'

class WebApp
  PATH_TO_FORM = 'view/form.erb'
  def initialize
    @msg_act = MsgAction.new
    @msg_text = @msg_act.action

  end

  def call env
    @req = Rack::Request.new env

    case @req.path
    when '/'
      Rack::Response.new render

    when '/form'
      Rack::Response.new do |resp|
        @val = @req.params['val']
        @msg_text = @msg_act.action param: @val
        resp.redirect '/'

      end

    else
      Rack::Response.new '404'

    end

  end

  def render
    ERB.new(File.read(PATH_TO_FORM)).result(binding)

  end

  def text
    @msg_text

  end

end
