require 'active_support/core_ext/class/attribute'

module Journals
  module Models::Mixins
    module Attributes

      def self.included(base)
        base.extend ClassMethods

        base.class_eval do
          class_attribute :_attributes,
            instance_reader: false, instance_writer: false

          self._attributes = []
        end
      end

      module ClassMethods
        def attributes(*args)
          # Add to _attributes class attribute
          self._attributes.concat args

          # Define readers
          args.each do |attr|
            class_eval <<-RUBY
              def #{attr}
                # If not set, call respective parse method
                # e.g. for url, parse_url
                @#{attr} ||= parse_#{attr}
              end

              def parse_#{attr}
                # Default parse result is nil
                nil
              end
            RUBY
          end

          # Define writers
          attr_writer *args
        end
      end

      def attributes
        self.class._attributes
      end

    end
  end
end
