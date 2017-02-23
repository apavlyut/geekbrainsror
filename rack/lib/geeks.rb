require 'erb'
class Geeks  
  def call(env)
    # [200, {'Content-Type' => 'text/plain'}, ["<strong>Hello Geeks !!!!!</strong>"]]
    @request = Rack::Request.new(env)
    case @request.path
    when '/'
      Rack::Response.new(render("index.html.erb"))
    when '/post_form'
      Rack::Response.new do |response|
        response.set_cookie('geek_name', @request.params["name_123"])
        response.redirect('/')
      end
    else
      posted_name = @request.params["name_123"] || ''
      Rack::Response.new("Not Found!!! #{posted_name}", 404)
    end
  end

  def render(filename)
    path = File.expand_path("../../views/#{filename}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def geek_name
    @request.cookies['geek_name'] || "GEEEEEEKNAME"
  end
end
