require 'test/unit'
require './link_crawler'

class LinkCrawlerTest < Test::Unit::TestCase
  def test_add_link
    lc = LinkCrawler.new
    assert_equal lc.links.count, 0
    22.times do
      lc.add_link('http://www.pavlyut.com')
    end
    assert_equal lc.links.count, 1
  end
end
