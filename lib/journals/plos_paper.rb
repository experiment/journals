module Journals
  class PlosPaper < Models::Paper

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
        el = html.css('.authors .corresponding').first.ancestors('li')
        name = el.css('.author .person').children.first.text.strip
        email = el.css('.author_meta a').text
        location = el.css('p')[1].text.sub(/affiliation:/i,'').strip

        { name: name, email: email, location: location }
      end

      def parse_published_at
        Date.parse extract_metadata('citation_date')
      end

      def parse_keywords
        html.css('ul#subject-area-sidebar-list .flagText').map(&:text)
      end

      def parse_journal
        extract_metadata 'citation_journal_title'
      end

      def extract_metadata(name)
        html.css("meta[name=#{name}]").first['content']
      end
  end
end
