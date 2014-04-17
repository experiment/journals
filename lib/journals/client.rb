require 'httparty'
require 'nokogiri'

module Journals
  class Client

    # Returns parsed page
    def get(url)
      html = HTTParty.get url

      parse html
    end

    private

      def parse(html)
        Nokogiri::HTML.parse html
      end
  end
end
