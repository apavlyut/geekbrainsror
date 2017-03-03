require 'rugame'

use Rack::Static, :urls => ['/assets/css'], :root => 'public'

use Rack::Reloader, 0

run Rugame.new
