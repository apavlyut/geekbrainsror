require 'rubygems'
require 'rack'
require 'minitest/autorun'
require File.expand_path('../../greeter/lib/greeter', __FILE__)

describe Greeter do
  before do
    @request = Rack::MockRequest.new(Greeter)
  end

  it 'returns a 404 response for unknown request' do
    @request.get('/unknown').status.must_equal 404
  end

end