var fs = require('fs-extra');
var glob = require('glob');
var lib = require('../lib');
var path = require('path');

module.exports = function(app) {

	var cacheFolder = app.get('cacheFolder');
	var staticFolder = app.get('staticFolder');

	fs.removeSync(cacheFolder);
	lib.scssGlobalReplace(staticFolder, cacheFolder, '**/*.scss');


	//glob.sync()
	//
	//	utils.replace({
	//		glob: './client/resources/g/**/*.scss',
	//		dest: './.cache/g/',
	//		search: /global:\//g,
	//		replacement: ''
	//	});


};