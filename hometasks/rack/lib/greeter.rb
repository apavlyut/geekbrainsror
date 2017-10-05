require 'erb'
require File.expand_path('../../lib/proga', __FILE__)

proga = Proga


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
        Rack::Response.new results_page
      else
        Rack::Response.new("ERROR", 404)
    end


  end

  def results_page
    proga = Proga.new
    if proga.valid_url? @request.params['name']
      # получаем страницу из сети
      page = proga.get_page(@request.params['name'])
      # извлекаем ссылки
      @links = proga.extract_links(page)
      render 'results.html.erb'
    else
      @notice = 'Ссылка не валидная'
      render 'index.html.erb'
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