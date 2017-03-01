require 'erb'
require 'json'
# require 'db'

class Fishy_Chat
  def call(env)
    # @mango = Mango_Keeper.new()
    request = Rack::Request.new(env)
    case request.path
    when '/'
      Rack::Response.new(render("index.html.erb"))
    # when '/fishy_chat'
    #   post_name = request.params["name"] || ''
    #   post_message = request.params["message"] || ''
    #   @mango.add_new_message(post_name, post_message)
    #   @messages = @mango.get_messages
    #   Rack::Response.new(render("fishy_chat.html.erb"))
    when '/json'
      answer = {a: 1, b: 2, c: 3, d: 'answer4', inner_array: {a:2, c:3}}
      Rack::Response.new(answer.to_json)
    else
      Rack::Response.new("Something went wrong", 404)
    end
  end

  def render (filename)
    path = File.expand_path("../../views/#{filename}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def messages
    @messages
  end

end
