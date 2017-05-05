require 'erb'
require 'views/proga.rb'

proga = Proga.new

class Greeter
  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @request = Rack::Request.new(env)
  end
  def response
    case @request.path
      when '/'
        Rack::Response.new(render("index.html.erb"))
      when '/change'
        Rack::Response.new do |response|
          response.set_cookie('greet', @request.params['name'])
          response.redirect('/')
        end
      else
        Rack::Response.new("ERROR", 404)
    end


  end

  def greet_name
    @request.cookies['greet'] || "World"
  end

  def render(template)
    path = File.expand_path("../../lib/views/#{template}",__FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end