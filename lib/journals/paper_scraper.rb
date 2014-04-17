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
        type.new doi: @doi
      end

      def type
        case @doi
        when /^10\.1371\//
          PlosPaper
        end
      end
  end
end
