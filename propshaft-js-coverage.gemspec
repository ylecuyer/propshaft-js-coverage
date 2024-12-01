# frozen_string_literal: true

require_relative "lib/propshaft/js/coverage/version"

Gem::Specification.new do |spec|
  spec.name = "propshaft-js-coverage"
  spec.licenses = ['MIT']
  spec.version = Propshaft::Js::Coverage::VERSION
  spec.authors = ["Yoann Lecuyer"]
  spec.email = ["yoann.lecuyer@gmail.com"]

  spec.summary = "Add coverage to your JavaScript files"
  spec.description = "Adds a propshaft compiler to add coverage to your JavaScript files"
  spec.homepage = "https://github.com/ylecuyer/propshaft-js-coverage"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  spec.files = []
  spec.files += Dir["lib/**/*"]
  spec.files << "js/instrumenter/dist/main.js"
  spec.files << "CHANGELOG.md"
  spec.files << "README.md"
  spec.files << "LICENSE"

  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "propshaft", "~> 1.1.0"
  spec.add_dependency "mini_racer", "~> 0.16.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
