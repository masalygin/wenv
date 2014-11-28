var fs = require('fs-extra');
var lib = require('../lib');
var path = require('path');

module.exports = function(app) {

	var cacheDir = app.get('cacheDir');
	var staticDir = app.get('staticDir');

	fs.removeSync(cacheDir);
	lib.cache.dir = cacheDir;
	lib.cache.sass.add(staticDir);

	fs.ensureDir(path.join(cacheDir, 'templates_c'));

};