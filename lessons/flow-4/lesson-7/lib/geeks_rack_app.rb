# require 'slim'
require 'proga'
class GeeksRackApp

  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @request = Rack::Request.new(env)
  end

  def response
    puts "rendering #{@request.path} with params: #{@request.params.inspect}"
    case @request.path
    when '/home'
      Rack::Response.new home_page
    when '/about'
      Rack::Response.new about_page
    when '/fetch'
      Rack::Response.new results_page
    else
      Rack::Response.new root_page
    end
  end

  def results_page
    proga = Proga.new
    if proga.valid_url? @request.params['website']
      # получаем страницу из сети
      page = proga.get_page(@request.params['website'])
      # извлекаем ссылки
      @links = proga.extract_links(page)
      render 'results.html.erb'
    else
      @notice = 'Ссылка не валидная'
      render 'index.html.erb'
    end
  end

  def home_page
    page_body = title('Домашняя')
    page_body += par('меня тут встречайте')
    page_body += bq('меня зовут HOME')
    page_body += navbar
    page_body
  end

  def root_page
    @notice = 'Введите ссылочку'
    render 'index.html.erb'
    # page_body = title('Главная')
    # page_body += bq("Добро пожаловать в клуб, #{@request['name']}")
    # page_body += navbar
    # page_body
  end

  def about_page
    page_body = title('Привет')
    page_body += par('меня тут нет ')
    page_body += bq('а я ABOUT PAGE')
    page_body += navbar
    page_body
  end

  private

    def render(template)
      path = File.expand_path("../views/#{template}", __FILE__)
      ERB.new(File.read(path)).result(binding)
      # Slim::Template.new(path, {}).render
    end

    def navbar
      nav_body = "<hr>"
      nav_body += link_to('Главная', '/')
      nav_body += link_to('Хоум пейдж', '/home')
      nav_body += link_to('Эбаут ас', '/about')
      nav_body
    end

    def title(text)
      "<h1>#{text}</h1>"
    end

    def bq(text)
      "<h1>#{text}</h1>"
    end

    def link_to(text, path)
      "<a href='#{path}'>#{text}</a>"
    end

    def par(text)
      "<p>#{text}</p>"
    end
end
