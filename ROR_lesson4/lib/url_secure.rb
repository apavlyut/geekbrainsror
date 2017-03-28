class Url_secure

  def initialize(url)
    @url = url
  end

# переводим ссылку в https://

  def secure_method

    puts ("В целях безопасности ваша ссылка переведена на https://")

      if @url.index("http://") == 0

        url = "https://" + @url[7..@url.size]

          puts ("Ваша ссылка " + url)

      elsif @url.index("https://") == 0

        url = @url

          puts ("Ваша ссылка " + url)

      else

        url = "https://" + @url[0..@url.size]

          puts ("Ваша ссылка " + url)

      end

    url

  end
end
