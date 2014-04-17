module Journals
  class PlosIssue < Models::Issue

    PAPER_CLASS = Journals::PlosPaper

    def parse
      self.papers = papers_from(parse_paper_dois)
    end

    private

      def papers_from(dois)
        dois.map do |doi|
          PAPER_CLASS.new doi: doi
        end
      end

      def parse_paper_dois
        html.css('.item .links .abstract').map do |el|
          el['data-doi'].sub(/^info:doi\//,'')
        end
      end
  end
end
