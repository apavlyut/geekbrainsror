require 'mongo'
require 'date'

class Mango_Keeper

  def initialize
    @client = Mongo::Client.new(['127.0.0.1:27017'], :database => 'test');
    @collection = @client[:fishy_chat]
  end

  def add_new_message(name, message)
    new_message = {name: name, message: message, date: DateTime.new()}
  end

  def get_messages
    @collection.find().limit(5)
  end
end
