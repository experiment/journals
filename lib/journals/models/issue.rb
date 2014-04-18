module Journals
  class Models::Issue < Models::Base
    include Models::Mixins::Attributes
    include Models::Mixins::Scrape

    attributes :url, :papers

  end
end
