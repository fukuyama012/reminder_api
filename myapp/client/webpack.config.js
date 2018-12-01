const path = require('path');
const webpack = require('webpack');
const DEV_PORT = process.env.PORT || 3500

module.exports = {
    entry: {
        app: [
            './src/index.tsx'
        ]
    },
    devtool: 'inline-source-map',
    output: {
        filename: '[name].bundle.js',
        chunkFilename: '[name].bundle.js',
        path: __dirname + '/../public',
        publicPath: '/'
    },
    devServer: {
        contentBase: '../public/',
        historyApiFallback: true,
        port: DEV_PORT,
        host: "0.0.0.0",// for Docker access
        proxy: {
            "/api": "http://localhost:3000",
            "/atuh": "http://localhost:3000"
        }
    },
    module: {
        rules: [
            {
                test: /\.tsx?$/,
                use: 'ts-loader',
                exclude: /node_modules/
            }
        ]
    },
    resolve: {
        extensions: ['.tsx', '.ts', '.js']
    }
}