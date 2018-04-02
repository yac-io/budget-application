const {environment} = require('@rails/webpacker');
const vue = require('vue');

const webpack = require('webpack');

environment.plugins.append('Provide', new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
}));


environment.loaders.append('vue', vue);
module.exports = environment;
