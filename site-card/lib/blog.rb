class Blog

  def call(env)
    @request = Rack::Request.new(env)
    case @request.path
    when '/'
      Rack::Response.new(render("index.html.erb"))
    when '/example'
      Rack::Response.new(render("example.html.erb"))
    when '/name_form'
      Rack::Response.new do |response|
        response.set_cookie('friend_name', 
        @request.params["friend_name"])
        response.redirect('/')
      end
    else
      Rack::Response.new("ERROR", 404)
    end
  end

  def render (filename)
    path = File.expand_path("../../views/#{filename}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def friend_name
    @request.cookies['friend_name'] || 'друг'
  end

  def year
    now = Time.now
    now.year
  end

end