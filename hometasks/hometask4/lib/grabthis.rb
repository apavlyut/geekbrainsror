require 'nokogiri'
require 'openssl'
require 'open_uri_redirections'


class GrabThis

  def initialize(url) # Получение адреса сайта введенной пользователем
    @link = url
    @links = []
  end

# Выкачиваем ссыылки с сайта
  def grab!
    if valid_domain_name? # если адрес верный, то:
      html = open(@link, {allow_redirections: :safe, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})
      page = Nokogiri::HTML open(html).read

      page.css('a').each do |link| # проходим по тегу "а" и берем адреса ссылок и их описание
        tag_text = link.text.strip
        tag_href = link['href']

        if tag_href != '#' && tag_href != '/' # если ссылка не якорь
          @links.push(
              text: tag_text, # сохраняем текст ссылки в массив
              href: tag_href  # сохраняем адресс ссылки в массив
          )
        end
      end
      save_file! # сохраняем файл
      read_from_file # читаем с файла
    end
  end

  # Добавим к адресу сайта http:// если требуется
  def add_http!
    unless @link.index('http://')
      @link = 'http://' + @link
    else
      @link
    end
  end

  private

  # Проверка валидности адреса
  def valid_domain_name?
    add_http!
    regexp = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
    if @link =~ regexp
      puts "Ссылка принята"
      return true
    else
      puts "Введена не верная ссылка"
      return false
    end
  end

  # Создание и сохранение ссылок в файл
  def save_file!
    file = File.new(File.dirname(__FILE__) + "/links.txt", "w:UTF-8")
    file.puts(@links)
    file.close
    puts "Найденные ссылки  по адресу: #{@link} сохранены в файл: #{File.dirname(__FILE__)}/links.txt"
  end

  # Чтение данных с файла
  def read_from_file
    file = File.new(File.dirname(__FILE__) + "/links.txt", "r:UTF-8")
    content = file.read
    puts "Выводим содержимое файла: #{File.dirname(__FILE__)}/links.txt"
    puts content

  end

end
