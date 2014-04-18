require 'helper'

describe Journals::BmcPaper do
  let(:paper) { Journals::BmcPaper.new }

  before do
    paper.doi = doi
    VCR.use_cassette ['paper', doi] { paper.scrape! }
  end

  describe 'BMC cell biology paper' do
    let(:doi) { '10.1186/1471-2121-15-6' }

    it 'should parse the title' do
      paper.title.must_equal 'CiteAb: a searchable antibody database that ranks antibodies by the number of times they have been cited'
    end

    it 'should parse the corresponding author' do
      paper.author.name.must_equal 'Andrew D Chalmers'
      paper.author.email.must_equal 'ac270@bath.ac.uk'
    end

    it 'should parse the published_at' do
      paper.published_at.must_equal Date.parse('2014-02-14')
    end

    it 'should parse the keywords' do
      paper.keywords.must_equal ['Antibodies', 'Monoclonal', 'Polyclonal',
        'Western blotting', 'Flow cytometry', 'Immunohistochemistry',
        'ChIP host species', 'Species reactivity', 'Citations']
    end
  end

  describe 'Journal of Foot and Ankle Research paper' do
    let(:doi) { '10.1186/1757-1146-7-21' }

    it 'should parse the title' do
      paper.title.must_equal 'Systematic review of chronic ankle instability in children'
    end

    it 'should parse the corresponding author' do
      paper.author.name.must_equal 'Melissa  Mandarakas'
      paper.author.email.must_equal 'Melissa.Mandarakas@sydney.edu.au'
    end

    it 'should parse the published_at' do
      paper.published_at.must_equal Date.parse('2014-03-19')
    end

    it 'should parse the keywords' do
      paper.keywords.must_equal ['Ankle', 'pediatrics', 'joint instability',
        'sprains and strains']
    end
  end
end
