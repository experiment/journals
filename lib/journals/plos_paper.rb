module Journals
  class PlosPaper < Paper
    def scrape!
      super

      self.title = parse_title
    end

    private

      # def parse_doi
      #   html.css('meta[name=citation_doi]').first.attributes['content'].value
      # end

      def parse_title
        html.css('meta[name=citation_title]').first.attributes['content'].value
      end

      # def parse_keywords
      #   html.css('ul#subject-area-sidebar-list .flagText').map(&:text)
      # end
  end
end
