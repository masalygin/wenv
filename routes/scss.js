var sass = require('node-sass');
var path = require('path');
var url = require('url');
var lib = require('../lib');

module.exports = function (app) {

	var workDir = app.get('workDir');
	var cacheDir = app.get('cacheDir');
	var sassDir = app.get('sassDir');

	app.get(/^(.+\.scss\.css)(\?.*)?$/, function (req, res) {

		var uri = url.parse(req.originalUrl);
		var cssFile = path.join(cacheDir, 'site/images', uri.pathname.split('/images/')[1]);
		var scssFile = cssFile.replace(/\.scss\.css$/, '.scss');

		sass.renderFile({
			file: scssFile,
			outFile: cssFile,
			includePaths: [
				path.join(cacheDir, 'site/images'),
				path.join(cacheDir, 'g'),
				sassDir
			],
			success: function () {
				res.sendfile(cssFile);
			},
			error: function(err) {
				lib.sendError(scssFile + '\n' + err, res);
			}
		});

	});

};