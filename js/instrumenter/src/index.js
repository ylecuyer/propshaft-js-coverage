var { createInstrumenter } = require('istanbul-lib-instrument')

var instrumenter = createInstrumenter({
  esModules: true,
  coverageGlobalScopeFunc: false,
  coverageGlobalScope: 'window',
})

instrument = function(input, path) {
  return instrumenter.instrumentSync(input, path);
}

instrumenterReady = true
