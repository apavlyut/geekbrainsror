require 'rubygems'
require 'open-uri'
require 'nokogiri'

class Proga
  # 1. получает ссылку на страницу
  def add_link
    link = gets.chomp
    return link
  end
  # 2. выбирает оттуда все ссылки которые найдет
  def extract_links
    doc = Nokogiri::HTML(open(add_link))
    @links = doc.xpath('//a/@href')
  end

  # 3. и выводит их на экран
  def print_links
    puts @links
  end

end

webPars = Proga.new
webPars.extract_links
webPars.print_links
