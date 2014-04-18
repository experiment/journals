module Journals
  class BmcIssue < Models::Issue

    PAPER_CLASS = Journals::BmcPaper

    def parse
      self.papers = papers_from(parse_paper_urls)
    end

    private

      def papers_from(urls)
        urls.map do |url|
          PAPER_CLASS.new url: url
        end
      end

      def parse_paper_urls
        html.css('.articles-feed tr').select do |el|
          el.css('.article-type').text =~ /^research/i
        end.map do |el|
          el.css('.article-title a').first['href']
        end
      end
  end
end
