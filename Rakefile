# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/extensiontask"
require "rake/testtask"

CLEAN.include "lib/char_size/char_size.bundle"

Rake::ExtensionTask.new :char_size, Bundler::GemHelper.gemspec do |ext|
  ext.lib_dir = "lib/char_size"
end

Rake::TestTask.new :test do |t|
  t.test_files = FileList["test/**/*_test.rb"]
  t.warning = true
end

task :default => [:compile, :test]
