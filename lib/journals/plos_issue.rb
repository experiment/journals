module Journals
  class PlosIssue < Issue

    PAPER_CLASS = Journals::PlosPaper

    def scrape!
      super

      self.papers = papers_from(parse_paper_dois)

      self
    end

    private

      def papers_from(dois)
        dois.map do |doi|
          paper = PAPER_CLASS.new
          paper.doi = doi
          paper
        end
      end

      def parse_paper_dois
        html.css('.item .links .abstract').map do |el|
          el['data-doi'].sub(/^info:doi\//,'')
        end
      end
  end
end
