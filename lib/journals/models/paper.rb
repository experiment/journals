module Journals
  class Models::Paper < Models::Base
    attr_accessor :url, :doi, :title, :author, :published_at, :keywords

    def url
      @url || "http://dx.doi.org/#{doi}"
    end
  end
end
