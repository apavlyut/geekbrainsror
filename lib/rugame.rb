require 'erb'

class Rugame
  def initialize
    @view_path = File.expand_path(File.dirname(__FILE__) + '/../views');
    @layout_path = get_view_path('/layout')
  end

  def get_view_path(request_path)
    filename = "#{request_path.gsub('/', '')}.html.erb"
    path = File.expand_path("#{@view_path}/#{filename}")
    if (File.exist? path)
      path
    else
      false
    end
  end

  def call(env)
    @request = Rack::Request.new(env)

    path = get_view_path(@request.path == '/' ? '/index' : @request.path)

    if (path)
      Rack::Response.new(render(path, @request.params))
    else
      Rack::Response.new(render(get_view_path '404'), 404)
    end
  end

  def render(path, params = {})
    content = ERB.new(File.read(path)).result(binding)
    ERB.new(File.read(@layout_path)).result(binding)
  end

  def is_menu_active?(check_path)
    check_path == @request.path
  end
end
