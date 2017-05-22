# frozen_string_literal: true

require "char_size"
require "erb"
require "rake"
require "rake/tasklib"

module CharSize
  module Rake
    # A Rake task to generate a static copy of the {CharSize} module.
    # This means that the +char_size+ gem can be used as a development dependency rather than a runtime dependency.
    class GeneratorTask < ::Rake::TaskLib
      # The name of the task. Defaults to +:char_size+.
      # @return [String, Symbol] the task name
      attr_accessor :name

      # The path of the generated file. Defaults to +"lib/char_size.rb"+.
      # @return [String] the file path
      attr_accessor :destination

      # Defines a new {CharSize} module generator task.
      # @param name [String, Symbol] the name of the task
      # @yield [self] allowing any options to be modified on the task
      def initialize(name = :char_size)
        @name = name
        @destination = "lib/char_size.rb"

        yield self if block_given?

        define
      end

      private

      def define
        desc "Generate static CharSize module" unless ::Rake.application.last_description
        task(name) do |task|
          FileUtils.mkdir_p File.dirname(destination)
          File.write destination, template.result(assigns(task).instance_eval { binding })
        end
      end

      def template
        ERB.new(File.read(File.expand_path("char_size.rb.erb", __dir__)))
      end

      def assigns(task)
        Assigns.new(task_name: task.name)
      end

      class Assigns
        def initialize(task_name:)
          @task_name = task_name
        end
      end
      private_constant :Assigns
    end
  end
end
