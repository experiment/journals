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

          attr_accessor *args

          # Define default parse_ methods
          # Returning nil
          args.each do |attr|
            class_eval <<-RUBY
              def parse_#{attr}
                nil
              end
            RUBY
          end
        end
      end

      def attributes
        self.class._attributes
      end
    end
  end
end
