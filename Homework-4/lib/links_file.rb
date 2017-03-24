
class Links_File
# получение на вход введенной пользователем ссылки
  def initialize (url)
    @url=get_source(url)
    @file_name=generate_file_name(url)
  end

# проверка ссылки на соответствие записи и дополнение строки
  def get_source(url)
    if url.index('www')
      if url.index('www')>0
        link=url
      else
        link = 'https://'+url
      end
    else
      link='https://www.'+url
    end
    link
  end

# после чего выкачивать на странице все ссылки которые есть
  def collection_of_links
    doc= Nokogiri::HTML(open(@url).read)
    doc.css('a').map do |link|
        if (href = link.attr('href')) && href.match(/^https?:/)
          record_received_links(href)
        end
    end
  end
# генерирование имени файла для вывода ссылок
  def generate_file_name(url)
      cur_date=Date.today().strftime('%d-%b-%Y')
      @file_name = "public/links_#{url}_#{cur_date}.txt"
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
