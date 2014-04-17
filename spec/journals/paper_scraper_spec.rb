require 'helper'

describe Journals::PaperScraper do

  describe '#type' do
    before do
      @scraper = Journals::PaperScraper.new doi
    end

    describe 'invalid doi' do
      let(:doi) { 'abcdefghijklmnopqrstuvwxyz' }

      it 'is nil' do
        @scraper.send(:type).must_be_nil
      end
    end

    describe 'plos one paper' do
      let(:doi) { '10.1371/journal.pone.0095361' }

      it 'is plos' do
        @scraper.send(:type).must_equal Journals::PlosPaper
      end
    end

    describe 'plos genetics paper' do
      let(:doi) { '10.1371/journal.pgen.1004275' }

      it 'is plos' do
        @scraper.send(:type).must_equal Journals::PlosPaper
      end
    end
  end
end
