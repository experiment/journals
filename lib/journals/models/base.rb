module Journals
  class Models::Base

    def initialize(params = {})
      # init with given params
      # stolen from ActiveModel::Model
      params.each do |attr, value|
        self.public_send "#{attr}=", value
      end if params
    end

    def scrape!
      raise 'Must have a url set in order to scrape!' unless url
    end

    private

      def html
        @html ||= Journals::Client.new.get url
      end
  end
end
