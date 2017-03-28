require './lib/url_secure.rb'
require './lib/url_saver.rb'
require './lib/output_data.rb'

    puts "Введите или скопируйте ссылку."

# Вводим или копируем ссылку.

    url = Url_secure.new(gets.chomp)

    # Переводим ссылку на https:// протокол

    url = url.secure_method

# Проверяем ссылку на соответствие

    link = (/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/ =~ url)

    if link == 0

      puts "Прошла проверку. Ссылка сохранена"

        url = Url_saver.new(url)

# Сохраняем ссылку в файл.

        url.added_url

        url = Output_data.new

# Выводим все ссыки из файла в консоль

        url.output_data

    else

      puts "К сожалению это не ссылка"

    end
