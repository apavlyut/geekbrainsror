require 'greeter'
use Rack::Static, :urls => ["/assets", "/images"], :root => "public"
use Rack::Reloader,0

run Rack::Cascade.new([Rack::File.new('public'),Greeter])
