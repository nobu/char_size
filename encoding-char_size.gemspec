# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "encoding/char_size/version"

Gem::Specification.new do |spec|
  spec.name    = "encoding-char_size"
  spec.version = Encoding::CharSize::VERSION
  spec.authors = ["Andrew Haines"]
  spec.email   = ["andrew@haines.org.nz"]

  spec.summary  = "Find an encoding's minimum and maximum character size"
  spec.homepage = "https://github.com/haines/char_size"
  spec.license  = "MIT"

  spec.files         = `git ls-files -z`.split("\0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^#{spec.bindir}/}) { |f| File.basename(f) }
  spec.extensions    = ["ext/encoding/char_size/extconf.rb"]
  spec.require_paths = ["lib"]

  #spec.add_development_dependency "bundler", "~> 1.14"
  #spec.add_development_dependency "codeclimate-test-reporter", "~> 1.0.8"
  #spec.add_development_dependency "minitest", "~> 5.0"
  #spec.add_development_dependency "pry", "~> 0.10"
  #spec.add_development_dependency "rake", "~> 12.0"
  #spec.add_development_dependency "rake-compiler", "~> 1.0"
  #spec.add_development_dependency "yard", "~> 0.9"
end
