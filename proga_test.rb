require 'test/unit'
require './proga.rb'

class ObjectsTest <
Test::Unit::TestCase

	def test_add_link
		add = add_link.new 
		add.add_link('http://www.yandex.ru')
		expect(add.links).to_include 'http://www.yandex.ru'
	end

	def test_extract_link
		extract = extract_links.new 
	end

	def test_print_links
		obj = Proga.new
		assert_equal obj.print_links, 'default'
	end

end