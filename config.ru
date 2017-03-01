require './lib/Router'

use Rack::Reloader

use Rack::Static, :urls => ['/css'], :root => 'public'

run Router.new