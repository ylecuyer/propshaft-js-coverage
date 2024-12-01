# frozen_string_literal: true

require "propshaft"
require "mini_racer"
require_relative "coverage/version"
require_relative "coverage/configuration"
require_relative "coverage/compiler"

$context = MiniRacer::Context.new
$context.eval("var instrument, instrumenterReady = false;")
gem_root = File.expand_path '../../../..', __FILE__
$context.load(File.expand_path("#{gem_root}/js/instrumenter/dist/main.js"))

# wait for the instrumenter to be ready
5.times do
  ready = $context.eval("instrumenterReady")
  break if ready
  sleep(1)
end

module Propshaft
  module Js
    module Coverage
      class Error < StandardError; end
      # Your code goes here...
    end
  end
end
