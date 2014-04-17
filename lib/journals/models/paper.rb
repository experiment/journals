module Journals
  class Models::Paper < Models::Base
    attr_accessor :doi, :title, :author, :published_at, :keywords

    def url
      "http://dx.doi.org/#{doi}"
    end
  end
end
