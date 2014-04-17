require 'helper'

describe Journals::PlosPaper do
  let(:paper) { Journals::PlosPaper.new }

  describe '#scrape!' do
    before do
      paper.doi = doi
      VCR.use_cassette ['paper', doi] { paper.scrape! }
    end

    describe 'plos one paper' do
      let(:doi) { '10.1371/journal.pone.0095361' }

      it 'should parse the doi' do
        paper.doi.must_equal doi
      end

      it 'should parse the title' do
        paper.title.must_equal 'Chimpanzees Preferentially Select Sleeping Platform Construction Tree Species with Biomechanical Properties that Yield Stable, Firm, but Compliant Nests'
      end

      it 'should parse the published_at' do
        paper.published_at.must_equal Date.parse('2014-04-16')
      end

      it 'should parse the keywords' do
        paper.keywords.must_equal ['Chimpanzees', 'Internodes', 'Leaves',
          'Orangutans', 'Phylogenetic analysis', 'Sleep', 'Stiffness', 'Trees']
      end
    end

    describe 'plos genetics paper' do
      let(:doi) { '10.1371/journal.pgen.1004275' }

      it 'should parse the doi' do
        paper.doi.must_equal doi
      end

      it 'should parse the title' do
        paper.title.must_equal 'Interplay of the Serine/Threonine-Kinase StkP and the Paralogs DivIVA and GpsB in Pneumococcal Cell Elongation and Division'
      end

      it 'should parse the published_at' do
        paper.published_at.must_equal Date.parse('2014-04-10')
      end

      it 'should parse the keywords' do
        paper.keywords.must_equal ['Cell cycle and cell division', 'Cell fusion',
          'Fluorescence imaging', 'Multiple alignment calculation',
          'Phase contrast microscopy', 'Phosphorylation', 'Pneumococcus',
          'Sequence alignment']
      end
    end
  end
end
