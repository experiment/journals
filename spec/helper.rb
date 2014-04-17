require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/pride'

require 'mocha/setup'

require 'vcr'

require 'pry'

require 'journals'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end
