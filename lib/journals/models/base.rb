require 'active_support/core_ext/class/attribute'

module Journals
  class Models::Base

    class_attribute :_attributes, instance_reader: false, instance_writer: false

    def self.attributes(*args)
      self._attributes = args

      attr_accessor *args
    end

    def initialize(params = {})
      # init with given params
      # stolen from ActiveModel::Model
      params.each do |attr, value|
        self.public_send "#{attr}=", value
      end if params
    end

    def attributes
      self.class._attributes
    end

    def scrape!
      raise 'Must have a url set in order to scrape!' unless url

      parse

      self
    end

    private

      def html
        @html ||= Journals::Client.new.get url
      end
  end
end
