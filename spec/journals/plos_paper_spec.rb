require 'helper'

describe Journals::PlosPaper do
  let(:paper) { Journals::PlosPaper.new }

  describe '#scrape!' do
    let(:url) { 'http://www.plosgenetics.org/article/info%3Adoi%2F10.1371%2Fjournal.pgen.1004275' }

    before do
      paper.url = url

      paper.scrape!
    end

    it 'works' do
      paper.title.must_equal 'Interplay of the Serine/Threonine-Kinase StkP and the Paralogs DivIVA and GpsB in Pneumococcal Cell Elongation and Division'
    end
  end
end
