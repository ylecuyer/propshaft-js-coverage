module Propshaft
  module Js
    module Coverage
      class Compiler < Propshaft::Compiler
        class << self
          @@context = nil

          def configure
            yield config
          end

          def config
            @config ||= Configuration.new
          end
        end

        def compile(asset, input)
          if Propshaft::Js::Coverage::Compiler.config.should_process
            return input unless Propshaft::Js::Coverage::Compiler.config.should_process.call(asset.path.to_s)
          end

          begin
            covered_source = $context.call("instrument", input, asset.path.to_s)
          rescue => e
            warn "Error instrumenting #{asset.path}: #{e}"
            return input
          end
          covered_source
        end
      end
    end
  end
end
