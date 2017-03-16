# Инициализируем тачку которая нам нужна
# Мы ее заказыва на заводе
# Ставим в производство
# Спускаем с конвеера

class TeslaCar
  # Инициализируем тачку которая нам нужна
  def initialize(platform = 350, wheel_drives = 2, body = '3')
    @platform = platform # 350 / 750
    @wheel_drives = wheel_drives # 4
    @body = body # S / X / Rodster
    puts ""
  end

  # полезное действие
  def update!
    #code
  end

  # Мы ее заказываем на заводе
  def order!
  end

  # Ставим в производство
  def push_to_queue!
    #code
  end

  # Спускаем с конвеера
  def release_car!
    "your car platform is #{@platform}"
  end
end
