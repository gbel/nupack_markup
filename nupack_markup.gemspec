# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "nupack_markup"
  spec.version       = "0.0.1"
  spec.authors       = ["Gabe De Oliveira"]
  spec.email         = ["gabriel@olivox.ca"]
  spec.summary       = "Hello"
  spec.description   = "Library to estimate repackaging cost" 
  spec.license       = "MIT"

  spec.files         = ["lib/markup_calculator.rb"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  # Declare that the Gem is compatible with
  # version 2.0 or greater
  spec.required_ruby_version = ">= 2.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake"
end
