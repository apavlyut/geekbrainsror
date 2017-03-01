require_relative 'lib/geeks'
require 'rack/lobster'

use Rack::Reloader, 0

use Rack::Static, :urls => ['/assets', '/images'], :root => 'public'
use Rack::Auth::Basic, "Geeks 2.0" do |username, password|
  Rack::Utils.secure_compare('secret', password)
end

run Rack::Lobster.new

run Geek.new

