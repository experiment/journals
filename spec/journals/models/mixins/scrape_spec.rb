require 'helper'

describe Journals::Models::Mixins::Scrape do
  class ScrapeTest
    include Journals::Models::Mixins::Scrape

    attr_accessor :url
  end

  class ScrapeWithAttributesTest < ScrapeTest
    include Journals::Models::Mixins::Attributes

    attributes :jekyll, :hyde

    def parse_jekyll
      'i am jekyll'
    end
  end

  let(:instance) { ScrapeTest.new }
  let(:instance_with_attributes) { ScrapeWithAttributesTest.new }

  before { instance.url = 'url' }

  describe '#scrape!' do
    before { instance.stubs(:get_html) }

    it 'raises unless url is set' do
      instance.url = nil

      -> { instance.scrape! }.must_raise RuntimeError
    end

    it 'calls get_html' do
      instance.expects(:get_html)

      instance.scrape!
    end

    it 'calls parse' do
      instance.expects(:parse)

      instance.scrape!
    end
  end

  describe '#get_html' do
    it 'requests the url from the client' do
      Journals::Client.any_instance.expects(:get).with('url')

      instance.send :get_html
    end

    it 'sets the html ivar from the client return' do
      Journals::Client.any_instance.stubs(:get).returns('markup')

      instance.send :get_html
      instance.send(:html).must_equal 'markup'
    end
  end

  describe '#parse' do
    it 'calls parse_ for each attribute' do
      instance_with_attributes.expects(:parse_jekyll)
      instance_with_attributes.expects(:parse_hyde)

      instance_with_attributes.send :parse
    end

    it 'sets each attribute with the return value of parse_' do
      instance_with_attributes.send :parse

      instance_with_attributes.jekyll.must_equal 'i am jekyll'
      instance_with_attributes.hyde.must_be_nil
    end
  end
end
