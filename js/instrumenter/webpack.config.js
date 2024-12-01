const webpack = require('webpack');

module.exports = {
  mode: 'development',
  resolve: {
    fallback: {
      "path": require.resolve("path-browserify"),
      "crypto": require.resolve("crypto-browserify"),
      "buffer": require.resolve("buffer/"),
      "stream": require.resolve("stream-browserify"),
      "vm": require.resolve("vm-browserify"),
      "process": require.resolve("process"),
      "assert": false,
      "fs": false,
    }
  },
  plugins: [
    new webpack.ProvidePlugin({
      process: 'process/browser',
    }),
  ],
}
