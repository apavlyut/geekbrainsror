require 'erb'
class Router

	def initialize
		@friend = nil
		@test = 'test'
	end

	def call(env)
		@request = Rack::Request.new env
		case @request.path 
		when '/'
			@friend = 	@request.cookies['friend'] || nil
			Rack::Response.new(render('index'))
		when '/about'
			Rack::Response.new(render('about'))
		when '/post'
			@friend = @request.params['friend']
			Rack::Response.new do |response|
				response.set_cookie("friend", {:value => "#{@friend}", :path => "/", :expires => Time.now+1000})
				response.redirect('/')
			end
		when '/deletefriend'
			@friend = nil
			Rack::Response.new do |response|
				response.set_cookie("friend", {:value => "#{@friend}", :path => "/", :expires => Time.now-1000})
				response.redirect('/')
			end
		else 
		    Rack::Response.new('Not found', 404)
        end
	end

	def render(view)
		path = File.expand_path('../../views/', __FILE__)
		path += "/#{view}.html.erb" 
		ERB.new(File.read(path)).result(binding)
	end


	def show_friend
		if @friend.instance_of? nil.class
			'<em>Here should be your friend</em>'
		
		else
				"<em>#{@friend}</em>"
		end
	end
end