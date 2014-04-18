module Journals
  class Models::Issue < Models::Base
    include Models::Mixins::Attributes

    attributes :url, :papers

  end
end
