module Journals
  class Paper
    attr_accessor :url, :doi, :title, :author, :published_at, :keywords

    def scrape!
      raise 'Must have a url set in order to scrape!' unless url
    end

  private

    def html
      @html ||= Journals::Client.new.get @url
    end
  end
end
