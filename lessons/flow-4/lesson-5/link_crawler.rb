class LinkCrawler
  def initialize
    @links = []
  end

  def links
    @links
  end

  def add_link(link)
    @links << link unless @links.include? link
  end
end
