require 'erb'

class Myurin
  def call(env)

    @request = Rack::Request.new(env)
    case @request.path
    when '/'
      Rack::Response.new(render('index.html.erb'))
    when '/messages'
      Rack::Response.new(render('messages.html.erb'))
    when '/post_message'
      Rack::Response.new do |response|
        response.set_cookie('your_post', @request.params["message_to_me"])
        response.redirect('/')
      end
    else
      Rack::Response.new("Not found!", 404)
    end
  end
  
  def render(filename)
    path = File.expand_path("../../views/#{filename}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
  
  def send_message
    @request.cookies['your_post'] || ''
  end
end