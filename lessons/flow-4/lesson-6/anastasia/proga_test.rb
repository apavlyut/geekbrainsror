require 'test/unit'
require_relative './proga'

class ProgaTest < Test::Unit::TestCase

  def setup
    #code
    links = []
    link_body = ""
    rand_numb = rand(100)
    rand_numb.times do |link|
      rnub = rand(304)
      url = "http://assets#{rnub}.pavlyut.com"
      unless links.include? url
        links << url
        link_body += "<a href='#{url}'>blabla#{rnub}</a>"
      end
    end

    @links = links

    @page = Nokogiri::HTML("<html><body>#{link_body}</body></h
    proga = Proga.new
    extracted_links = proga.extract_links(page)tml>")
  end

  def test_extract_links
    #execute
    proga = Proga.new
    extracted_links = proga.extract_links(@page)
    #validate
    assert_equal extracted_links.count, @links.count
  end

  def test_all_links_included
    #execute
    proga = Proga.new
    extracted_links = proga.extract_links(@page)
    #validate
    @links.each do |link|
      assert_equal extracted_links.include?(link), true
    end
  end
end
