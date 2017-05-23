# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/extensiontask"
require "rake/testtask"
require "yard"

CLEAN.include "lib/encoding/char_size."+RbConfig::CONFIG["DLEXT"]

Rake::ExtensionTask.new "encoding/char_size", Bundler::GemHelper.gemspec do |ext|
end

Rake::TestTask.new :test do |t|
  t.test_files = FileList["test/**/*_test.rb"]
  t.warning = true
end

YARD::Rake::YardocTask.new

task :default => [:compile, :test]
