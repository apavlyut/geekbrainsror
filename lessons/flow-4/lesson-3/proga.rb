# 1. Письменная речь.
# 2. Болезнь инструмента.
# 3. Требования к результату.
# 4. План программы

# Задача: Программа получает ссылку на страницу, выбирает оттуда все ссылки которые найдет и выводит их на экран.
# Ограничения: программа должна получать ссылку от меня в интерактивном режиме (используя метод gets)

# Программа:
class Proga

  # 1. получает ссылку на страницу
  def add_link(link)
    #code
  end

  # 2. выбирает оттуда все ссылки которые найдет
  def extract_links
    #code
  end

  # 3. и выводит их на экран
  def print_links
    #code
  end

end

class ProgaTest
  def should_get_link
    proga = Proga.new
    proga.add_link('http://www.yandex.ru')
    expect(proga.links).to_include 'http://www.yandex.ru'
  end
end
