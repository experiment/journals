require "journals/client"

require "journals/paper"

require "journals/paper_scraper"

require "journals/plos_paper"

require "journals/version"

module Journals
  def self.scrape_paper!(doi)
    Journals::PaperScraper.new(doi).scrape!
  end
end
