# Journals

Gem for scraping journals

## Installation

Add journals to your gemfile. You'll need a authenticated git pull url to do so.

## Usage

    issue = Journals::BmcIssue.new url: 'url'
    issue.scrape!

    paper = issue.papers.first
    paper.scrape!

## Testing

    rake test

## Releasing

First, update the changelog and bump the version (using semver)

Then, to release:

    rake release
