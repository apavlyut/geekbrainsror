
class Links_File
# получение на вход введенной пользователем ссылки
  def initialize (url)
    @url=get_source(url)
    @file_name=generate_file_name
  end

# проверка ссылки на соответствие записи и дополнение строки
  def get_source(url)
    link=''
    if working_url?('https://www.'+url)
      link='https://www.'+url
    elsif working_url?('http://www.'+url)
      link='http://www.'+url
    elsif working_url?('http://'+url)
      link='http://'+url
    elsif working_url?('https://'+url)
      link='https://'+url
    else
      puts "адрес либо не существует, лиибо задан не корректно: #{url}"
      exit
    end
    redirections_url(link)
    link
  end

# Проверка существования url
  def working_url?(url_str)
      @doc= Nokogiri::HTML(open(url_str).read)
      true
    rescue
      false
  end

# обход сертификатов
  def redirections_url(link)
    if link.include?('http://')
      html = open(link, {allow_redirections: :safe, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})
    else
      html = open(link, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})
    end
  end

# после чего выкачивать на странице все ссылки которые есть
  def collection_of_links
    @doc.css('a').map do |link|
      if (href = link.attr('href')) && href.match(/^https?:/)
        record_received_links(href)
      end
    end
  end
# генерирование имени файла для вывода ссылок
  def generate_file_name
    cur_date=Date.today().strftime('%d-%b-%Y')
    @file_name = "public/links_#{URI(@url).host}_#{cur_date}.txt"

  end
# создание файла и запись ссылок.
  def record_received_links(link)
    f = File.open(@file_name, 'a')
    f.puts(link)
    f.close
  end
# вывод на экран списка ссылок из созданного файла.
  def output_selected_links
    f = File.new(@file_name)
    f.each do |line|
      puts line
    end
    f.close
  end
end
