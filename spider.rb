# назначение программы - демонстрация на реальном примере многопоточности

# 10 ссылок и одновременно по ним пройти
class Spider
  def initialize
    @links = []
  end

  # примем ссылку
  def add_link(link)
    @links << link
    puts "added link #{link}"
  end

  # по каждой ссылке дернем http

  def get_url(link)
    sleep(rand(10))
    puts "get #{link}"
  end

  # демонстрируем многопоточность
  def run_threads
    threads = []
    @links.each do |link|
      threads << Thread.new {
        get_url(link)
      }
    end
    threads.each { |t| t.join }
  end
end

spider = Spider.new

20.times do |i|
  spider.add_link("link_#{i+1}")
end

spider.run_threads
