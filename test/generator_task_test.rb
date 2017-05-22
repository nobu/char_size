# frozen_string_literal: true

require_relative "test_helper"

require "char_size/rake/generator_task"

class GeneratorTaskTest < Minitest::Test
  include Rake::DSL

  def setup
    Rake.application.clear
    @tmpdir = Dir.mktmpdir
    Dir.chdir @tmpdir
  end

  def teardown
    FileUtils.remove_entry @tmpdir
  end

  def test_with_defaults
    CharSize::Rake::GeneratorTask.new

    Rake::Task[:char_size].invoke

    source = File.read("lib/char_size.rb")
    assert_includes source, "rake char_size"

    char_size = load_module(source)
    assert_equal [1, 6], char_size.minmax("UTF-8")
    assert_equal [1, 6], char_size.minmax(Encoding::UTF_8)
  end

  def test_with_custom_name_via_constructor
    CharSize::Rake::GeneratorTask.new :generate_char_size

    Rake::Task[:generate_char_size].invoke

    source = File.read("lib/char_size.rb")
    assert_includes source, "rake generate_char_size"

    char_size = load_module(source)
    assert_equal [1, 6], char_size.minmax("UTF-8")
    assert_equal [1, 6], char_size.minmax(Encoding::UTF_8)
  end

  def test_with_custom_name_via_accessor
    CharSize::Rake::GeneratorTask.new do |task|
      task.name = :generate_char_size
    end

    Rake::Task[:generate_char_size].invoke

    source = File.read("lib/char_size.rb")
    assert_includes source, "rake generate_char_size"

    char_size = load_module(source)
    assert_equal [1, 6], char_size.minmax("UTF-8")
    assert_equal [1, 6], char_size.minmax(Encoding::UTF_8)
  end

  def test_in_namespace
    namespace :generate do
      CharSize::Rake::GeneratorTask.new
    end

    Rake::Task["generate:char_size"].invoke

    source = File.read("lib/char_size.rb")
    assert_includes source, "rake generate:char_size"

    char_size = load_module(source)
    assert_equal [1, 6], char_size.minmax("UTF-8")
    assert_equal [1, 6], char_size.minmax(Encoding::UTF_8)
  end

  def test_with_custom_destination
    CharSize::Rake::GeneratorTask.new do |task|
      task.destination = "some/other/file.rb"
    end

    Rake::Task[:char_size].invoke

    source = File.read("some/other/file.rb")
    assert_includes source, "rake char_size"

    char_size = load_module(source)
    assert_equal [1, 6], char_size.minmax("UTF-8")
    assert_equal [1, 6], char_size.minmax(Encoding::UTF_8)
  end

  private

  def load_module(source)
    namespace = Module.new
    namespace.module_eval source
    namespace::CharSize
  end
end
