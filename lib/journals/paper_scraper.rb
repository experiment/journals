module Journals
  class PaperScraper
    def initialize(doi)
      @doi = doi
    end

    def scrape!
      if type
        paper.scrape!
      else
        raise 'No scraper for this type'
      end
    end

    private

      def paper
        p = type.new
        p.doi = @doi
        p
      end

      def type
        case @doi
        when /^10\.1371\//
          PlosPaper
        end
      end
  end
end
