module Journals
  class PlosPaper < Paper

    def scrape!
      super

      self.doi = parse_doi
      self.title = parse_title
      self.keywords = parse_keywords
    end

    private

      def parse_doi
        extract_metadata 'citation_doi'
      end

      def parse_title
        extract_metadata 'citation_title'
      end

      def parse_keywords
        html.css('ul#subject-area-sidebar-list .flagText').map(&:text)
      end

      def extract_metadata(name)
        html.css("meta[name=#{name}]").first.attributes['content'].value
      end
  end
end
