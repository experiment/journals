module Journals
  class BmcPaper < Models::Paper

    private

      def parse_doi
        extract_metadata 'citation_doi'
      end

      def parse_title
        extract_metadata 'citation_title'
      end

      def parse_author
        Journals::Models::Author.new parse_corresponding_author
      end

      def parse_corresponding_author
        el = html.css('p.authors')[1]

        name = el.children[2].text.sub(/Corresponding author:/i,'').strip
        # Remove extra whitespace between names
        name = name.split.join(' ')

        email = el.css('a').text

        el = html.css('meta[name=citation_author]').find do |el|
          el['content'] == name
        end
        location = el.next['content']

        { name: name, email: email, location: location }
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
        html.css("meta[name=#{name}]").first['content']
      end
  end
end
