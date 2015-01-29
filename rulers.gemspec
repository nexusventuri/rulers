# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rulers/version'

Gem::Specification.new do |spec|
  spec.name          = "rulers"
  spec.version       = Rulers::VERSION
  spec.authors       = ["Ken Alex Fassone"]
  spec.email         = ["nexusventure@gmail.com"]
  spec.summary       = %q{Following the guidance of the "Rebuilding rails book"}
  spec.description   = %q{This is a rails-like framework, built based on the book "Rebuilding rails"}
  spec.homepage      = "https://github.com/nexusventuri/rulers"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_runtime_dependency "rack", "~> 1.6"
end
