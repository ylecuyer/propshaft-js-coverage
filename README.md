# Installation

Add this line to your application's Gemfile:

```ruby
gem 'propshaft-js-coverage'
```

Add the compiler to propshaft

```ruby
# config/initializers/assets.rb

if ENV["COVERAGE"]
  Propshaft::Js::Coverage::Compiler.configure do |config|
    config.should_process = ->(path) {
      return false if path.match?(/vendor\/assets\//)
      return false if path.match?(/gems\//)
      return true
    }
  end

  Rails.application.config.assets.compilers << [
    "text/javascript", Propshaft::Js::Coverage::Compiler
  ]
end
```

Get the coverage reports after running your tests

```ruby
# test/application_system_test_case.rb

require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
def teardown
    __coverage__ = page.evaluate_script <<-JS
        JSON.stringify((typeof __coverage__ !== 'undefined') ? __coverage__ : null)
    JS

    if __coverage__ != "null"
      File.write("#{JS_COVERAGE_DIR}/#{Time.now.to_i.to_s}.json", __coverage__)
    end

    super
  end
end
```

Convert to lcov and generate html report

```bash
nyc report --reporter=lcov --temp-dir tmp/js-coverage --report-dir tmp/js-coverage
genhtml -q -o ./coverage ./tmp/js-coverage/lcov.info ./coverage/lcov/simplecov.lcov
```

# How it works

This gem uses istanbul instrumenter to add coverage to your javascript files. It will add a global variable `__coverage__` to your javascript files. You can then use this variable to get the coverage report.

# Configuration

TBD

# Contributing

Clone the repo and run `bundle install` to install the dependencies.

Prepare the js script by running `yarn install` and `yarn run build` in the `js/instrumenter` directory.

# Release

Run `./scripts/release.sh` to release a new version after updating the version in `lib/propshaft/js/coverage/version.rb`.
