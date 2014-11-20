var sass = require('node-sass');
var path = require('path');
var lib = require('../lib');

module.exports = function (app) {

	app.get(/^(.+\.scss\.css)$/, function (req, res) {

		var cssFile = './client/sites' + req.originalUrl;
		var scssFile = cssFile.replace(/\.scss\.css$/, '.scss');


		sass.renderFile({
			file: '.cache/site/images/' + scssFile.split('/images/')[1],
			outFile: cssFile,
			includePaths: ['./.cache/site/images', './.cache/g/', './client/resources/'],
			success: function () {
				res.sendfile(cssFile);
			},
			error: function(err) {
				lib.sendError(scssFile + '\n' + err, res);
			}
		});

	});

};