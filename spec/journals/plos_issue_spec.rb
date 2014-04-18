require 'helper'

describe Journals::PlosIssue do
  let(:issue) { Journals::PlosIssue.new }

  before do
    issue.url = url
    VCR.use_cassette ['issue', url] { issue.scrape! }
  end

  describe 'plos genetics January 2014 issue' do
    let(:url) { 'http://www.plosgenetics.org/article/browse/issue/info:doi/10.1371/issue.pgen.v10.i01' }

    it 'should parse the papers' do
      issue.papers.count.must_equal 72
      issue.papers.first.must_be_instance_of Journals::PlosPaper
      issue.papers.first.doi.must_equal '10.1371/journal.pgen.1004042'
      issue.papers.last.doi.must_equal '10.1371/journal.pgen.1004085'
    end
  end

  describe 'plos biology April 2009 issue' do
    let(:url) { 'http://www.plosbiology.org/article/browse/issue/info:doi/10.1371/issue.pbio.v07.i04' }

    it 'should parse the papers' do
      issue.papers.count.must_equal 21
      issue.papers.first.must_be_instance_of Journals::PlosPaper
      issue.papers.first.doi.must_equal '10.1371/journal.pbio.1000082'
      issue.papers.last.doi.must_equal '10.1371/journal.pbio.1000085'
    end
  end
end
