module Journals
  class BmcPaper < Models::Paper

    def parse
      self.doi = parse_doi
      self.title = parse_title
      self.author = Journals::Models::Author.new(parse_corresponding_author)
      self.published_at = parse_published_at
      self.keywords = parse_keywords
    end

    private

      def parse_doi
        extract_metadata 'citation_doi'
      end

      def parse_title
        extract_metadata 'citation_title'
      end

      def parse_corresponding_author
        el = html.css('p.authors')[1]
        name = el.children[2].text.sub(/Corresponding author:/i,'').strip
        email = el.css('a').text

        { name: name, email: email }
      end

      def parse_published_at
        Date.parse extract_metadata('citation_date')
      end

      def parse_keywords
        html.css('#keywords').text.sub(/Keywords:/i,'').split(/;/).map do |el|
          el.strip
        end
      end

      def extract_metadata(name)
        html.css("meta[name=#{name}]").first.attributes['content'].value
      end
  end
end
