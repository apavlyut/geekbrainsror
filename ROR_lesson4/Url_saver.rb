class Url_saver

  def initialize(url)
    @url = url
  end

  def added_url
    File.open("links_data.txt","a") do |file|
      file.puts @url
        file.close
    end
  end

  def output_data
    puts "Сохраненные ссылки"
      File.open("links_data.txt", "r").each_line do |line|
        puts line.strip!
      end
  end
end
url = Url_saver.new(gets)
url.added_url
url.output_data
url.inspect
