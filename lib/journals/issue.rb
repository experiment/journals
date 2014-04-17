module Journals
  class Issue
    attr_accessor :url, :papers

    def scrape!
      raise 'Must have a url set in order to scrape!' unless url
    end

  private

    def html
      @html ||= Journals::Client.new.get url
    end
  end
end
