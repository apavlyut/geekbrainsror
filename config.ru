require 'myurin'

use Rack::Reloader, 0
use Rack::Static, :urls => ["/css", "/images"], :root => "public"
run Myurin.new