var fs = require('fs-extra');
var glob = require('glob');
var lib = require('../lib');
var path = require('path');

module.exports = function(app) {

	var cacheDir = app.get('cacheDir');
	var staticDir = app.get('staticDir');

	fs.removeSync(cacheDir);
	lib.sassToCache(staticDir, cacheDir, '**/*.scss');

};