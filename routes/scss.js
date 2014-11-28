var sass = require('node-sass');
var path = require('path');
var url = require('url');
var lib = require('../lib');

app.get(/^(.+\.scss\.css)(\?.*)?$/, function (req, res) {

	var uri = url.parse(req.originalUrl);
	var cssFile = path.join(CACHE_DIR, 'site/images', uri.pathname.split('/images/')[1]);
	var scssFile = cssFile.replace(/\.scss\.css$/, '.scss');

	sass.renderFile({
		file: scssFile,
		outFile: cssFile,
		includePaths: [
			path.join(CACHE_DIR, 'site/images'),
			path.join(CACHE_DIR, 'g'),
			SASS_DIR
		],
		success: function () {
			res.sendfile(cssFile);
		},
		error: function(err) {
			lib.sendError(scssFile + '\n' + err, res);
		}
	});

});