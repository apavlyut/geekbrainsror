require 'blog'

use Rack::Static, :urls => ["/assets", "/images"], :root => "public"
use Rack::Reloader, 0

run Blog.new