module Journals
  class Models::Paper
    attr_accessor :doi, :title, :author, :published_at, :keywords

    def url
      "http://dx.doi.org/#{doi}"
    end

    def scrape!
      raise 'Must have a url set in order to scrape!' unless url
    end

  private

    def html
      @html ||= Journals::Client.new.get url
    end
  end
end
