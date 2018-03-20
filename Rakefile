# -*- ruby -*-

require "rubygems"
require "bundler/gem_helper"
require "packnga"

base_dir = __dir__

helper = Bundler::GemHelper.new(base_dir)
def helper.version_tag
  version
end

helper.install
spec = helper.gemspec

Packnga::DocumentTask.new(spec) do |task|
  task.original_language = "en"
  task.translate_language = "ja"
end

Packnga::ReleaseTask.new(spec) do
end

desc "Run tests"
task :test do
  cd("dependency-check") do
    ruby("-S", "rake")
  end
  ruby("test/run-test.rb")
end

task default: :test
