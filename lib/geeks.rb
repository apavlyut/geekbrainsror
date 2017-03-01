require 'erb'

class Geek
  def call(env)
    # [200, {'Content-Type' => 'text/html'}, ["<strong>Hello, Geeks!</strong>"]]
    @request = Rack::Request.new(env)

    case @request.path
      when '/'
        Rack::Response.new(render("index.html.erb"))
      when '/post_form'
        Rack::Response.new do |response|
         number_str = @request.params["number"]
          if number_str.match(/^\d+$/)  && number_str.to_i.between?(1,3)
           result = @request.params["number"]
          else
            result = 'wrong'
          end
         response.set_cookie('homyak_number',
                             result)
         response.redirect('/')
        end
      else
          posted_name = @request.params["number"] || ''

        Rack::Response.new("Not found!! #{posted_name}", 404)
    end
  end

  def render(filename)
    path = File.expand_path("../../views/#{filename}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def homyak_number
    @request.cookies['homyak_number'] || ''
  end
end