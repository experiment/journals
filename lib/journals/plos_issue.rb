module Journals
  class PlosIssue < Models::Issue

    PAPER_CLASS = Journals::PlosPaper

    private

      def parse_papers
        parse_paper_dois.map do |doi|
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
