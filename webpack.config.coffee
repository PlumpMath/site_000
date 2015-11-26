c = -> console.log.apply console, arguments
webpack = require 'webpack'
path = require 'path'

module.exports = config =
    worker:
        output:
            filename: "hash.worker.js"
            chunkFilename: "[id].hash.worker.js"
    node:
        fs: "empty"
    context: __dirname
    cache: true
    debug: true
    entry:
        #app: ['webpack/hot/dev-server', './vickers__workshop.coffee']
        app: ['./lib/site_000_.coffee']
    stats:
        colors: on
        reasons: on
    module:
        loaders: [
            {
                test: /\.glsl$/
                loader: 'webpack-glsl'
            },
            {
                test: /\.styl$/
                loader: 'style-loader!css-loader!stylus-loader'
            },
            {
                test: /\.coffee$/
                loaders: ['coffee-loader', 'source-map-loader']
            }
        ]
    output:
        path: __dirname
        filename: "build/site_000__packed.js"