require 'helper'

describe Journals::BmcIssue do
  let(:issue) { Journals::BmcIssue.new }

  describe '#parse' do
    before do
      issue.url = url
      VCR.use_cassette ['issue', url] { issue.scrape! }
    end

    describe 'Parasites & Vectors February 2014 issue' do
      let(:url) { 'http://www.parasitesandvectors.com/content/7/February/2014' }

      it 'should parse the papers' do
        issue.papers.count.must_equal 21
        issue.papers.first.must_be_instance_of Journals::BmcPaper
        issue.papers.first.url.must_equal 'http://www.parasitesandvectors.com/content/7/1/82'
        issue.papers.last.url.must_equal 'http://www.parasitesandvectors.com/content/7/1/58'
      end
    end

    describe 'BMC Bioinformatics April 2007 issue' do
      let(:url) { 'http://www.biomedcentral.com/bmcbioinformatics/content/8/April/2007' }

      it 'should parse the papers' do
        issue.papers.count.must_equal 16
        issue.papers.first.must_be_instance_of Journals::BmcPaper
        issue.papers.first.url.must_equal 'http://www.biomedcentral.com/1471-2105/8/141'
        issue.papers.last.url.must_equal 'http://www.biomedcentral.com/1471-2105/8/113'
      end
    end
  end
end
