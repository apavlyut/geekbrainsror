# 1. Письменная речь.
# 2. Болезнь инструмента.
# 3. Требования к результату.
# 4. План программы

# Задача: Программа получает ссылку на страницу, выбирает оттуда все ссылки которые найдет и выводит их на экран.
# Ограничения: программа должна получать ссылку от меня в интерактивном режиме (используя метод gets)

# Программа:
require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'

class Proga

  # создание класса "Программа"
  def initialize()
    @urls = [] # массив, в который будут складываться все ссылки с выбранной страницы
  end

  def run
    # получаем ссылочку
    user_link = ask_and_store_link
    # получаем страницу из сети
    page = get_page(user_link)
    # извлекаем ссылки
    links = extract_links(page)
    # печатаем их
    print_links(links)
  end

  # 1. получает ссылку на страницу
  def ask_and_store_link
  	puts "Please, input a web-site" # запрос у пользователя ссылки на сайт
    user_link = gets.chomp # создание переменной link, в  которую будет складываться ответ пользователя

    uri = URI.parse(user_link)

    while (uri && uri.host.nil?)
      puts "website is invalid, enter again:"
      user_link = gets.chomp
      uri = URI.parse(user_link)
    end

    user_link
    # puts "You entered: #{link}" # вывести на экран значение переменной link
  end

  def get_page(url)
    Nokogiri::HTML(open(url, allow_redirections: :all))
  end

  # 2. выбирает оттуда все ссылки которые найдет
  def extract_links(page)
    # ищет все ссылки на странице по тегу а
    urls = []
    page.css('a').find_all do |link|
      # если ссылка не якорь
      if (link['href'] != '#') && (link['href'] != '/')
         # сохраняем адресс ссылки в массив
        #  urls.push( href: tag_href )
        puts link['href'].inspect
        urls << link['href'] unless urls.include? link['href']
      end
    end
    # добавляет найденные ссылки в массив
    urls
  end

  # 3. и выводит их на экран
  def print_links(urls)
    urls.each_with_index do |url, index|
      puts "url N #{index}: #{url}"
    end
  end

end
