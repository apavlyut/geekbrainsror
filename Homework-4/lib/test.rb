require_relative 'links_file.rb'
require 'test/unit'
require 'date'


class Link_File_Test < Test::Unit::TestCase
  def setup
    @url='yandex.ru'
    @links_file=Links_File.new(@url)
    @cur_date=Date.today().strftime('%d-%b-%Y')
  end

# get_source(url)   # возвращает ссылку в формате: https://www.example.com
  def get_source
    assert_equal( 'https://www.yandex.ru',@links_file.get_source('yandex.ru'))
    assert_equal( 'https://www.yandex.ru',@links_file.get_source('www.yandex.ru'))
    assert_equal( 'https://www.yandex.ru',@links_file.get_source('https://www.yandex.ru'))
  end

# generate_file_name(url)  # # генерирование имени файла для вывода ссылок
  def test_generate_file_name

    assert_equal( "public/links_yandex.ru_#{@cur_date}.txt", @links_file.generate_file_name('yandex.ru'), '' )
  end
end
