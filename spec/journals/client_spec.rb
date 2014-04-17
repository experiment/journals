require 'helper'

describe Journals::Client do
  let(:client) { Journals::Client.new }

  describe '#get' do
    let(:url) { 'ryan.com' }

    it 'returns parsed html' do
      HTTParty.expects(:get).with(url).returns("<h1 class='title'>Ryan</h1>")

      html = client.get url

      html.css('h1.title').wont_be_empty
      html.css('h1.title').text.must_equal 'Ryan'
    end
  end
end
