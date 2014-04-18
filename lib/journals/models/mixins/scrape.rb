module Journals
  module Models::Mixins
    module Scrape

      def scrape!
        raise 'Must have a url set in order to scrape!' unless url

        get_html

        parse

        self
      end

      private

        attr_reader :html

        def get_html
          @html = Journals::Client.new.get url
        end

        def parse
          if respond_to? :attributes
            attributes.each do |attr|
              send "#{attr}=", send("parse_#{attr}")
            end
          end
        end

    end
  end
end
