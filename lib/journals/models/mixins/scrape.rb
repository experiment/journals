module Journals
  module Models::Mixins
    module Scrape

      def scrape!
        raise 'Must have a url set in order to scrape!' unless url

        get_html

        self
      end

      private

        attr_reader :html

        def get_html
          @html = Journals::Client.new.get url
        end

    end
  end
end
