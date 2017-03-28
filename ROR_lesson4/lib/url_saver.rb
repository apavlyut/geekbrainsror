class Url_saver

  def initialize(url)
    @url = url
  end

# Запись в файл

  def added_url
    File.open("links_data.txt","a") do |file|
      file.puts @url
        file.close
    end
  end
end
