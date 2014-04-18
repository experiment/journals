require 'helper'

describe Journals::Models::Mixins::Scrape do
  class Test
    include Journals::Models::Mixins::Scrape

    attr_accessor :url
  end

  let(:instance) { Test.new }

  before { instance.url = 'url' }

  describe '#scrape!' do
    it 'raises unless url is set' do
      instance.url = nil

      -> { instance.scrape! }.must_raise RuntimeError
    end

    it 'calls get_html' do
      instance.expects(:get_html)

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
end
