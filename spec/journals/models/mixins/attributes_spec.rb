require 'helper'

describe Journals::Models::Mixins::Attributes do
  class AttributesTest
    include Journals::Models::Mixins::Attributes

    attributes :one, :two
    attributes :three
  end

  let(:instance) { AttributesTest.new }

  describe '#attributes' do
    it 'returns a list of attributes' do
      instance.attributes.must_equal %i(one two three)
    end
  end

  describe 'attributes' do
    it 'should default to nil' do
      instance.two.must_be_nil
    end

    it 'should be writable' do
      instance.three = 1234

      instance.three.must_equal  1234
    end
  end
end
