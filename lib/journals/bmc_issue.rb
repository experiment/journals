module Journals
  class BmcIssue < Models::Issue

    PAPER_CLASS = Journals::BmcPaper

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
      end
  end
end
