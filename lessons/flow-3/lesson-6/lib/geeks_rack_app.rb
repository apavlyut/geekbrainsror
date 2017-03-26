class GeeksRackApp

  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @request = Rack::Request.new(env)
  end

  def response
    puts @request.params.inspect

    case @request.path

    when '/home'
      Rack::Response.new home_page
    when '/about'
      Rack::Response.new about_page
    else
      Rack::Response.new root_page
    end
  end

  def root_page
    page_body = title('Главная')
    page_body += bq("Добро пожаловать в клуб, #{@request['name']}")
    page_body += navbar
    page_body
  end

  def home_page
    page_body = title('Домашняя')
    page_body += par('меня тут встречайте')
    page_body += bq('меня зовут HOME')
    page_body += navbar
    page_body
  end

  def about_page
    page_body = title('Привет')
    page_body += par('меня тут нет ')
    page_body += bq('а я ABOUT PAGE')
    page_body += navbar
    page_body
  end

  private

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
