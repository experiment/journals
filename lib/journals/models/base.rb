module Journals
  class Models::Base

    def initialize(params = {})
      # init with given params
      # stolen from ActiveModel::Model
      params.each do |attr, value|
        self.public_send "#{attr}=", value
      end if params
    end
  end
end
