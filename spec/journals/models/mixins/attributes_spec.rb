require 'helper'

describe Journals::Models::Mixins::Attributes do
  class Test
    include Journals::Models::Mixins::Attributes

    attributes :one, :two, :three

    def parse_one
      'i am one'
    end
  end

  let(:instance) { Test.new }

  describe '#attributes' do
    it 'returns a list of attributes' do
      instance.attributes.must_equal %i(one two three)
    end
  end

  describe 'attributes' do
    it 'should call parse_attr on read' do
      instance.one.must_equal 'i am one'
    end

    it 'should default to nil' do
      instance.two.must_be_nil
    end

    it 'should be writable' do
      instance.three = 1234

      instance.three.must_equal  1234
    end
  end
end
