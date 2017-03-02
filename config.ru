require_relative 'web_app.rb'

use Rack::Reloader, 0

run WebApp.new
