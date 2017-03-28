class Output_data

  def initialize
  end

  # Выводим все содержимое из файла в консоль

  def output_data
    puts "Сохраненные ссылки"
      File.open("links_data.txt", "r").each_line do |line|
        puts line.strip!
    end
  end
end
