require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'spec'
  t.pattern = 'spec/**/*_spec.rb'
end


desc 'load up a PRY console'
task :console do
  require 'pry'
  require 'journals'

  Pry.start
end

desc 'Run specs'
task :default => [:test]

module Bundler
  class GemHelper
    protected

      def rubygem_push(path)
        p "WOULD HAVE PUSHED: #{path}"
      end
  end
end
