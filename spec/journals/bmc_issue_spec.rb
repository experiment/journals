require 'helper'

describe Journals::BmcIssue do
  let(:issue) { Journals::BmcIssue.new }

  before do
    issue.url = url

    # Use private get_html rather than scrape! so we don't
    # parse all the attributes (via calling parse)
    VCR.use_cassette ['issue', url] { issue.send :get_html }
  end

  describe 'Parasites & Vectors February 2014 issue' do
    let(:url) { 'http://www.parasitesandvectors.com/content/7/February/2014' }

    it 'should parse the papers' do
      papers = issue.send :parse_papers

      papers.count.must_equal 21
      papers.first.must_be_instance_of Journals::BmcPaper
      papers.first.url.must_equal 'http://www.parasitesandvectors.com/content/7/1/82'
      papers.last.url.must_equal 'http://www.parasitesandvectors.com/content/7/1/58'
    end
  end

  describe 'BMC Bioinformatics April 2007 issue' do
    let(:url) { 'http://www.biomedcentral.com/bmcbioinformatics/content/8/April/2007' }

    it 'should parse the papers' do
      papers = issue.send :parse_papers

      papers.count.must_equal 16
      papers.first.must_be_instance_of Journals::BmcPaper
      papers.first.url.must_equal 'http://www.biomedcentral.com/1471-2105/8/141'
      papers.last.url.must_equal 'http://www.biomedcentral.com/1471-2105/8/113'
    end
  end
end
