var path = require('path');
var webpack = require('webpack');

module.exports = {
  entry: [
    'babel-polyfill',
    './app/assets/javascripts/app-js',
  ],
  output: {
    path: __dirname + '/app/assets/javascripts',
    filename: 'app-js.js'
  },
  module: {
    loaders: [
      {
        include: path.join(__dirname, 'app-js'),
        loader: 'babel-loader',
        query: {
          presets: ['es2015']
        }
      }
    ]
  }
};
