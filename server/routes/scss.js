var notifier = require('node-notifier');
var sass = require('node-sass');
var path = require('path');

module.exports = function (app) {

	app.get(/^(.+\.scss\.css)$/, function (req, res) {

		var cssFile = './client/sites' + req.originalUrl;
		var scssFile = cssFile.replace(/\.scss\.css$/, '.scss');

		function error(err) {
			console.log(err);
			notifier.notify({
				title: 'wenv',
				message: scssFile + '\n' + err
			});
			res.status(404).send('404');
		}

		sass.renderFile({
			file: '.cache/site/images/' + scssFile.split('/images/')[1],
			outFile: cssFile,
			includePaths: ['./.cache/site/images', './.cache/g/', './client/resources/'],
			success: function () {
				res.sendfile(cssFile);
			},
			error: error
		});

	});

};