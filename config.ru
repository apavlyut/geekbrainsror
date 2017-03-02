require 'fishy_chat'

use Rack::Reloader, 0
run Fishy_Chat.new
