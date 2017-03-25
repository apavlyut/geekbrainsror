require_relative '../lib/grabthis.rb'
require 'test/unit'


class TestGrabThis < Test::Unit::TestCase

  def setup
      @url = 'google.com'
      @site = GrabThis.new(@url)
  end

  def test_add_http!
    assert_equal('http://google.com', @site.add_http!)
  end

end
