require 'helper'

describe Journals::BmcPaper do
  let(:paper) { Journals::BmcPaper.new }

  before do
    paper.doi = doi

    # Use private get_html rather than scrape! so we don't
    # parse all the attributes (via calling parse)
    VCR.use_cassette ['paper', doi] { paper.send :get_html }
  end

  describe 'BMC cell biology paper' do
    let(:doi) { '10.1186/1471-2121-15-6' }

    it 'should parse the title' do
      paper.send(:parse_title).must_equal 'CiteAb: a searchable antibody database that ranks antibodies by the number of times they have been cited'
    end

    it 'should parse the corresponding author' do
      author = paper.send(:parse_author)

      author.name.must_equal 'Andrew D Chalmers'
      author.email.must_equal 'ac270@bath.ac.uk'
      author.location.must_equal 'Department of Biology and Biochemistry, University of Bath, Bath BA2 7AY, UK'
    end

    it 'should parse the published_at' do
      paper.send(:parse_published_at).must_equal Date.parse('2014-02-14')
    end

    it 'should parse the keywords' do
      paper.send(:parse_keywords).must_equal ['Antibodies', 'Monoclonal', 'Polyclonal',
        'Western blotting', 'Flow cytometry', 'Immunohistochemistry',
        'ChIP host species', 'Species reactivity', 'Citations']
    end
  end

  describe 'Journal of Foot and Ankle Research paper' do
    let(:doi) { '10.1186/1757-1146-7-21' }

    it 'should parse the title' do
      paper.send(:parse_title).must_equal 'Systematic review of chronic ankle instability in children'
    end

    it 'should parse the corresponding author' do
      author = paper.send(:parse_author)

      author.name.must_equal 'Melissa Mandarakas'
      author.email.must_equal 'Melissa.Mandarakas@sydney.edu.au'
      author.location.must_equal 'Arthritis and Musculoskeletal Research Group, Faculty of Health Sciences, The University of Sydney, PO Box 170, Lidcombe, NSW 1825, Australia'
    end

    it 'should parse the published_at' do
      paper.send(:parse_published_at).must_equal Date.parse('2014-03-19')
    end

    it 'should parse the keywords' do
      paper.send(:parse_keywords).must_equal ['Ankle', 'pediatrics', 'joint instability',
        'sprains and strains']
    end
  end
end
